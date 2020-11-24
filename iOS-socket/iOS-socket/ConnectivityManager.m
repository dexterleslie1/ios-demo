//
//  ConnectivityManager.m
//  iOS-socket
//
//  Created by MacOS on 2020/11/22.
//  Copyright © 2020 YingShun International Network Co., Limited. All rights reserved.
//

#import "ConnectivityManager.h"

@implementation ConnectivityManager

+ (ConnectivityManager *) sharedInstance {
    static ConnectivityManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!instance) {
            instance = [[self alloc] init];
            instance.identifierToSemaphores = [[NSMutableDictionary alloc] init];
            instance.socketToReachable = [[NSMutableDictionary alloc] init];
            instance.identifierToSockets = [[NSMutableDictionary alloc] init];
        }
    });
    return instance;
}

- (BOOL) checkByUsingCocoaAsyncSocket:(NSString *) host withPort:(int) port {
    dispatch_semaphore_t sema = dispatch_semaphore_create(0);
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    GCDAsyncSocket *socket= [[GCDAsyncSocket alloc] initWithDelegate:self delegateQueue:queue];
    
    NSString *uuid = [[NSUUID UUID] UUIDString];
    [self.identifierToSockets setObject:socket forKey:uuid];
    
    NSError *error;
    [socket connectToHost:host onPort:port withTimeout:4.5 error:&error];
    
    [self.identifierToSemaphores setObject:sema forKey:uuid];
    
    if(error) {
        NSLog(@"连接主机：%@，端口：%d 时出错，原因：%@", host, port, error);
        [self.identifierToSemaphores removeObjectForKey:uuid];
        [self.identifierToSockets removeObjectForKey:uuid];
        [self.socketToReachable removeObjectForKey:uuid];
        return false;
    }
    
    dispatch_semaphore_wait(sema, dispatch_time(DISPATCH_TIME_NOW, 5*NSEC_PER_SEC));
    
    [self.identifierToSockets removeObjectForKey:uuid];
    [self.identifierToSemaphores removeObjectForKey:uuid];
    BOOL reachable = [self.socketToReachable objectForKey:uuid];
    [self.socketToReachable removeObjectForKey:uuid];
    return reachable;
}

//已经连接到服务器
- (void) socket:(GCDAsyncSocket *) socket didConnectToHost:(nonnull NSString *) host port:(uint16_t) port{
    NSString *uuidFound = nil;
    NSArray<NSString *> *keys = [self.identifierToSockets allKeysForObject:socket];
    if(keys && keys.count>0) {
        uuidFound = keys[0];
    }
    
    if(uuidFound) {
        NSString *identifier = uuidFound;
        [self.socketToReachable setObject:@YES forKey:identifier];
        dispatch_semaphore_t sema = [self.identifierToSemaphores objectForKey:identifier];
        if(sema) {
            dispatch_semaphore_signal(sema);
        }
    }
}

// 连接断开
- (void) socketDidDisconnect:(GCDAsyncSocket *) socket withError:(NSError *) error{
//    if(error) {
//        NSLog(@"++++++++++++%@", error);
//    }
}

////已经接收服务器返回来的数据
//- (void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag{
//    NSLog(@"接收到tag = %ld : %ld 长度的数据",tag,data.length);
//    //连接成功或者收到消息，必须开始read，否则将无法收到消息
//    //不read的话，缓存区将会被关闭
//    // -1 表示无限时长 ， tag
//    [self.socket readDataWithTimeout:-1 tag:10086];
//}
//
////消息发送成功 代理函数 向服务器 发送消息
//- (void)socket:(GCDAsyncSocket *)sock didWriteDataWithTag:(long)tag{
//    NSLog(@"%ld 发送数据成功",tag);
//}

@end
