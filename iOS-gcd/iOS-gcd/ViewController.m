//
//  ViewController.m
//  iOS-gcd
//
//  Created by MacOS on 2020/1/25.
//  Copyright © 2020 MacOS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *buttonSyncConcurrent;
@property (weak, nonatomic) IBOutlet UIButton *buttonAsyncConcurrent;
@property (weak, nonatomic) IBOutlet UIButton *buttonSyncSerial;
@property (weak, nonatomic) IBOutlet UIButton *buttonAsyncSerial;
@property (weak, nonatomic) IBOutlet UIButton *buttonSyncMainQueue;
@property (weak, nonatomic) IBOutlet UIButton *buttonAsyncMainQueue;
@property (weak, nonatomic) IBOutlet UIButton *buttonSyncGlobalQueue;
@property (weak, nonatomic) IBOutlet UIButton *buttonAsyncGlobalQueue;
@property (weak, nonatomic) IBOutlet UIButton *buttonExecuteDelay;
@property (weak, nonatomic) IBOutlet UIButton *buttonLog;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.buttonSyncConcurrent addTarget:self action:@selector(buttonSyncConcurrentOnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.buttonAsyncConcurrent addTarget:self action:@selector(buttonAsyncConcurrentOnClicked:) forControlEvents:(UIControlEvents)UIControlEventTouchUpInside];
    [self.buttonSyncSerial addTarget:self action:@selector(buttonSyncSerialOnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.buttonAsyncSerial addTarget:self action:@selector(buttonAsyncSerialOnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.buttonSyncMainQueue addTarget:self action:@selector(buttonSyncMainQueueOnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.buttonAsyncMainQueue addTarget:self action:@selector(buttonAsyncMainQueueOnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.buttonSyncGlobalQueue addTarget:self action:@selector(buttonSyncGlobalQueueOnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.buttonAsyncGlobalQueue addTarget:self action:@selector(buttonAsyncGlobalQueueOnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.buttonExecuteDelay addTarget:self action:@selector(buttonExecuteDelayOnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.buttonLog addTarget:self action:@selector(buttonLogOnClicked:) forControlEvents:UIControlEventTouchUpInside];
}

- (void) buttonSyncConcurrentOnClicked:(UIButton *) button {
    NSLog(@"当前线程 - %@",[NSThread currentThread]);  // 打印当前线程
    NSLog(@"同步+并发 开始");
    
    dispatch_queue_t queue = dispatch_queue_create("com.future.demo.ios.gcd", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_sync(queue, ^{
        [NSThread sleepForTimeInterval:3];              // 模拟耗时操作
        NSLog(@"任务休眠3秒 - %@",[NSThread currentThread]);      // 打印当前线程
    });
    
    dispatch_sync(queue, ^{
        [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
        NSLog(@"任务休眠2秒 - %@",[NSThread currentThread]);      // 打印当前线程
    });
    
    dispatch_sync(queue, ^{
        [NSThread sleepForTimeInterval:1];              // 模拟耗时操作
        NSLog(@"任务休眠1秒 - %@",[NSThread currentThread]);      // 打印当前线程
    });
    
    NSLog(@"同步+并发 结束");
}

- (void) buttonAsyncConcurrentOnClicked:(UIButton *) button {
    NSLog(@"当前线程 - %@",[NSThread currentThread]);  // 打印当前线程
    NSLog(@"异步+并发 开始");
    
    dispatch_queue_t queue = dispatch_queue_create("com.future.demo.ios.gcd", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:3];              // 模拟耗时操作
        NSLog(@"任务休眠3秒 - %@",[NSThread currentThread]);      // 打印当前线程
    });
    
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
        NSLog(@"任务休眠2秒 - %@",[NSThread currentThread]);      // 打印当前线程
    });
    
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:1];              // 模拟耗时操作
        NSLog(@"任务休眠1秒 - %@",[NSThread currentThread]);      // 打印当前线程
    });
    
    NSLog(@"异步+并发 结束");
}

- (void) buttonSyncSerialOnClicked:(UIButton *) button {
    NSLog(@"当前线程 - %@",[NSThread currentThread]);  // 打印当前线程
    NSLog(@"同步+串行 开始");
    
    dispatch_queue_t queue = dispatch_queue_create("com.future.demo.ios.gcd", DISPATCH_QUEUE_SERIAL);
    
    dispatch_sync(queue, ^{
        [NSThread sleepForTimeInterval:3];              // 模拟耗时操作
        NSLog(@"任务休眠3秒 - %@",[NSThread currentThread]);      // 打印当前线程
    });
    dispatch_sync(queue, ^{
        [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
        NSLog(@"任务休眠2秒 - %@",[NSThread currentThread]);      // 打印当前线程
    });
    dispatch_sync(queue, ^{
        [NSThread sleepForTimeInterval:1];              // 模拟耗时操作
        NSLog(@"任务休眠1秒 - %@",[NSThread currentThread]);      // 打印当前线程
    });
    
    NSLog(@"同步+串行 结束");
}

- (void) buttonAsyncSerialOnClicked:(UIButton *) button {
    NSLog(@"当前线程 - %@",[NSThread currentThread]);  // 打印当前线程
    NSLog(@"异步+串行 开始");
    
    dispatch_queue_t queue = dispatch_queue_create("net.bujige.testQueue", DISPATCH_QUEUE_SERIAL);
    
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
        NSLog(@"任务休眠3秒 - %@",[NSThread currentThread]);      // 打印当前线程
    });
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
        NSLog(@"任务休眠2秒 - %@",[NSThread currentThread]);      // 打印当前线程
    });
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:1];              // 模拟耗时操作
        NSLog(@"任务休眠1秒 - %@",[NSThread currentThread]);      // 打印当前线程
    });
    
    NSLog(@"异步+串行 结束");
}

- (void) buttonSyncMainQueueOnClicked:(UIButton *) button {
    [NSThread detachNewThreadWithBlock:^{
        NSLog(@"当前线程 - %@",[NSThread currentThread]);  // 打印当前线程
        NSLog(@"同步+主队列 开始");
        
        dispatch_queue_t queue = dispatch_get_main_queue();
        
        dispatch_sync(queue, ^{
            [NSThread sleepForTimeInterval:3];              // 模拟耗时操作
            NSLog(@"任务休眠3秒 - %@",[NSThread currentThread]);      // 打印当前线程
        });
        
        dispatch_sync(queue, ^{
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"任务休眠2秒 - %@",[NSThread currentThread]);      // 打印当前线程
        });
        
        dispatch_sync(queue, ^{
            [NSThread sleepForTimeInterval:1];              // 模拟耗时操作
            NSLog(@"任务休眠1秒 - %@",[NSThread currentThread]);      // 打印当前线程
        });
        
        NSLog(@"同步+主队列 结束");
    }];
}

- (void) buttonAsyncMainQueueOnClicked:(UIButton *) button {
    NSLog(@"当前线程 - %@",[NSThread currentThread]);  // 打印当前线程
    NSLog(@"异步+主队列 开始");
    
    dispatch_queue_t queue = dispatch_get_main_queue();
    
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:3];              // 模拟耗时操作
        NSLog(@"任务休眠3秒 - %@",[NSThread currentThread]);      // 打印当前线程
    });
    
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
        NSLog(@"任务休眠2秒 - %@",[NSThread currentThread]);      // 打印当前线程
    });
    
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:1];              // 模拟耗时操作
        NSLog(@"任务休眠1秒 - %@",[NSThread currentThread]);      // 打印当前线程
    });
    
    NSLog(@"异步+主队列 结束");
}

- (void) buttonSyncGlobalQueueOnClicked:(UIButton *) button {
    NSLog(@"当前线程 - %@",[NSThread currentThread]);  // 打印当前线程
    NSLog(@"同步+全局并发 开始");
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_sync(queue, ^{
        [NSThread sleepForTimeInterval:3];              // 模拟耗时操作
        NSLog(@"任务休眠3秒 - %@",[NSThread currentThread]);      // 打印当前线程
    });
    
    dispatch_sync(queue, ^{
        [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
        NSLog(@"任务休眠2秒 - %@",[NSThread currentThread]);      // 打印当前线程
    });
    
    dispatch_sync(queue, ^{
        [NSThread sleepForTimeInterval:1];              // 模拟耗时操作
        NSLog(@"任务休眠1秒 - %@",[NSThread currentThread]);      // 打印当前线程
    });
    
    NSLog(@"同步+全局并发 结束");
}

- (void) buttonAsyncGlobalQueueOnClicked:(UIButton *) button {
    NSLog(@"当前线程 - %@",[NSThread currentThread]);  // 打印当前线程
    NSLog(@"异步+全局并发 开始");
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:3];              // 模拟耗时操作
        NSLog(@"任务休眠3秒 - %@",[NSThread currentThread]);      // 打印当前线程
    });
    
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
        NSLog(@"任务休眠2秒 - %@",[NSThread currentThread]);      // 打印当前线程
    });
    
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:1];              // 模拟耗时操作
        NSLog(@"任务休眠1秒 - %@",[NSThread currentThread]);      // 打印当前线程
    });
    
    NSLog(@"异步+全局并发 结束");
}

- (void) buttonExecuteDelayOnClicked:(UIButton *) button {
    // 延迟两秒打印当前线程
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"当前线程 - %@",[NSThread currentThread]);  // 打印当前线程
    });
}

- (void) buttonLogOnClicked:(UIButton *) button {
    NSLog(@"打印消息");
}

@end
