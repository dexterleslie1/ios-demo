//
//  ConnectivityManager.m
//  iOS-socket
//
//  Created by MacOS on 2020/11/22.
//  Copyright © 2020 YingShun International Network Co., Limited. All rights reserved.
//

#import "ConnectivityManager.h"
#import "ConnectivityGCDAsyncSocketDelegate.h"

@implementation ConnectivityManager

+ (ConnectivityManager *) sharedInstance {
    static ConnectivityManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!instance) {
            instance = [[self alloc] init];
        }
    });
    return instance;
}

- (BOOL) checkByUsingCocoaAsyncSocket:(NSString *) host withPort:(int) port {
    dispatch_semaphore_t sema = dispatch_semaphore_create(0);
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    ConnectivityGCDAsyncSocketDelegate *delegate = [[ConnectivityGCDAsyncSocketDelegate alloc] initWithSema:sema];
    GCDAsyncSocket *socket= [[GCDAsyncSocket alloc] initWithDelegate:delegate delegateQueue:queue];
    
    NSError *error;
    [socket connectToHost:host onPort:port withTimeout:4.5 error:&error];
    
    if(error) {
        return false;
    }
    
    dispatch_semaphore_wait(sema, dispatch_time(DISPATCH_TIME_NOW, 5*NSEC_PER_SEC));
    
    BOOL reachable = delegate.isReachable;
    return reachable;
}

@end
