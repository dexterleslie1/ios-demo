//
//  Book+CoreDataProperties.h
//  ios-coredata
//
//  Created by john on 19/6/10.
//  Copyright © 2019年 future. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "Book+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Book (CoreDataProperties)

+ (NSFetchRequest<Book *> *)fetchRequest;

@property (nonatomic) double price;
@property (nullable, nonatomic, copy) NSString *title;
@property (nullable, nonatomic, retain) Student *owner;

@end

NS_ASSUME_NONNULL_END
