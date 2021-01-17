//
//  Person+CoreDataProperties.h
//  iOS-coredata-migration-change-attribute-type
//
//  Created by MacOS on 2021/1/17.
//
//

#import "Person+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Person (CoreDataProperties)

+ (NSFetchRequest<Person *> *)fetchRequest;

// @property (nullable, nonatomic, copy) NSString *age;
@property (nonatomic) int64_t age;
@property (nullable, nonatomic, copy) NSString *name;

@end

NS_ASSUME_NONNULL_END
