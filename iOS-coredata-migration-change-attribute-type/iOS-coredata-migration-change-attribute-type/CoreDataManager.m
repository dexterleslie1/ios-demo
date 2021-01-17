//
//  CoreDataManager.m
//  ZPChat
//
//  Created by MacOS on 2020/10/3.
//  Copyright © 2020 yiyingda. All rights reserved.
//

#import "CoreDataManager.h"

@implementation CoreDataManager

+ (CoreDataManager *) sharedInstance {
    static CoreDataManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!instance) {
            instance = [[self alloc] init];
        }
    });
    return instance;
}

- (void) setupUserDB:(NSString *)identifier {
    identifier = [identifier stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSParameterAssert([identifier length]>0);
    
    @synchronized (self) {
        if(!self.rootContextUserDBInternal || ![identifier isEqualToString: self.userDBIdentifier]) {
            self.userDBIdentifier = identifier;
            
            // 初始化NSManagedObjectModel
            NSURL *url = [[NSBundle mainBundle] URLForResource:@"iOS_coredata_migration_change_attribute_type" withExtension:@"momd"];
            NSManagedObjectModel *objectModelInternalUserDB = [[NSManagedObjectModel alloc] initWithContentsOfURL:url];
            
            // 初始化NSPersistentStoreCoordinator
            NSString *directory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
            NSString *filename = [NSString stringWithFormat:@"data%@.sqlite", identifier];
            url = [NSURL fileURLWithPath:[directory stringByAppendingPathComponent:filename]];
            
            // NOTE: 不再支持上传sqlite数据库文件
//            NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
//            NSString *sqliteUrlStr = [url absoluteString];
//            [userDefault setObject:sqliteUrlStr forKey:@"SqliteUrl"];
            
            self.persistentStoreCoordinatorUserDBInternal = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel: objectModelInternalUserDB];
            NSDictionary *options = @{NSMigratePersistentStoresAutomaticallyOption:@YES,NSInferMappingModelAutomaticallyOption:@YES};
            NSError *error = nil;
            [self.persistentStoreCoordinatorUserDBInternal addPersistentStoreWithType:NSSQLiteStoreType
                                                                  configuration:nil
                                                                            URL:url
                                                                        options:options
                                                                          error:&error];
            NSAssert(!error, @"初始化persistentStoreCoordinatorUserDB失败，原因%@", error);
            
            // 初始化根MOC
            self.rootContextUserDBInternal = [[NSManagedObjectContext alloc] initWithConcurrencyType: NSPrivateQueueConcurrencyType];
            [self.rootContextUserDBInternal setPersistentStoreCoordinator: self.persistentStoreCoordinatorUserDBInternal];
            
            self.contextMainUserDBInternal = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
            [self.contextMainUserDBInternal setParentContext:self.rootContextUserDBInternal];
            self.contextMainUserDBInternal.automaticallyMergesChangesFromParent = true;
            
            self.contextPrivateUserDBInternal = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
            [self.contextPrivateUserDBInternal setParentContext:self.rootContextUserDBInternal];
            self.contextPrivateUserDBInternal.automaticallyMergesChangesFromParent = true;
            NSLog(@"成功初始化用户数据库，文件路径 %@", url);
        }
    }
}

- (void) cleanup {
    self.userDBIdentifier = nil;
    self.contextMainUserDBInternal = nil;
    self.contextPrivateUserDBInternal = nil;
    self.rootContextUserDBInternal = nil;
    self.persistentStoreCoordinatorUserDBInternal = nil;
}

- (NSManagedObjectContext *) getChildContext {
    NSManagedObjectContextConcurrencyType concurrencyType;
    // 判断当前线程是否为主线程
    if([NSThread isMainThread]) {
        concurrencyType = NSMainQueueConcurrencyType;
    } else {
        concurrencyType = NSPrivateQueueConcurrencyType;
    }
    NSManagedObjectContext *context = [self getChildContext:concurrencyType];
    return context;
}

- (NSManagedObjectContext *) getChildContext:(NSManagedObjectContextConcurrencyType) concurrencyType {
    NSManagedObjectContext *context;
    if(concurrencyType == NSMainQueueConcurrencyType) {
        context = self.contextMainUserDBInternal;
    } else {
        context = self.contextPrivateUserDBInternal;
    }
    return context;
}

- (void) save {
    if(self.rootContextUserDBInternal) {
        [self save: self.rootContextUserDBInternal];
    }
}

- (void) save:(NSManagedObjectContext *)context {
    [context performBlockAndWait:^{
        if(!context) {
            return;
        }

        if(context.hasChanges) {
            NSError *error = nil;
            [context save:&error];
            NSAssert(!error, @"CoreData保存数据失败，原因%@", error);
        }

        if(context.parentContext) {
            [self save: context.parentContext];
        }
    }];
}

@end
