//
//  Person.m
//  ios-objective-c
//
//  Created by john on 19/6/6.
//  Copyright © 2019年 ios-objective-c. All rights reserved.
//

#import "Person.h"

@implementation Person

@synthesize name;
@synthesize password;

- (void) toString:(int) age {
    NSLog(@"age=%d, name=%@, password=%@", age, name, password);
}

@end
