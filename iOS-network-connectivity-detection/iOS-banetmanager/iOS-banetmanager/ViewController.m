//
//  ViewController.m
//  iOS-banetmanager
//
//  Created by MacOS on 2021/4/14.
//

#import "ViewController.h"
#import <BANetManager_OC.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.label = [[UILabel alloc] init];
    self.label.frame = self.view.frame;
    self.label.text = @"";
    self.label.numberOfLines = 0;
    self.label.font = [self.label.font fontWithSize:12];
    [self.view addSubview:self.label];
    
    // 监听网络变化
    [BANetManager ba_startNetWorkMonitoringWithBlock:^(BANetworkStatus status) {
        NSDate *time = [NSDate date];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setTimeZone: [NSTimeZone localTimeZone]];
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSString *message = [@"" stringByAppendingFormat:@"%@ ", [formatter stringFromDate:time]];
        if(status == BANetworkStatusUnknown) {
            message = [message stringByAppendingString:@"网络变化为BANetworkStatusUnknown"];
        } else if(status == BANetworkStatusNotReachable) {
            message = [message stringByAppendingString:@"网络变化为BANetworkStatusNotReachable"];
        } else if(status == BANetworkStatusReachableViaWWAN) {
            message = [message stringByAppendingString:@"网络变化为BANetworkStatusReachableViaWWAN"];
        } else if(status == BANetworkStatusReachableViaWiFi) {
            message = [message stringByAppendingString:@"网络变化为BANetworkStatusReachableViaWiFi"];
        } else {
            message = [message stringByAppendingString:@"网络变化为其他类型"];
        }
        
        self.label.text = [self.label.text stringByAppendingString:message];
        self.label.text = [self.label.text stringByAppendingString:@"\n"];
    }];
}

@end
