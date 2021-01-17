//
//  DemoEntityMigrationPolicy.m
//  iOS-coredata-migration-change-attribute-type
//
//  Created by MacOS on 2021/1/17.
//

#import "DemoEntityMigrationPolicy.h"

@implementation DemoEntityMigrationPolicy

- (NSNumber *) fromStringToLong:(NSString *) value {
    NSNumber *returnValue = [NSNumber numberWithLong:[value longLongValue]];
    return returnValue;
}

@end
