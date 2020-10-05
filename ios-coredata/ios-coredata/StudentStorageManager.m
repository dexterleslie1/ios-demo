//
//  StudentStorageManager.m
//  ios-coredata
//
//  Created by john on 19/6/10.
//  Copyright © 2019年 future. All rights reserved.
//

#import "StudentStorageManager.h"
#import "AppDelegate.h"
#import "Student+CoreDataClass.h"
#import "Book+CoreDataClass.h"

@implementation StudentStorageManager

+ (id)sharedInstance {
    static StudentStorageManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!instance) {
            instance = [[self alloc] init];
        }
    });
    return instance;
}

//- (void)fetchAndDisplay {
//    NSManagedObjectContext *context = [[CoreDataManager sharedInstance] rootContextInternal];
//    NSFetchRequest * request = [NSFetchRequest fetchRequestWithEntityName: @"Student"];
//    NSArray * students = [context executeFetchRequest: request error: nil];
//    if(students.count > 0) {
//        for(Student * student in students) {
//            NSLog(@"Student [name=%@,age=%d]", student.name, student.age);
//            NSSet * books = student.books;
//            for(Book * book in books) {
//                NSLog(@"Book [title=%@,price=%f]", book.title, book.price);
//            }
//        }
//    }else {
//        NSLog(@"No students found");
//    }
//}

- (void) testCorrectUsage {
    NSManagedObjectContext *context = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
    NSManagedObjectContext *rootContext = [[CoreDataManager sharedInstance] rootContext];
    [context setParentContext: rootContext];

    [context performBlock:^{
        NSMutableArray<NSDictionary *> *students = [NSMutableArray array];
        for(int i=0; i<10000; i++) {
            NSDictionary *dictionaryStudent = @{@"age": @(100+i), @"name":[NSString stringWithFormat:@"名称%d", i]};
            [students addObject:dictionaryStudent];
        }

        for (NSDictionary *dictionaryStudent in students) {
            Student *student = [NSEntityDescription insertNewObjectForEntityForName:@"Student" inManagedObjectContext:context];
            student.age = [[dictionaryStudent objectForKey:@"age"] intValue];
            student.name   = [dictionaryStudent objectForKey:@"name"];
        }
        [[CoreDataManager sharedInstance] saveContext: context];
        NSLog(@"新增完毕");
        
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Student"];
        NSArray *students1 = [context executeFetchRequest:fetchRequest error:nil];

        for(Student *student in students1) {
            student.name = @"newName";
        }
        [[CoreDataManager sharedInstance] saveContext: context];
        NSLog(@"修改完毕");
    }];
}

- (void) testSingleMOCSharedBetweenThreads {
    @synchronized (self) {
        if(!self.singleMOC) {
            self.singleMOC = [[NSManagedObjectContext alloc] initWithConcurrencyType: NSPrivateQueueConcurrencyType];
            NSManagedObjectContext *rootContext = [[CoreDataManager sharedInstance] rootContext];
            [self.singleMOC setParentContext: rootContext];
            NSLog(@"首次初始化singleMOC");
        }
    }
    
    [self.singleMOC performBlock:^{
        NSMutableArray<NSDictionary *> *students = [NSMutableArray array];
        for(int i=0; i<10000; i++) {
            NSDictionary *dictionaryStudent = @{@"age": @(100+i), @"name":[NSString stringWithFormat:@"名称%d", i]};
            [students addObject:dictionaryStudent];
        }
        
        for (NSDictionary *dictionaryStudent in students) {
            Student *student = [NSEntityDescription insertNewObjectForEntityForName:@"Student" inManagedObjectContext:self.singleMOC];
            student.age = [[dictionaryStudent objectForKey:@"age"] intValue];
            student.name   = [dictionaryStudent objectForKey:@"name"];
        }
        [[CoreDataManager sharedInstance] saveContext: self.singleMOC];
        NSLog(@"新增完毕");
        
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Student"];
        NSArray *studentsR = [self.singleMOC executeFetchRequest:fetchRequest error:nil];

        for(Student *student in studentsR) {
            student.name = @"newName";
        }
        [[CoreDataManager sharedInstance] saveContext: self.singleMOC];
        NSLog(@"修改完毕");
    }];
}

- (void) testManagedObjectSharedBetweenThreads {    
    dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"读取数据线程 %@", [NSThread currentThread]);
        NSManagedObjectContext *rootContext = [[CoreDataManager sharedInstance] rootContext];
        NSManagedObjectContext *context = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
        [context setParentContext:rootContext];
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Student"];
        fetchRequest.returnsObjectsAsFaults = NO;
        self.studentSharedBetweenThreads = [context executeFetchRequest:fetchRequest error:nil];
    });
    // NOTE：到此加载studentSharedBetweenThreads的context已销毁，studentSharedBetweenThreads相当于CoreData fault对象
    // 不能使用另外线程对其进行相关操作
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"修改数据线程 %@", [NSThread currentThread]);
        
        NSManagedObjectContext *anotherMOC = [[NSManagedObjectContext alloc] initWithConcurrencyType: NSPrivateQueueConcurrencyType];
        NSManagedObjectContext *rootContext = [[CoreDataManager sharedInstance] rootContext];
        [anotherMOC setParentContext: rootContext];
        for(Student *student in self.studentSharedBetweenThreads) {
            student.name = @"newName";
        }
        [[CoreDataManager sharedInstance] saveContext:anotherMOC];
        NSLog(@"修改完毕");
    });
}

- (void) testTwoIndependentMOCInconsistent {
    NSPersistentStoreCoordinator *persistentStoreCoordinator = [[CoreDataManager sharedInstance] persistentStoreCoordinator];
    NSManagedObjectContext *context1 = [[NSManagedObjectContext alloc] initWithConcurrencyType: NSPrivateQueueConcurrencyType];
    [context1 setPersistentStoreCoordinator: persistentStoreCoordinator];
    NSManagedObjectContext *context2 = [[NSManagedObjectContext alloc] initWithConcurrencyType: NSPrivateQueueConcurrencyType];
    [context2 setPersistentStoreCoordinator: persistentStoreCoordinator];
//    NSManagedObjectContext *rootContext = [[CoreDataManager sharedInstance] rootContext];
//    [context1 setParentContext: rootContext];
//    [context2 setParentContext: rootContext];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Student"];
    long countOrigin = [context1 countForFetchRequest: fetchRequest error:nil];
    
    NSMutableArray<NSDictionary *> *students = [NSMutableArray array];
    for(int i=0; i<10000; i++) {
        NSDictionary *dictionaryStudent = @{@"age": @(100+i), @"name":[NSString stringWithFormat:@"名称%d", i]};
        [students addObject:dictionaryStudent];
    }
    for (NSDictionary *dictionaryStudent in students) {
        Student *student = [NSEntityDescription insertNewObjectForEntityForName:@"Student" inManagedObjectContext:context1];
        student.age = [[dictionaryStudent objectForKey:@"age"] intValue];
        student.name   = [dictionaryStudent objectForKey:@"name"];
    }
    [[CoreDataManager sharedInstance] saveContext: context1];
    
    fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Student"];
    long countCurrent = [context1 countForFetchRequest: fetchRequest error:nil];
    NSAssert(countOrigin+10000==countCurrent, @"意料之外错误");
    
    fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Student"];
    long countFromContext2 = [context2 countForFetchRequest: fetchRequest error:nil];
    NSAssert(countFromContext2==countOrigin, @"意料之外错误");
}

- (void) testPerformBlockAndPerformBlockAndWait {
    NSManagedObjectContext *contextMain = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    NSManagedObjectContext *rootContext = [[CoreDataManager sharedInstance] rootContext];
    [contextMain setParentContext: rootContext];
    [contextMain performBlockAndWait:^{
        NSMutableArray<NSDictionary *> *students = [NSMutableArray array];
        for(int i=0; i<10; i++) {
            NSDictionary *dictionaryStudent = @{@"age": @(100+i), @"name":[NSString stringWithFormat:@"名称%d", i]};
            [students addObject:dictionaryStudent];
        }

        for (NSDictionary *dictionaryStudent in students) {
            Student *student = [NSEntityDescription insertNewObjectForEntityForName:@"Student" inManagedObjectContext:contextMain];
            student.age = [[dictionaryStudent objectForKey:@"age"] intValue];
            student.name   = [dictionaryStudent objectForKey:@"name"];
        }
        [[CoreDataManager sharedInstance] saveContext: contextMain];
        NSLog(@"新增完毕");
    }];
    
    NSManagedObjectContext *contextPrivate = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
    [contextPrivate setParentContext: rootContext];
    [contextPrivate performBlock:^{
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Student"];
        NSArray *students1 = [contextPrivate executeFetchRequest:fetchRequest error:nil];
        
        for(Student *student in students1) {
            student.name = @"newName";
        }
        [[CoreDataManager sharedInstance] saveContext: contextPrivate];
        NSLog(@"修改完毕");
    }];
}

@end
