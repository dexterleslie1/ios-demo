//
//  ViewController.m
//  iOS-lock
//
//  Created by MacOS on 2020/11/24.
//  Copyright © 2020 YingShun International Network Co., Limited. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.buttonStartTesting addTarget:self
                                action:@selector(onClickedButtonStartTesting:)
                      forControlEvents:UIControlEventTouchUpInside];
}

- (void) onClickedButtonStartTesting:(UIButton *) button {
    [self testNSLock];
}

- (void) testNSLock {
    NSLock *lock = [[NSLock alloc] init];
    NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
        
    }];
    
    for(int i=0; i<10; i++) {
        [operation addExecutionBlock:^{
            BOOL isLocked = [lock tryLock];
            if(!isLocked) {
                NSLog(@"线程%@尝试获取锁失败", [NSThread currentThread]);
                return;
            } else {
                NSLog(@"线程%@尝试获取锁成功", [NSThread currentThread]);
                [NSThread sleepForTimeInterval:1.5];
                [lock unlock];
            }
        }];
    }
    
    [operation start];
    [operation waitUntilFinished];
    NSLog(@"所有operations完成退出");
}

@end
