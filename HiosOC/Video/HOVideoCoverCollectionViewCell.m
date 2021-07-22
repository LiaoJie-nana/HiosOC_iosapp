//
//  HOVideoCoverCollectionViewCell.m
//  HiosOC
//
//  Created by a on 2021/7/15.
//

#import "HOVideoCoverCollectionViewCell.h"
#import "HOVideoPlayer.h"
#import "HOVideoToolbar.h"
#import "HOVideoListItem.h"
@interface HOVideoCoverCollectionViewCell()

@property(nonatomic,strong,readwrite) UIImageView *coverView;
@property(nonatomic,strong,readwrite) UIImageView *playButton;
@property(nonatomic,strong,readwrite) NSString *videoUrl;
@property(nonatomic,strong,readwrite) HOVideoToolbar *toolbar;

@end

@implementation HOVideoCoverCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if(self){
        [self addSubview:({
            _coverView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,frame.size.width,frame.size.height - HOVideoToolbarHeight)];
            _coverView;
        })];
        [self addSubview:({
            _playButton = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width-50)/2,(frame.size.height - 50 - HOVideoToolbarHeight)/2,50,50)];
            _playButton;
        })];
        //粘贴toolbar
        [self addSubview:({
            _toolbar = [[HOVideoToolbar alloc]initWithFrame:CGRectMake(0, _coverView.bounds.size.height, frame.size.width, HOVideoToolbarHeight)];
            _toolbar;
        })];
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_tapToPlay)];
        [self addGestureRecognizer:tapGesture];
        

    }
    return self;
}

#pragma mark - public

-(void) layoutTableViewCellWithItem:(HOVideoListItem *)item{
    _coverView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:item.url]]];
    _playButton.image = [UIImage imageNamed:@"play"];
    //
    //_videoUrl = item.video_url;
    _videoUrl = @"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4";
    [_toolbar layoutWithModel:nil];
    
}

#pragma mark -private method
-(void) _tapToPlay{
    [[HOVideoPlayer Player] playVideoWithUrl:_videoUrl attcahView:_coverView];
}
@end
