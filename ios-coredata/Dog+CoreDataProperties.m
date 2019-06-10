//
//  Dog+CoreDataProperties.m
//  ios-coredata
//
//  Created by john on 19/6/10.
//  Copyright © 2019年 future. All rights reserved.
//

#import "Dog+CoreDataProperties.h"

@implementation Dog (CoreDataProperties)

+ (NSFetchRequest<Dog *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Dog"];
}

@dynamic name;
@dynamic sex;
@dynamic age;

@end
