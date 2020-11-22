//
//  ConnectivityManager.m
//  iOS-socket
//
//  Created by MacOS on 2020/11/22.
//  Copyright © 2020 YingShun International Network Co., Limited. All rights reserved.
//

#import "ConnectivityManager.h"

@implementation ConnectivityManager
int counter1;
int counter2;

+ (ConnectivityManager *) sharedInstance {
    static ConnectivityManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!instance) {
            instance = [[self alloc] init];
            instance.identifierToSemaphores = [[NSMutableDictionary alloc] init];
            instance.socketToReachable = [[NSMutableDictionary alloc] init];
        }
    });
    return instance;
}

- (BOOL) checkByUsingCocoaAsyncSocket:(NSString *) host withPort:(int) port {
    dispatch_semaphore_t sema = dispatch_semaphore_create(0);
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    GCDAsyncSocket *socket= [[GCDAsyncSocket alloc] initWithDelegate:self delegateQueue:queue];
    
    NSString *identifier = [NSString stringWithFormat:@"%@:%d", host, port];
    if(![self.identifierToSemaphores objectForKey:identifier]) {
        NSMutableArray<dispatch_semaphore_t> *semaphores = [[NSMutableArray alloc] init];
        [self.identifierToSemaphores setObject:semaphores forKey:identifier];
    }
    
    NSError *error;
    [socket connectToHost:host onPort:port withTimeout:4.5 error:&error];
    
    NSMutableArray<dispatch_semaphore_t> *semaphores = [self.identifierToSemaphores objectForKey:identifier];
    [semaphores addObject:sema];
    
    if(error) {
        NSLog(@"连接主机：%@，端口：%d 时出错，原因：%@", host, port, error);
        [semaphores removeObject:sema];
        return false;
    }
    
    dispatch_semaphore_wait(sema, dispatch_time(DISPATCH_TIME_NOW, 5*NSEC_PER_SEC));
    
    [semaphores removeObject:sema];
    BOOL reachable = [self.socketToReachable objectForKey:identifier];
    if(!semaphores || semaphores.count<=0) {
        [self.socketToReachable removeObjectForKey:identifier];
    }
    return reachable;
}

//已经连接到服务器
- (void) socket:(GCDAsyncSocket *) socket didConnectToHost:(nonnull NSString *) host port:(uint16_t) port{
    NSString *identifier = [NSString stringWithFormat:@"%@:%d", host, port];
    [self.socketToReachable setObject:@YES forKey:identifier];
    NSMutableArray<dispatch_semaphore_t> *semaphores = [self.identifierToSemaphores objectForKey:identifier];
    if(semaphores && semaphores.count>0) {
        for(int i=0; i<semaphores.count; i++) {
            dispatch_semaphore_t sema = semaphores[i];
            if(sema) {
                dispatch_semaphore_signal(sema);
            }
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
