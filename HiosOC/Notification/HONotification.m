//
//  HONotification.m
//  HiosOC
//
//  Created by a on 2021/7/19.
//

#import "HONotification.h"
#import <UIKit/UIKit.h>
#import <UserNotifications/UserNotifications.h>
@interface HONotification()<UNUserNotificationCenterDelegate>

@end

@implementation HONotification
+(HONotification *)notificationManager{
    static HONotification *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        manager = [[HONotification alloc]init];
    });
    return manager;
}
-(void)checkNotificationAuthorization{
    UNUserNotificationCenter *center= [UNUserNotificationCenter currentNotificationCenter];
    center.delegate = self;
    [center requestAuthorizationWithOptions:UNAuthorizationOptionBadge | UNAuthorizationOptionSound completionHandler:^(BOOL granted, NSError * _Nullable error) {
        //如果获取权限就触发一次
        if(granted){
            //本地推送 推出notification
            [self _pushLocalNotification];
            //远程推送 在主线程完成
            dispatch_async(dispatch_get_main_queue(), ^{
                [[UIApplication sharedApplication] registerForRemoteNotifications];
            });
        }
    }];
}

#pragma mark -
-(void)_pushLocalNotification{
    UNMutableNotificationContent *conent = [[UNMutableNotificationContent alloc]init];
    conent.badge = @(1);
    conent.title = @"三行情书";
    conent.body = @"螃蟹在剥我的壳，笔记在写我，漫天的我落在枫叶上雪上，而你在想我";
    
    UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:30.f repeats:NO];
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:@"_pushLocalNotification" content:conent trigger:trigger];
    
    //交给center
    [[UNUserNotificationCenter currentNotificationCenter] addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
        NSLog(@"");
    }];
}
@end
