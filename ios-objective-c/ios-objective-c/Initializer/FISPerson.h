//
//  FISPerson.h
//  ios-objective-c
//
//  Created by MacOS on 2020/11/23.
//  Copyright © 2020 ios-objective-c. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FISPerson : NSObject

@property NSString *name;

- (FISPerson *) init;
- (FISPerson *) initWithName:(NSString *) name;

+ (FISPerson *) personWithName:(NSString *) name;

@end

NS_ASSUME_NONNULL_END
