//
//  Student+CoreDataProperties.h
//  ios-coredata
//
//  Created by MacOS on 2020/11/22.
//  Copyright © 2020 future. All rights reserved.
//
//

#import "Student+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Student (CoreDataProperties)

+ (NSFetchRequest<Student *> *)fetchRequest;

@property (nonatomic) int32_t age;
@property (nullable, nonatomic, copy) NSString *name;
@property (nonatomic) int32_t version;
@property (nullable, nonatomic, retain) NSSet<Book *> *books;

@end

@interface Student (CoreDataGeneratedAccessors)

- (void)addBooksObject:(Book *)value;
- (void)removeBooksObject:(Book *)value;
- (void)addBooks:(NSSet<Book *> *)values;
- (void)removeBooks:(NSSet<Book *> *)values;

@end

NS_ASSUME_NONNULL_END
