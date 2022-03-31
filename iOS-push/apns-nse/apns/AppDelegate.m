//
//  AppDelegate.m
//  apns
//
//  Created by MacOS on 2020/3/30.
//  Copyright © 2020 future.com. All rights reserved.
//

#import "AppDelegate.h"
#import <PushKit/PushKit.h>
#import <UserNotifications/UserNotifications.h>

@interface AppDelegate () <UNUserNotificationCenterDelegate>

@end

@implementation AppDelegate
@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    // 使用 UNUserNotificationCenter 来管理通知
    UNUserNotificationCenter *userNotificationCenter = [UNUserNotificationCenter currentNotificationCenter];
    // 监听回调事件
    userNotificationCenter.delegate = self;
    // iOS 10 使用以下方法注册，才能得到授权
    [userNotificationCenter requestAuthorizationWithOptions:(UNAuthorizationOptionAlert | UNAuthorizationOptionSound | UNAuthorizationOptionBadge) completionHandler:^(BOOL granted, NSError * _Nullable error) {
        if(granted) {
            NSLog(@"已授权，NSError：%@", error);
        } else {
            NSLog(@"未授权，NSError：%@", error);
        }
    }];
    [[UIApplication sharedApplication] registerForRemoteNotifications];
    
    return YES;
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    //iOS13 后
    NSMutableString *tokenString = [NSMutableString string];
    const char *bytes = deviceToken.bytes;
    int iCount = deviceToken.length;
    for (int i = 0; i < iCount; i++) {
        [tokenString appendFormat:@"%02x", bytes[i]&0x000000FF];
    }

    NSLog(@"tokenString = %@", tokenString);
}

// 只有APP前台运行时此方法才回调
-(void) userNotificationCenter:(UNUserNotificationCenter *)center
         willPresentNotification:(UNNotification *)notification
         withCompletionHandler:(void (^)(UNNotificationPresentationOptions)) completionHandler {
    NSLog(@"回调willPresentNotification");
    // 处理完成后条用 completionHandler ，用于指示在前台显示通知的形式
    completionHandler(UNNotificationPresentationOptionAlert | UNNotificationPresentationOptionBadge | UNNotificationPresentationOptionSound);
}

// 点击推送消息后回调
-(void) userNotificationCenter:(UNUserNotificationCenter *)center
         didReceiveNotificationResponse:(UNNotificationResponse *)response
         withCompletionHandler:(void(^)(void))completionHandler {
    NSLog(@"didReceiveNotificationResponse %@",response.notification.request.content.userInfo);
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    NSLog(@"APP进入前台");
}

#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
