//
//  ClassB.h
//  ios-objective-c
//
//  Created by MacOS on 2020/11/23.
//  Copyright © 2020 ios-objective-c. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ClassA.h"

NS_ASSUME_NONNULL_BEGIN

@interface ClassB : ClassA

@property int age;

- (ClassB *) initWithName:(NSString *) name withAge:(int) age;

@end

NS_ASSUME_NONNULL_END
