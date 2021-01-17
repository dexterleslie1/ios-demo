//
//  Person+CoreDataProperties.m
//  iOS-coredata-migration-change-attribute-type
//
//  Created by MacOS on 2021/1/17.
//
//

#import "Person+CoreDataProperties.h"

@implementation Person (CoreDataProperties)

+ (NSFetchRequest<Person *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Person"];
}

@dynamic age;
@dynamic name;

@end
