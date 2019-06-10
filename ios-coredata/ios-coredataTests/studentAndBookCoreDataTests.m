//
//  studentAndBookCoreDataTests.m
//  ios-coredata
//
//  Created by john on 19/6/10.
//  Copyright © 2019年 future. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AppDelegate.h"
#import "Student+CoreDataClass.h"
#import "Book+CoreDataClass.h"
#import "StudentStorageManager.h"

@interface studentAndBookCoreDataTests : XCTestCase

@property (nonatomic, strong) NSManagedObjectContext * context;

@end

@implementation studentAndBookCoreDataTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    AppDelegate * appDelegate = [UIApplication sharedApplication].delegate;
    _context = appDelegate.persistentContainer.viewContext;
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testAddStudentWithBooks {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    NSEntityDescription * entity = [NSEntityDescription entityForName: @"Student" inManagedObjectContext: _context];
    Student * student = [[Student alloc] initWithEntity: entity insertIntoManagedObjectContext: _context];
    
    student.name = [NSString stringWithFormat: @"user%@", [NSUUID UUID].UUIDString];
    student.age = 100;
    
    
    entity = [NSEntityDescription entityForName: @"Book" inManagedObjectContext: _context];
    Book * book = [[Book alloc] initWithEntity: entity insertIntoManagedObjectContext: _context];
    book.price = 23.8;
    book.title = @"红楼梦";
    
    [student addBooksObject: book];
    
    [_context save:nil];
}

- (void) testFetchStudent {
    [[StudentStorageManager sharedInstance] fetchAndDisplay];
    [[StudentStorageManager sharedInstance] fetchAndDisplay];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
