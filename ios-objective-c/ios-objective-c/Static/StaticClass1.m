//
//  StaticClass1.m
//  ios-objective-c
//
//  Created by MacOS on 2020/11/24.
//  Copyright © 2020 ios-objective-c. All rights reserved.
//

#import "StaticClass1.h"

@implementation StaticClass1

+ (void) initialize {
    NSLog(@"%s", __func__);
}

+ (void) load {
    NSLog(@"%s", __func__);
}

- (StaticClass1 *) init {
    self = [super init];
    if(!self) {
        return nil;
    }
        
    NSLog(@"%s %@", __func__, [self class]);
    return self;
}

@end
