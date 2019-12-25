//
//  Person.h
//  ios-objective-c
//
//  Created by john on 19/6/6.
//  Copyright © 2019年 ios-objective-c. All rights reserved.
//

#import <Foundation/Foundation.h>

/* 演示@property和@synthesize用法 */
@interface Person : NSObject

@property NSString * name;
@property NSString * password;

- (void) toString:(int) age;

@end
