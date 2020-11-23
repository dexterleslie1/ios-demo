//
//  ClassB.m
//  ios-objective-c
//
//  Created by MacOS on 2020/11/23.
//  Copyright © 2020 ios-objective-c. All rights reserved.
//

#import "ClassB.h"

@implementation ClassB

- (ClassB *) initWithName:(NSString *) name withAge:(int) age {
    self = [super initWithName:name];
    if(self) {
        self.age = age;
    }
    return self;
}

- (NSString *) toString {
    NSString *result = [super toString];
    result = [NSString stringWithFormat:@"%@,age=%d", result, self.age];
    return result;
}

@end
