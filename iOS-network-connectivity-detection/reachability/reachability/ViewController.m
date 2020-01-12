//
//  ViewController.m
//  reachability
//
//  Created by MacOS on 2020/1/11.
//  Copyright © 2020 MacOS. All rights reserved.
//

#import "ViewController.h"
#import "Reachability.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *buttonGetReachability;
@property (weak, nonatomic) IBOutlet UIButton *buttonTestNetworkReachable;
@property (nonatomic) Reachability *reachability;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.buttonGetReachability addTarget:self action:@selector(buttonOnClickReachability:) forControlEvents:UIControlEventTouchDown];
    [self.buttonTestNetworkReachable addTarget:self action:@selector(buttonTestNetworkReachable:) forControlEvents:UIControlEventTouchDown];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
    self.reachability = [Reachability reachabilityForInternetConnection];
    [self.reachability startNotifier];
}

- (void) reachabilityChanged:(NSNotification *) notification {
    id notificationObject = [notification object];
    NSParameterAssert([notificationObject isKindOfClass:[Reachability class]]);
    Reachability *reachability = (Reachability *)notificationObject;
    NetworkStatus networkStatus = [reachability currentReachabilityStatus];
    NSString * networkStatusString;
    if(networkStatus == NotReachable) {
        networkStatusString = @"Not reachable";
    } else if(networkStatus == ReachableViaWiFi) {
        networkStatusString = @"Reachable via wifi";
    } else if(networkStatus == ReachableViaWWAN) {
        // 手机网络
        networkStatusString = @"Reachable via wwan";
    }
    NSLog(@"Current network status: %@", networkStatusString);
}

- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self.reachability stopNotifier];
}

- (void) buttonOnClickReachability:(UIButton *) sender {
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [reachability currentReachabilityStatus];
    NSString * networkStatusString;
    if(networkStatus == NotReachable) {
        networkStatusString = @"Not reachable";
    } else if(networkStatus == ReachableViaWiFi) {
        networkStatusString = @"Reachable via wifi";
    } else if(networkStatus == ReachableViaWWAN) {
        // 手机网络
        networkStatusString = @"Reachable via wwan";
    }
    NSLog(@"Current network status: %@", networkStatusString);
}

- (void) buttonTestNetworkReachable:(UIButton *) sender {
    NSString *hostname = @"www.baidu.com";
    Reachability *reachability = [Reachability reachabilityWithHostName: hostname];
    NetworkStatus networkStatus = [reachability currentReachabilityStatus];
    NSString * networkStatusString;
    if(networkStatus == NotReachable) {
        networkStatusString = [NSString stringWithFormat:@"%@ is not reachable", hostname];
    } else if(networkStatus == ReachableViaWiFi) {
        networkStatusString = [NSString stringWithFormat:@"%@ is reachable via wifi", hostname];
    } else if(networkStatus == ReachableViaWWAN) {
        // 手机网络
        networkStatusString = [NSString stringWithFormat:@"%@ is reachable via wwan", hostname];
    }
    NSLog(@"Current network status: %@", networkStatusString);
}

@end
