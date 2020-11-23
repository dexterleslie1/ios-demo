//
//  ClassA.m
//  ios-objective-c
//
//  Created by MacOS on 2020/11/23.
//  Copyright © 2020 ios-objective-c. All rights reserved.
//

#import "ClassA.h"

@implementation ClassA

- (ClassA *) initWithName:(NSString *) name {
    self = [super init];
    if(self) {
        self.name = name;
    }
    return self;
}

- (NSString *) toString {
    NSString *result = [NSString stringWithFormat:@"name=%@", self.name];
    return result;
}

@end
