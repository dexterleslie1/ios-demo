//
//  Singleton1Manager.m
//  iOS-singleton
//
//  Created by MacOS on 2020/9/27.
//  Copyright © 2020 YingShun International Network Co., Limited. All rights reserved.
//

#import "Singleton1Manager.h"

@implementation Singleton1Manager

+ (id) sharedInstance {
    static Singleton1Manager *instance;
    @synchronized (self) {
        if(!instance) {
            instance = [[Singleton1Manager alloc] init];
        }
    }
    return instance;
}

- (void) method {
    NSLog(@"Singleton1 method方法输出日志");
}

@end
