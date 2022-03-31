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
@property (weak, nonatomic) IBOutlet UIButton *buttonSendLocalNotificationWithoutDelay;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.buttonSendNotification addTarget:self action:@selector(onButtonSendNotificationClick:) forControlEvents:UIControlEventTouchDown];
    [self.buttonSendLocalNotificationWithoutDelay addTarget:self action:@selector(onButtonSendLocalNotificationWithoutDelayClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void) onButtonSendNotificationClick:(UIButton *) button {
    UNUserNotificationCenter *userNotificationCenter = [UNUserNotificationCenter currentNotificationCenter];
    UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
    content.title = @"通知标题";
    content.body = @"通知内容";
    content.sound = [UNNotificationSound defaultSound];
    UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:5 repeats:NO];
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:@"fiveSeconds" content:content trigger:trigger];
    [userNotificationCenter addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
        NSLog(@"成功推送通知");
    }];
}

- (void) onButtonSendLocalNotificationWithoutDelayClick:(UIButton *) button {
    UNUserNotificationCenter *userNotificationCenter = [UNUserNotificationCenter currentNotificationCenter];
    UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
    content.title = @"通知标题";
    content.body = @"通知内容";
    content.sound = [UNNotificationSound defaultSound];
    UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:0.001 repeats:NO];
    CFUUIDRef uuid_ref = CFUUIDCreate(NULL);
    CFStringRef uuid_string_ref= CFUUIDCreateString(NULL, uuid_ref);
    NSString *uuid = [NSString stringWithString:(__bridge NSString *)uuid_string_ref];
    CFRelease(uuid_ref);
    CFRelease(uuid_string_ref);
    NSString *uuidString = [uuid lowercaseString];
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:uuidString content:content trigger:trigger];
//    [userNotificationCenter addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
//        NSLog(@"成功推送通知");
//    }];
    [userNotificationCenter addNotificationRequest:request withCompletionHandler:nil];
}

@end
