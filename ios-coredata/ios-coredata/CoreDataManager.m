//
//  CoreDataManager.m
//  ios-coredata
//
//  Created by MacOS on 2020/10/2.
//  Copyright © 2020 future. All rights reserved.
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

- (void) saveContext {
    if(self.rootContextInternal) {
        [self saveContext: self.rootContextInternal];
    }
}

- (void) saveContext:(NSManagedObjectContext *) context {
    [context performBlockAndWait:^{
        if(!context) {
            return;
        }

        if(context.hasChanges) {
            NSError *error = nil;
            [context save:&error];
            NSAssert(!error, @"调用[context save:&error];失败，原因%@", error);
        }

        if(context.parentContext) {
            [self saveContext: context.parentContext];
        }
    }];
}

- (NSManagedObjectModel *) objectModel {
    @synchronized (self) {
        if(!self.objectModelInternal) {
            NSURL *url       = [[NSBundle mainBundle] URLForResource:@"ios_coredata" withExtension:@"momd"];
            self.objectModelInternal = [[NSManagedObjectModel alloc] initWithContentsOfURL:url];
        }
        return self.objectModelInternal;
    }
}

- (NSPersistentStoreCoordinator *) persistentStoreCoordinator {
    @synchronized (self) {
        if(!self.persistentStoreCoordinatorInternal) {
            NSManagedObjectModel *objectModel = [self objectModel];
            self.persistentStoreCoordinatorInternal = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:objectModel];
            
            NSString *documentPath  = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
            NSURL *storeURL         = [NSURL fileURLWithPath:[documentPath stringByAppendingPathComponent:@"coredata-demo.sqlite"]];
            NSLog(@"sql文件位置 %@", storeURL);
            NSError *error            = nil;
            NSDictionary *optionsDictionary = [NSDictionary dictionaryWithObjectsAndKeys: [NSNumber numberWithBool:YES]
                                                                                           ,NSMigratePersistentStoresAutomaticallyOption
                                                                                           ,[NSNumber numberWithBool:YES]
                                                                                           ,NSInferMappingModelAutomaticallyOption
                                                                                           ,nil];
            [self.persistentStoreCoordinatorInternal addPersistentStoreWithType:NSSQLiteStoreType
                                                          configuration:nil URL:storeURL
                                                                options:optionsDictionary
                                                                  error:&error];
            NSAssert(!error, @"调用addPersistentStoreWithType失败，原因%@", error);
        }
        return self.persistentStoreCoordinatorInternal;
    }
}

- (NSManagedObjectContext *) rootContext {
    @synchronized (self) {
        if(!self.rootContextInternal) {
            self.rootContextInternal = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
            NSPersistentStoreCoordinator *persistentStoreCoordinator = self.persistentStoreCoordinator;
            [self.rootContextInternal setPersistentStoreCoordinator:persistentStoreCoordinator];
        }
        return self.rootContextInternal;
    }
}

//- (NSManagedObjectContext *) mainContext {
//    @synchronized (self) {
//        if(!self.mainContextInternal) {
//            self.mainContextInternal = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
////            NSPersistentStoreCoordinator *persistentStoreCoordinator = self.persistentStoreCoordinator;
////            [self.mainContextInternal setPersistentStoreCoordinator:persistentStoreCoordinator];
//            NSManagedObjectContext *rootContextInternal = [self rootContext];
//            [self.mainContextInternal setParentContext: rootContextInternal];
//        }
//        return self.mainContextInternal;
//    }
//}

@end
