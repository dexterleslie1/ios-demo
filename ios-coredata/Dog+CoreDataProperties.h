//
//  Dog+CoreDataProperties.h
//  ios-coredata
//
//  Created by john on 19/6/10.
//  Copyright © 2019年 future. All rights reserved.
//

#import "Dog+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Dog (CoreDataProperties)

+ (NSFetchRequest<Dog *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *sex;
@property (nonatomic) int32_t age;

@end

NS_ASSUME_NONNULL_END
