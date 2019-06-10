//
//  Student+CoreDataProperties.h
//  ios-coredata
//
//  Created by john on 19/6/10.
//  Copyright © 2019年 future. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "Student+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Student (CoreDataProperties)

+ (NSFetchRequest<Student *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nonatomic) int32_t age;
@property (nullable, nonatomic, retain) NSSet<Book *> *books;

@end

@interface Student (CoreDataGeneratedAccessors)

- (void)addBooksObject:(Book *)value;
- (void)removeBooksObject:(Book *)value;
- (void)addBooks:(NSSet<Book *> *)values;
- (void)removeBooks:(NSSet<Book *> *)values;

@end

NS_ASSUME_NONNULL_END
