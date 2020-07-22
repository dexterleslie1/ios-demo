//
//  ViewController.m
//  iOS-delay
//
//  Created by MacOS on 2020/7/21.
//  Copyright © 2020 future.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *buttonDispatchAfter;
@property (weak, nonatomic) IBOutlet UIButton *buttonPerformSelector;
@property (weak, nonatomic) IBOutlet UIButton *buttonPerformSelectorCancel;
@property (weak, nonatomic) IBOutlet UIButton *buttonNSTimer;
@property (weak, nonatomic) IBOutlet UIButton *buttonNSTimerCancel;

@property (strong, nonatomic) NSTimer * timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.buttonDispatchAfter addTarget:self action:@selector(onClickedButtonDispatchAfter:) forControlEvents:UIControlEventTouchUpInside];
    [self.buttonPerformSelector addTarget:self action:@selector(onClickedButtonPerformSelector:) forControlEvents:UIControlEventTouchUpInside];
    [self.buttonPerformSelectorCancel addTarget:self action:@selector(onClickedButtonPerformSelectorCancel:) forControlEvents:UIControlEventTouchUpInside];
    [self.buttonNSTimer addTarget:self action:@selector(onClickedButtonNSTimer:) forControlEvents:UIControlEventTouchUpInside];
    [self.buttonNSTimerCancel addTarget:self action:@selector(onClickedButtonNSTimerCancel:) forControlEvents:UIControlEventTouchUpInside];
}

- (void) onClickedButtonDispatchAfter: (UIButton *) button {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"使用dispatch_after延迟2秒打印日志");
    });
}

- (void) onClickedButtonPerformSelector: (UIButton *) button {
    [self performSelector:@selector(methodDelay) withObject:nil afterDelay:2.0];
}

- (void) methodDelay {
    NSLog(@"使用NSObject performSelector延迟2秒打印日志");
}

- (void) onClickedButtonPerformSelectorCancel: (UIButton *) button {
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(methodDelay) object:nil];
}

- (void) onClickedButtonNSTimer: (UIButton *) button {
    if(!self.timer) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 repeats:NO block:^(NSTimer *timer) {
            NSLog(@"使用NSTimer.scheduledTimerWithTimeInterval延迟2秒打印日志");
            [self.timer invalidate];
            self.timer = nil;
        }];
    }
}

- (void) onClickedButtonNSTimerCancel: (UIButton *) button {
    if(self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
}

@end
