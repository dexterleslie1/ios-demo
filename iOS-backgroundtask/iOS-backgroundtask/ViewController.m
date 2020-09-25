//
//  ViewController.m
//  iOS-backgroundtask
//
//  Created by MacOS on 2020/9/25.
//  Copyright © 2020 YingShun International Network Co., Limited. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(assign, nonatomic) NSTimer *nsTimer;
@property(assign, nonatomic) int badge;
@property(assign, nonatomic) UIBackgroundTaskIdentifier taskId;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    // 订阅申请后台任务
    [notificationCenter addObserver:self selector:@selector(onApplyBackgroundTaskEvent:) name:@"onApplyBackgroundTaskEvent" object:nil];
    // 订阅取消后台任务
    [notificationCenter addObserver:self selector:@selector(onCancelBackgroundTaskEvent:) name:@"onCancelBackgroundTaskEvent" object:nil];
    
    self.nsTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerTicker:) userInfo:nil repeats:YES];
}

- (void) onApplyBackgroundTaskEvent:(NSNotification *) notification {
    if(!self.taskId || self.taskId==UIBackgroundTaskInvalid) {
        self.taskId = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{
            if(self.taskId!=UIBackgroundTaskInvalid) {
                [[UIApplication sharedApplication] endBackgroundTask:self.taskId];
                self.taskId = UIBackgroundTaskInvalid;
            }
            NSLog(@"调用endBackgroundTask");
        }];
        if(self.taskId!=UIBackgroundTaskInvalid) {
            NSLog(@"成功申请backgroundTask");
        }
    } else {
        NSLog(@"前一个backgroundTask未终止，不能重复申请backgroundTask");
    }
}

- (void) onCancelBackgroundTaskEvent:(NSNotification *) notification {
    [self cancelBackgroundTask];
}

- (void) cancelBackgroundTask {
    if(self.taskId && self.taskId!=UIBackgroundTaskInvalid) {
        [[UIApplication sharedApplication] endBackgroundTask:self.taskId];
        self.taskId = UIBackgroundTaskInvalid;
        NSLog(@"willEnterForeground 调用endBackgroundTask");
    }
}

- (void) timerTicker:(NSTimer *) nsTimer {
    _badge = _badge + 1;
    [UIApplication sharedApplication].applicationIconBadgeNumber = _badge;
    
    NSTimeInterval backgroundTimeRemaining =[[UIApplication sharedApplication] backgroundTimeRemaining];
    if (backgroundTimeRemaining == DBL_MAX){
          NSLog(@"Background Time Remaining = Undetermined");
    } else {
          NSLog(@"Background Time Remaining = %.02f Seconds", backgroundTimeRemaining);
    }
//    重新再次申请后台任务backgroundTimeRemaining没有变化，所以iOS13以后后台任务最长时间为30s
//    if(backgroundTimeRemaining<=10) {
//        [self cancelBackgroundTask];
//        // 再次申请后台任务
//        NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
//        [notificationCenter postNotificationName:@"onApplyBackgroundTaskEvent" object:nil];
//        NSLog(@"后台任务快要结束，再次重新申请");
//    }
}

- (void) dealloc {
    if(self.nsTimer) {
        [self.nsTimer invalidate];
    }
}

@end
