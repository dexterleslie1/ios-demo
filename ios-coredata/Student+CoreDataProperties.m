//
//  Student+CoreDataProperties.m
//  ios-coredata
//
//  Created by MacOS on 2020/11/22.
//  Copyright © 2020 future. All rights reserved.
//
//

#import "Student+CoreDataProperties.h"

@implementation Student (CoreDataProperties)

+ (NSFetchRequest<Student *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Student"];
}

@dynamic age;
@dynamic name;
@dynamic version;
@dynamic books;

@end
