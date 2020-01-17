//
//  ViewController.m
//  iOS8-local-push
//
//  Created by MacOS on 2020/1/16.
//  Copyright © 2020 MacOS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *buttonSendNotification;
@property (weak, nonatomic) IBOutlet UIButton *buttonCancelAllNotifications;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.buttonSendNotification addTarget:self action:@selector(onButtonSendNotificationClicked:) forControlEvents:UIControlEventTouchDown];
    [self.buttonCancelAllNotifications addTarget:self action:@selector(onButtonCancelAllNotifications:) forControlEvents:UIControlEventTouchDown];
    
    UIUserNotificationSettings *settings = [UIUserNotificationSettings
                                            settingsForTypes:(UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeAlert)
                                            categories:nil];
    [[UIApplication sharedApplication] registerUserNotificationSettings: settings];
}

- (void) onButtonSendNotificationClicked:(UIButton *) button {
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    notification.alertBody = @"测试通知内容";
    notification.fireDate = [NSDate dateWithTimeIntervalSinceNow:10];
    notification.alertTitle = @"测试通知标题";
    notification.applicationIconBadgeNumber = 1;
    notification.soundName = UILocalNotificationDefaultSoundName;
    [[UIApplication sharedApplication] scheduleLocalNotification: notification];
}

- (void) onButtonCancelAllNotifications:(UIButton *) button {
    // 有bug，不能清除本地通知
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
}

@end
