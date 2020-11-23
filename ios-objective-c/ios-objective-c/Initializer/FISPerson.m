//
//  FISPerson.m
//  ios-objective-c
//
//  Created by MacOS on 2020/11/23.
//  Copyright © 2020 ios-objective-c. All rights reserved.
//

#import "FISPerson.h"

@implementation FISPerson

- (FISPerson *) init {
    self = [self initWithName:@""];
    return self;
}

- (FISPerson *) initWithName:(NSString *)name {
    self = [super init];
    if(self) {
        self.name = name;
    }
    return self;
}

+ (FISPerson *) personWithName:(NSString *) name {
    FISPerson *person = [[FISPerson alloc] initWithName:name];
    return person;
}

@end
