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

@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 注册通知
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter addObserver:self selector:@selector(subscriber1:) name:@"notification1" object:nil];
    
    [self.buttonNotification addTarget:self action:@selector(buttonClick1:) forControlEvents:UIControlEventTouchDown];
}

- (void) dealloc {
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter removeObserver:self];
}

- (void) buttonClick1:(id) sender {
    NSNotification *notification = [NSNotification notificationWithName:@"notification1" object:nil];
    [[NSNotificationCenter defaultCenter] postNotification: notification];
}

- (void) subscriber1:(id) sender {
    NSLog(@"收到通知");
}

@end
