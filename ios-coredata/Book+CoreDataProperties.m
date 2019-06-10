//
//  Book+CoreDataProperties.m
//  ios-coredata
//
//  Created by john on 19/6/10.
//  Copyright © 2019年 future. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "Book+CoreDataProperties.h"

@implementation Book (CoreDataProperties)

+ (NSFetchRequest<Book *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Book"];
}

@dynamic price;
@dynamic title;
@dynamic owner;

@end
