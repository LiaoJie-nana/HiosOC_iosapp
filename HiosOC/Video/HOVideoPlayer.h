//
//  HOVideoPlayer.h
//  HiosOC
//
//  Created by a on 2021/7/15.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HOVideoPlayer : NSObject
+ (HOVideoPlayer *)Player;
-(void)playVideoWithUrl:(NSString *)videoUrl attcahView:(UIView *)attcahView;
@end

NS_ASSUME_NONNULL_END
