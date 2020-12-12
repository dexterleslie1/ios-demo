//
//  ConnectivityGCDAsyncSocketDelegate.h
//  ZPChat
//
//  Created by MacOS on 2020/12/12.
//  Copyright © 2020 yiyingda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GCDAsyncSocket.h"

NS_ASSUME_NONNULL_BEGIN

@interface ConnectivityGCDAsyncSocketDelegate : NSObject<GCDAsyncSocketDelegate>

@property dispatch_semaphore_t sema;
@property BOOL reachable;

- (ConnectivityGCDAsyncSocketDelegate *) initWithSema:(dispatch_semaphore_t) sema;

- (BOOL) isReachable;

@end

NS_ASSUME_NONNULL_END
