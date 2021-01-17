//
//  CoreDataManager.h
//  ZPChat
//
//  Created by MacOS on 2020/10/3.
//  Copyright © 2020 yiyingda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN
/**
 用于管理CoreData相关资源
 */
@interface CoreDataManager : NSObject

@property(strong, nonatomic) NSString *userDBIdentifier;
@property(strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinatorUserDBInternal;
@property(strong, nonatomic) NSManagedObjectContext *rootContextUserDBInternal;
@property(strong, nonatomic) NSManagedObjectContext *contextMainUserDBInternal;
@property(strong, nonatomic) NSManagedObjectContext *contextPrivateUserDBInternal;

+ (CoreDataManager *) sharedInstance;

/**
 使用指定identifier初始化User DB CoreData stack
 @param identifier 此参数作为CoreData数据文件后缀，例如identifier=3004生成CoreData数据文件为data3004.sqlite
 */
- (void) setupUserDB:(NSString *) identifier;
/**
 用户退出或者异地登录退出时调用释放CoreData stack相关资源
 */
- (void) cleanup;
/**
 获取NSMainQueueConcurrencyType或者NSPrivateQueueConcurrencyType类型子context
 当前主线程时获取NSMainQueueConcurrencyType类型context
 当前非主线程时获取NSPrivateQueueConcurrencyType类型context
 */
- (NSManagedObjectContext *) getChildContext;
- (NSManagedObjectContext *) getChildContext:(NSManagedObjectContextConcurrencyType) concurrencyType;

- (void) save;
- (void) save: (NSManagedObjectContext *) context;

@end

NS_ASSUME_NONNULL_END
