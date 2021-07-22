//
//  HOPlayerViewController.m
//  HiosOC
//
//  Created by a on 2021/7/19.
//

#import "HOPlayerViewController.h"

@interface HOPlayerViewController ()

@end

@implementation HOPlayerViewController
-(instancetype)init{
    self = [super init];
    if(self){
        self.tabBarItem.title = @"播放器";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *videourl = [NSURL URLWithString:@"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"];
    AVPlayer *player = [[AVPlayer alloc] initWithURL:videourl];
    self.player = player;
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
