//
//  HOVideoPlayer.m
//  HiosOC
//
//  Created by a on 2021/7/15.
//

#import "HOVideoPlayer.h"
#import <AVFoundation/AVFoundation.h>
@interface HOVideoPlayer()
@property(nonatomic,strong,readwrite) AVPlayer *avPlayer;
@property(nonatomic,strong,readwrite) AVPlayerItem *videoItem;
@property(nonatomic,strong,readwrite) AVPlayerLayer *playLayer;
@end

@implementation HOVideoPlayer
+ (HOVideoPlayer *)Player{
    static HOVideoPlayer *player;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        player = [[HOVideoPlayer alloc] init];
    });
    return player;
    
}
-(void)playVideoWithUrl:(NSString *)videoUrl attcahView:(UIView *)attcahView{
    //销毁之前的
    [self _stopPlay];
    
    NSURL *videoURL = [NSURL URLWithString:videoUrl];
    //生成model
    AVAsset *asset = [AVAsset assetWithURL:videoURL];
    
    //上层封装
    _videoItem = [AVPlayerItem playerItemWithAsset:asset];
    //还是要做dealloc销毁
    [_videoItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
    //监听缓冲
    [_videoItem addObserver:self forKeyPath:@"loadedTimeRanges" options:NSKeyValueObservingOptionNew context:nil];
    
    //时长
    CMTime duration = _videoItem.duration;
    CGFloat videoDuration = CMTimeGetSeconds(duration);
    
    _avPlayer = [AVPlayer playerWithPlayerItem:_videoItem];
    //播放状态的回调 系统提供了一个block
    //这里设置一秒回调一次 主线程
    [_avPlayer addPeriodicTimeObserverForInterval:CMTimeMake(1,1) queue:dispatch_get_main_queue() usingBlock:^(CMTime time) {
        NSLog(@"播放进度：%f",CMTimeGetSeconds(time));
    }];
    
    _playLayer = [AVPlayerLayer playerLayerWithPlayer:_avPlayer];
    
    _playLayer.frame = attcahView.bounds;
    [attcahView.layer addSublayer:_playLayer];
    
    
    //注册事件 单例生存周期帅整个app
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_handlePlayEnd) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
    //[_avPlayer play];}
}
#pragma mark - private method
-(void)_stopPlay{
    //自己销毁
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    //这里是播放完注销
    [_playLayer removeFromSuperlayer];
    
    [_videoItem removeObserver:self forKeyPath:@"status"];
    [_videoItem removeObserver:self forKeyPath:@"loadedTimeRanges"];
    _videoItem = nil;
    
    _avPlayer = nil;
    NSLog(@"");
}

-(void)_handlePlayEnd{

    //播放完接着放
    [_avPlayer seekToTime:CMTimeMake(0, 1)]; //时间到00:00
    [_avPlayer play];
    
}

#pragma mark -kvo
//检查播放资源
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if([keyPath isEqualToString:@"status"]){
        if(((NSNumber *)[change objectForKey:NSKeyValueChangeNewKey]).integerValue == AVPlayerItemStatusReadyToPlay){
            [_avPlayer play];
        }else{
            NSLog(@"");
        }
    }else if ([keyPath isEqualToString:@"loadedTimeRanges"]){
        NSLog(@"缓冲：%@",[change objectForKey:NSKeyValueChangeNewKey]);
    }
}

@end
