//
//  FISClass.m
//  ios-objective-c
//
//  Created by MacOS on 2020/11/23.
//  Copyright © 2020 ios-objective-c. All rights reserved.
//

#import "FISClass.h"

@implementation FISClass

- (FISClass *) init {
    self = [self initWithName:@"" roomNumber:0 instructor:[[FISPerson alloc] init] students:@[]];
    return self;
}

- (FISClass *) initWithName:(NSString *)name roomNumber:(NSNumber *)roomNumber {
    self = [self initWithName:name roomNumber:roomNumber instructor:[[FISPerson alloc] init] students:@[]];
    return self;
}

- (FISClass *) initWithName:(NSString *) name
                 roomNumber:(NSNumber *) roomNumber
                 instructor:(FISPerson *) instructor
                   students:(NSArray *) students {
    self = [super init];
    if(self) {
        self.name = name;
        self.roomNumber = roomNumber;
        self.instructor = instructor;
        self.students = students;
    }
    return self;
}

- (void) dealloc {
    self.name = nil;
    self.roomNumber = nil;
    self.instructor = nil;
    self.students = nil;
    NSLog(@"FISClass析构函数被调用");
}

+ (FISClass *) classWithName:(NSString *) name
                  roomNumber:(NSNumber *) roomNumber
                  instructor:(FISPerson *) instructor
                    students:(NSArray *) students {
    FISClass *class = [[FISClass alloc] initWithName:name roomNumber:roomNumber instructor:instructor students:students];
    return class;
}

@end
