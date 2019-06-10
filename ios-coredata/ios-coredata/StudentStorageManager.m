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
    static StudentStorageManager * manager;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
        AppDelegate * appDelegate = [UIApplication sharedApplication].delegate;
        manager.context = appDelegate.persistentContainer.viewContext;
    });
    
    return manager;
}

- (void)fetchAndDisplay {
    NSFetchRequest * request = [NSFetchRequest fetchRequestWithEntityName: @"Student"];
    NSArray * students = [_context executeFetchRequest: request error: nil];
    if(students.count > 0) {
        for(Student * student in students) {
            NSLog(@"Student [name=%@,age=%d]", student.name, student.age);
            NSSet * books = student.books;
            for(Book * book in books) {
                NSLog(@"Book [title=%@,price=%f]", book.title, book.price);
            }
        }
    }else {
        NSLog(@"No students found");
    }
}

@end
