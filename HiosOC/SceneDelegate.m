//
//  SceneDelegate.m
//  HiosOC
//
//  Created by a on 2021/6/29.
//

#import "SceneDelegate.h"
#import "HONewsViewController.h"
#import "HOVideoViewController.h"
#import "HOPlayerViewController.h"
#import "HONotification.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    UIWindowScene *windowScene = (UIWindowScene*)scene;//想问这句什么意思
    self.window = [[UIWindow alloc] initWithWindowScene:windowScene];
    self.window.frame = windowScene.coordinateSpace.bounds;
    UITabBarController *tabbarController = [ [UITabBarController alloc] init];
    
    HONewsViewController *newscontroller = [[HONewsViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:newscontroller];
    navigationController.tabBarItem.title = @"新闻";
    
    HOVideoViewController *videocontroller = [[HOVideoViewController alloc] init];
    
    videocontroller.tabBarItem.title = @"视频";
    
    HOPlayerViewController *Playercontroller = [[HOPlayerViewController alloc] init];

    
    
    UIViewController *controller4 = [[UIViewController alloc] init];
    controller4.view.backgroundColor = [UIColor grayColor];
    controller4.tabBarItem.title = @"待定";
    [tabbarController setViewControllers:@[navigationController,videocontroller,Playercontroller,controller4]];
    self.window.rootViewController = tabbarController;
    [self.window makeKeyAndVisible];
    
    
    [[HONotification notificationManager] checkNotificationAuthorization];
}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end
