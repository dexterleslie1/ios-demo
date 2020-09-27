//
//  Singleton2Manager.m
//  iOS-singleton
//
//  Created by MacOS on 2020/9/27.
//  Copyright © 2020 YingShun International Network Co., Limited. All rights reserved.
//

#import "Singleton2Manager.h"

@implementation Singleton2Manager

+ (id) sharedInstance {
    static Singleton2Manager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!instance) {
            instance = [[self alloc] init];
        }
    });
    return instance;
}

- (void) method {
    NSLog(@"Singleton2 method方法输出日志");
}

@end
