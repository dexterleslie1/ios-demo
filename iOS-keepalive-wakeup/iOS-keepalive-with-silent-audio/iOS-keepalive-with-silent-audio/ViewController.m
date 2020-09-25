//
//  ViewController.m
//  iOS-keepalive-with-silent-audio
//
//  Created by MacOS on 2020/9/14.
//  Copyright © 2020 YingShun International Network Co., Limited. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 订阅申请后台任务
    
    self.nsTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerTicker:) userInfo:nil repeats:YES];
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
}

- (void) dealloc {
    if(self.nsTimer) {
        [self.nsTimer invalidate];
    }
}

@end
