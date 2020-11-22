//
//  ViewController.m
//  iOS-socket
//
//  Created by MacOS on 2020/11/19.
//  Copyright © 2020 YingShun International Network Co., Limited. All rights reserved.
//

#import "ViewController.h"
#import "ConnectivityManager.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *buttonTest;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.buttonTest addTarget:self action:@selector(onButtonTestClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void) onButtonTestClick:(UIButton *) button {
    dispatch_queue_t queue = dispatch_queue_create("com.future.demo.iOS.socket", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        NSString *host = @"192.168.1.51";
        int port = 80;
        BOOL reachable = [[ConnectivityManager sharedInstance] checkByUsingCocoaAsyncSocket: host withPort:port];
        if(reachable) {
            NSLog(@"主机：%@，端口：%d 可达", host, port);
        } else {
            NSLog(@"主机：%@，端口：%d 不可达", host, port);
        }
    });
}


@end
