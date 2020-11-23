//
//  FISClass.h
//  ios-objective-c
//
//  Created by MacOS on 2020/11/23.
//  Copyright © 2020 ios-objective-c. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FISPerson.h"

NS_ASSUME_NONNULL_BEGIN

@interface FISClass : NSObject

@property NSString *name;
@property NSNumber *roomNumber;
@property FISPerson *instructor;
@property NSArray *students;

- (FISClass *) init;
- (FISClass *) initWithName:(NSString *) name
                 roomNumber:(NSNumber *) roomNumber;
- (FISClass *) initWithName:(NSString *) name
                 roomNumber:(NSNumber *) roomNumber
                 instructor:(FISPerson *) instructor
                   students:(NSArray *) students;

- (void) dealloc;

+ (FISClass *) classWithName:(NSString *) name
                  roomNumber:(NSNumber *) roomNumber
                  instructor:(FISPerson *) instructor
                    students:(NSArray *) students;

@end

NS_ASSUME_NONNULL_END
