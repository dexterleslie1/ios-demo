//
//  ViewController.m
//  iOS10-local-push
//
//  Created by MacOS on 2020/1/17.
//  Copyright © 2020 MacOS. All rights reserved.
//

#import "ViewController.h"
#import <UserNotifications/UserNotifications.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *buttonSendNotification;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.buttonSendNotification addTarget:self action:@selector(onButtonSendNotificationClick:) forControlEvents:UIControlEventTouchDown];
}

- (void) onButtonSendNotificationClick:(UIButton *) button {
    UNUserNotificationCenter *userNotificationCenter = [UNUserNotificationCenter currentNotificationCenter];
    UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
    content.title = @"通知标题";
    content.body = @"通知内容";
    content.sound = [UNNotificationSound defaultSound];
    UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:10 repeats:NO];
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:@"fiveSeconds" content:content trigger:trigger];
    [userNotificationCenter addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
        NSLog(@"成功推送通知");
    }];
}

@end
