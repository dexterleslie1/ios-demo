//
//  DemoEntityMigrationPolicy.h
//  iOS-coredata-migration-change-attribute-type
//
//  Created by MacOS on 2021/1/17.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface DemoEntityMigrationPolicy : NSEntityMigrationPolicy

- (NSNumber *) fromStringToLong:(NSString *) value;

@end

NS_ASSUME_NONNULL_END
