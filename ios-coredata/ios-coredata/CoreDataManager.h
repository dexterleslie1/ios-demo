//
//  CoreDataManager.h
//  ios-coredata
//
//  Created by MacOS on 2020/10/2.
//  Copyright © 2020 future. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface CoreDataManager : NSObject

/**
 托管对象模型
 */
@property(strong, nonatomic) NSManagedObjectModel *objectModelInternal;
/**
 持久化存储协调器
 */
@property(strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinatorInternal;
///**
// UI线程托管对象上下文
// */
//@property(strong, nonatomic) NSManagedObjectContext *mainContextInternal;
/**
 根托管对象上下文，是系统所有托管对象上下文的父级托管对象上下文
 在保存或者修改大量数据时，根托管对象上下文在后台保存和更新数据不会导致UI卡顿
 */
@property(strong, nonatomic) NSManagedObjectContext *rootContextInternal;

+ (CoreDataManager *) sharedInstance;

/**
 获取NSPersistentStoreCoordinator
 */
- (NSPersistentStoreCoordinator *) persistentStoreCoordinator;

- (NSManagedObjectContext *) rootContext;

///**
// 获取NSMainQueueConcurrencyType类型MOC
// */
//- (NSManagedObjectContext *) mainContext;

/**
 保存NSManagedObjectContext
 */
- (void) saveContext;
- (void) saveContext:(NSManagedObjectContext *) context;

@end

NS_ASSUME_NONNULL_END
