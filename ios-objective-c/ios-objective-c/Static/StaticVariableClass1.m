//
//  StaticVariableClass1.m
//  ios-objective-c
//
//  Created by MacOS on 2020/11/24.
//  Copyright © 2020 ios-objective-c. All rights reserved.
//

#import "StaticVariableClass1.h"

@implementation StaticVariableClass1

static NSNumber *counter = 0;

+ (NSNumber *) getStaticVariable {
    if(!counter) {
        NSLog(@"静态counter变量不存在，已经初始化一个新的静态counter变量");
    }
    int counterTemporary = [counter intValue]+1;
    counter = [NSNumber numberWithInt:counterTemporary];
    return counter;
}

@end
