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
}

- (void) buttonSyncConcurrentOnClicked:(UIButton *) button {
    NSLog(@"currentThread---%@",[NSThread currentThread]);  // 打印当前线程
    NSLog(@"syncConcurrent---begin");
    
    dispatch_queue_t queue = dispatch_queue_create("com.future.demo.ios.gcd", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_sync(queue, ^{
        // 追加任务 1
        [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
        NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
    });
    
    dispatch_sync(queue, ^{
        // 追加任务 2
        [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
        NSLog(@"2---%@",[NSThread currentThread]);      // 打印当前线程
    });
    
    dispatch_sync(queue, ^{
        // 追加任务 3
        [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
        NSLog(@"3---%@",[NSThread currentThread]);      // 打印当前线程
    });
    
    NSLog(@"syncConcurrent---end");
}

- (void) buttonAsyncConcurrentOnClicked:(UIButton *) button {
    NSLog(@"currentThread---%@",[NSThread currentThread]);  // 打印当前线程
    NSLog(@"asyncConcurrent---begin");
    
    dispatch_queue_t queue = dispatch_queue_create("com.future.demo.ios.gcd", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{
        // 追加任务 1
        [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
        NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
    });
    
    dispatch_async(queue, ^{
        // 追加任务 2
        [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
        NSLog(@"2---%@",[NSThread currentThread]);      // 打印当前线程
    });
    
    dispatch_async(queue, ^{
        // 追加任务 3
        [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
        NSLog(@"3---%@",[NSThread currentThread]);      // 打印当前线程
    });
    
    NSLog(@"asyncConcurrent---end");
}

- (void) buttonSyncSerialOnClicked:(UIButton *) button {
    NSLog(@"currentThread---%@",[NSThread currentThread]);  // 打印当前线程
    NSLog(@"syncSerial---begin");
    
    dispatch_queue_t queue = dispatch_queue_create("com.future.demo.ios.gcd", DISPATCH_QUEUE_SERIAL);
    
    dispatch_sync(queue, ^{
        // 追加任务 1
        [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
        NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
    });
    dispatch_sync(queue, ^{
        // 追加任务 2
        [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
        NSLog(@"2---%@",[NSThread currentThread]);      // 打印当前线程
    });
    dispatch_sync(queue, ^{
        // 追加任务 3
        [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
        NSLog(@"3---%@",[NSThread currentThread]);      // 打印当前线程
    });
    
    NSLog(@"syncSerial---end");
}

- (void) buttonAsyncSerialOnClicked:(UIButton *) button {
    NSLog(@"currentThread---%@",[NSThread currentThread]);  // 打印当前线程
    NSLog(@"asyncSerial---begin");
    
    dispatch_queue_t queue = dispatch_queue_create("net.bujige.testQueue", DISPATCH_QUEUE_SERIAL);
    
    dispatch_async(queue, ^{
        // 追加任务 1
        [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
        NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
    });
    dispatch_async(queue, ^{
        // 追加任务 2
        [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
        NSLog(@"2---%@",[NSThread currentThread]);      // 打印当前线程
    });
    dispatch_async(queue, ^{
        // 追加任务 3
        [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
        NSLog(@"3---%@",[NSThread currentThread]);      // 打印当前线程
    });
    
    NSLog(@"asyncSerial---end");
}

- (void) buttonSyncMainQueueOnClicked:(UIButton *) button {
    [NSThread detachNewThreadWithBlock:^{
        NSLog(@"currentThread---%@",[NSThread currentThread]);  // 打印当前线程
        NSLog(@"syncMain---begin");
        
        dispatch_queue_t queue = dispatch_get_main_queue();
        
        dispatch_sync(queue, ^{
            // 追加任务 1
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
        });
        
        dispatch_sync(queue, ^{
            // 追加任务 2
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"2---%@",[NSThread currentThread]);      // 打印当前线程
        });
        
        dispatch_sync(queue, ^{
            // 追加任务 3
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"3---%@",[NSThread currentThread]);      // 打印当前线程
        });
        
        NSLog(@"syncMain---end");
    }];
}

- (void) buttonAsyncMainQueueOnClicked:(UIButton *) button {
    NSLog(@"currentThread---%@",[NSThread currentThread]);  // 打印当前线程
    NSLog(@"asyncMain---begin");
    
    dispatch_queue_t queue = dispatch_get_main_queue();
    
    dispatch_async(queue, ^{
        // 追加任务 1
        [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
        NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
    });
    
    dispatch_async(queue, ^{
        // 追加任务 2
        [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
        NSLog(@"2---%@",[NSThread currentThread]);      // 打印当前线程
    });
    
    dispatch_async(queue, ^{
        // 追加任务 3
        [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
        NSLog(@"3---%@",[NSThread currentThread]);      // 打印当前线程
    });
    
    NSLog(@"asyncMain---end");
}

- (void) buttonSyncGlobalQueueOnClicked:(UIButton *) button {
    NSLog(@"currentThread---%@",[NSThread currentThread]);  // 打印当前线程
    NSLog(@"syncGlobalQueue---begin");
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_sync(queue, ^{
        // 追加任务 1
        [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
        NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
    });
    
    dispatch_sync(queue, ^{
        // 追加任务 2
        [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
        NSLog(@"2---%@",[NSThread currentThread]);      // 打印当前线程
    });
    
    dispatch_sync(queue, ^{
        // 追加任务 3
        [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
        NSLog(@"3---%@",[NSThread currentThread]);      // 打印当前线程
    });
    
    NSLog(@"syncGlobalQueue---end");
}

- (void) buttonAsyncGlobalQueueOnClicked:(UIButton *) button {
    NSLog(@"currentThread---%@",[NSThread currentThread]);  // 打印当前线程
    NSLog(@"asyncGlobalQueue---begin");
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(queue, ^{
        // 追加任务 1
        [NSThread sleepForTimeInterval:3];              // 模拟耗时操作
        NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
    });
    
    dispatch_async(queue, ^{
        // 追加任务 2
        [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
        NSLog(@"2---%@",[NSThread currentThread]);      // 打印当前线程
    });
    
    dispatch_async(queue, ^{
        // 追加任务 3
        [NSThread sleepForTimeInterval:1];              // 模拟耗时操作
        NSLog(@"3---%@",[NSThread currentThread]);      // 打印当前线程
    });
    
    NSLog(@"asyncGlobalQueue---end");
}

- (void) buttonExecuteDelayOnClicked:(UIButton *) button {
    NSLog(@"currentThread---%@",[NSThread currentThread]);  // 打印当前线程
    NSLog(@"asyncMain---begin");
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 2.0 秒后异步追加任务代码到主队列，并开始执行
        NSLog(@"after---%@",[NSThread currentThread]);  // 打印当前线程
    });
}

@end
