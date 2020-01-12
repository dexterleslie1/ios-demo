//
//  ViewController.m
//  afnetworkreachabilitymanager
//
//  Created by MacOS on 2020/1/12.
//  Copyright © 2020 MacOS. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        if(status == AFNetworkReachabilityStatusUnknown) {
            NSLog(@"网络未知状态");
        } else if(status == AFNetworkReachabilityStatusNotReachable) {
            NSLog(@"网络未连接");
        } else if(status == AFNetworkReachabilityStatusReachableViaWiFi) {
            NSLog(@"网络wifi");
        } else if(status == AFNetworkReachabilityStatusReachableViaWWAN) {
            NSLog(@"网络蜂窝");
        }
    }];
    [manager startMonitoring];
}

- (void) dealloc {
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    [manager stopMonitoring];
}

@end
