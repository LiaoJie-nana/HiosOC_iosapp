//
//  HONotification.h
//  HiosOC
//
//  Created by a on 2021/7/19.
//

#import <Foundation/Foundation.h>

/*
 app推送管理
 */
NS_ASSUME_NONNULL_BEGIN

@interface HONotification : NSObject
+(HONotification *)notificationManager;
-(void)checkNotificationAuthorization;
@end

NS_ASSUME_NONNULL_END
