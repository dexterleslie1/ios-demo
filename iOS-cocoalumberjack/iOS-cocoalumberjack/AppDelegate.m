//
//  AppDelegate.m
//  iOS-cocoalumberjack
//
//  Created by MacOS on 2020/9/28.
//  Copyright © 2020 YingShun International Network Co., Limited. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // 初始化CocoaLumberjack
    // DDOSLogger会把日志输出到Xcode console和Console.app中
    [DDLog addLogger:[DDOSLogger sharedInstance]];

    // 输出日志到文件中
    DDFileLogger *fileLogger = [[DDFileLogger alloc] init];
    fileLogger.rollingFrequency = 60 * 60 * 24;
    fileLogger.logFileManager.maximumNumberOfLogFiles = 7;
    [DDLog addLogger:fileLogger];
    
    // 日志文件所在目录
    NSString *logsDirectory = fileLogger.logFileManager.logsDirectory;
    DDLogInfo(@"CocoaLumberjack日志目录 %@", logsDirectory);
    
    // 所有日志文件
    NSArray<NSString *> *logFilePaths = fileLogger.logFileManager.sortedLogFilePaths;
    NSString *logFilePathS = @"";
    for(NSString *logFilePath in logFilePaths) {
        logFilePathS = [logFilePathS stringByAppendingString:logFilePath];
        logFilePathS = [logFilePathS stringByAppendingString:@","];
    }
    DDLogInfo(@"CocoaLumberjack所有日志文件%@", logFilePathS);
    
    return YES;
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
