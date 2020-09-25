//
//  ViewController.m
//  pushkit
//
//  Created by MacOS on 2020/1/23.
//  Copyright © 2020 MacOS. All rights reserved.
//

#import "ViewController.h"
#import <UserNotifications/UserNotifications.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter addObserver:self selector:@selector(subscribeIncomingPayload:) name:@"notificationIncomingPayload" object:nil];
}

- (void) subscribeIncomingPayload:(NSNotification *) notification {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *currentTime = [NSDate date];
    NSString *currentTimeString = [formatter stringFromDate:currentTime];
    UNUserNotificationCenter *userNotificationCenter = [UNUserNotificationCenter currentNotificationCenter];
    UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
    content.title = @"通知标题";
    content.body = [NSString stringWithFormat:@"通知内容，时间 %@", currentTimeString];
    content.sound = [UNNotificationSound defaultSound];
    UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:1 repeats:NO];
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:@"fiveSeconds" content:content trigger:trigger];
    [userNotificationCenter addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
        NSLog(@"成功推送通知");
    }];
}

- (void) dealloc {
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter removeObserver:self];
}

@end
