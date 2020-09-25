//
//  ViewController.m
//  iOS-notification
//
//  Created by MacOS on 2020/1/5.
//  Copyright © 2020 MacOS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *buttonNotification;
@property (assign, nonatomic) int counter;

@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 注册通知
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter addObserver:self selector:@selector(subscriber1:) name:@"notification1" object:nil];
    
    [self.buttonNotification addTarget:self action:@selector(buttonClick1:) forControlEvents:UIControlEventTouchDown];
    self.counter = 0;
}

- (void) dealloc {
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter removeObserver:self];
}

- (void) buttonClick1:(id) sender {
    self.counter++;
    NSDictionary *userInfo = @{@"data": [NSNumber numberWithInt:self.counter]};
    NSNotification *notification = [NSNotification notificationWithName:@"notification1" object:nil userInfo:userInfo];
    [[NSNotificationCenter defaultCenter] postNotification: notification];
}

- (void) subscriber1:(NSNotification *) sender {
    NSDictionary *userInfo = sender.userInfo;
    NSLog(@"接收到通知data=%@", [userInfo objectForKey:@"data"]);
    sleep(0.05);
}

@end
