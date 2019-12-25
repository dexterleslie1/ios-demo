//
//  ViewController.m
//  nstimer
//
//  Created by MacOS on 2019/12/25.
//  Copyright © 2019 MacOS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *buttonStart = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    CGRect rect = CGRectMake(0, 100, 200, 60);
    buttonStart.frame = rect;
    [buttonStart setTitle:@"启动" forState:UIControlStateNormal];
    [buttonStart setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [buttonStart setBackgroundColor:[UIColor redColor]];
    [buttonStart addTarget:self action:@selector(buttonClickStart:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:buttonStart];
    
    UIButton *buttonStop = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    rect = CGRectMake(0, 200, 200, 60);
    buttonStop.frame = rect;
    [buttonStop setTitle:@"停止" forState:UIControlStateNormal];
    [buttonStop setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [buttonStop setBackgroundColor:[UIColor redColor]];
    [buttonStop addTarget:self action:@selector(buttonClickStop:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:buttonStop];
}

- (void)buttonClickStart:(id) sender{
    if(self.nsTimer!=nil) {
        NSLog(@"定时器已启动");
        return;
    }
    
    self.nsTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerTicker:) userInfo:nil repeats:YES];
    NSLog(@"启动");
}

- (void) timerTicker:(NSTimer *) nsTimer {
    NSLog(@"ticker....");
}

- (void)buttonClickStop:(id) sender{
    if(self.nsTimer!=nil) {
        [self.nsTimer invalidate];
        self.nsTimer = nil;
    }
    NSLog(@"停止");
}

- (void) dealloc {
    if(self.nsTimer!=nil) {
        [self.nsTimer invalidate];
        self.nsTimer = nil;
    }
    NSLog(@"ViewController销毁");
}
@end
