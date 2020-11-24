//
//  StaticClass2.m
//  ios-objective-c
//
//  Created by MacOS on 2020/11/24.
//  Copyright © 2020 ios-objective-c. All rights reserved.
//

#import "StaticClass2.h"

@implementation StaticClass2

+ (void) initialize {
    NSLog(@"%s", __func__);
}

+ (void) load {
    NSLog(@"%s", __func__);
}

@end
