//
//  ViewController.m
//  iOS-NSOperation
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
    
    [self.buttonStartExecution addTarget:self
                                  action:@selector(onClickedButtonStartExecution:)
                        forControlEvents:UIControlEventTouchUpInside];
}

- (void) onClickedButtonStartExecution:(UIButton *) button {
//    [self testNSBlockOperation];
//    [self testNSInvocationOperation];
    [self testNSOperationQueue];
}

// 同步+主线程
- (void) testNSInvocationOperation {
    NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithTarget:self
                                                                            selector:@selector(run:)
                                                                              object:@"NSInvocationOperation#initWithTarget#1"];
    [operation start];
    operation = [[NSInvocationOperation alloc] initWithTarget:self
                                                     selector:@selector(run:)
                                                       object:@"NSInvocationOperation#initWithTarget#2"];
    [operation start];
}

// 异步+子线程
- (void) testNSBlockOperation {
    NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
        // 主线程执行
        NSLog(@"NSBlockOperation#blockOperationWithBlock，当前线程[%@]", [NSThread currentThread]);
    }];
    
    [operation addExecutionBlock:^{
        // 开启子线程执行
        [self run:@"NSBlockOperation#addExecutionBlock#1"];
    }];
    [operation addExecutionBlock:^{
        // 开启子线程执行
        [self run:@"NSBlockOperation#addExecutionBlock#2"];
    }];
    
    [operation start];
}

// 异步+子线程
- (void) testNSOperationQueue {
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    queue.name = @"com.future.demo.iOS.ns.operation";
    
    for(int i=0; i<3; i++) {
        NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithTarget:self
                                                                                selector:@selector(run:)
                                                                                  object:[NSString stringWithFormat:@"NSOperationQueue#addOperation#%d", i]];
        [queue addOperation:operation];
    }
    [queue waitUntilAllOperationsAreFinished];
    NSLog(@"所有operations完成并退出");
}

- (void) run:(NSString *)identifier {
    NSLog(@"线程[%@]%@开始", [NSThread currentThread], identifier);
    
    // 模拟操作时间耗时
    double time = arc4random() % 10;
    [NSThread sleepForTimeInterval:time];
    
    NSLog(@"线程[%@]%@结束", [NSThread currentThread], identifier);
}

@end
