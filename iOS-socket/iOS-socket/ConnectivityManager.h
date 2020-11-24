//
//  ConnectivityManager.h
//  iOS-socket
//
//  Created by MacOS on 2020/11/22.
//  Copyright © 2020 YingShun International Network Co., Limited. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GCDAsyncSocket.h"

NS_ASSUME_NONNULL_BEGIN

@interface ConnectivityManager : NSObject<GCDAsyncSocketDelegate>

@property(nonatomic, strong) NSMutableDictionary<NSString *,dispatch_semaphore_t> *identifierToSemaphores;
@property(nonatomic, strong) NSMutableDictionary<NSString *,NSNumber *> *socketToReachable;
@property(nonatomic, strong) NSMutableDictionary<NSString *,GCDAsyncSocket *> *identifierToSockets;

+ (ConnectivityManager *) sharedInstance;

- (BOOL) checkByUsingCocoaAsyncSocket:(NSString *) host withPort:(int) port;

@end

NS_ASSUME_NONNULL_END
