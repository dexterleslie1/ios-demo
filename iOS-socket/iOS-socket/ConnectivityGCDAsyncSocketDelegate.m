//
//  ConnectivityGCDAsyncSocketDelegate.m
//  ZPChat
//
//  Created by MacOS on 2020/12/12.
//  Copyright © 2020 yiyingda. All rights reserved.
//

#import "ConnectivityGCDAsyncSocketDelegate.h"

@implementation ConnectivityGCDAsyncSocketDelegate

- (ConnectivityGCDAsyncSocketDelegate *) initWithSema:(dispatch_semaphore_t) sema {
    self = [super init];
    if(!self) {
        return nil;
    }
    
    self.sema = sema;
    self.reachable = NO;
    
    return self;
}

- (BOOL) isReachable {
    return self.reachable;
}

- (void) socket:(GCDAsyncSocket *) socket didConnectToHost:(nonnull NSString *) host port:(uint16_t) port{
    self.reachable = YES;
    if(self.sema) {
        dispatch_semaphore_signal(self.sema);
    }
}

- (void) socketDidDisconnect:(GCDAsyncSocket *) socket withError:(NSError *) error{
    self.reachable = NO;
    if(self.sema) {
        dispatch_semaphore_signal(self.sema);
    }
}

@end
