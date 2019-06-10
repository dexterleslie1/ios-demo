//
//  ios_coredataTests.m
//  ios-coredataTests
//
//  Created by john on 19/6/9.
//  Copyright © 2019年 future. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AppDelegate.h"
#import "Dog+CoreDataClass.h"

@interface dogsCoreDataTests : XCTestCase

@property (nonatomic, strong) NSManagedObjectContext * context;

@end

@implementation dogsCoreDataTests

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

- (void)testInsert {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    Dog *dog = [NSEntityDescription insertNewObjectForEntityForName:@"Dog" inManagedObjectContext: _context];
    dog.name = @"Dog111";
    dog.sex = @"公";
    dog.age = 100;
    [_context save:nil];
}

- (void) testFetch {
    NSEntityDescription * entity = [NSEntityDescription entityForName:@"Dog" inManagedObjectContext:_context];
    NSFetchRequest * request = [[NSFetchRequest alloc] init];
    [request setEntity: entity];
    NSArray * array = [_context executeFetchRequest:request error:nil];
    for(Dog * dog in array){
        NSLog(@"Dog [name=%@, sex=%@]", dog.name, dog.sex);
    }
}

- (void) testFetchByPredicate {
    NSEntityDescription * entity = [NSEntityDescription entityForName:@"Dog" inManagedObjectContext:_context];
    
    NSPredicate * predicate = [NSPredicate predicateWithFormat: @"name=%@", @"Dog111"];
    
    NSFetchRequest * request = [[NSFetchRequest alloc] init];
    [request setEntity: entity];
    [request setPredicate: predicate];
    NSArray * dogs = [_context executeFetchRequest:request error:nil];
    if(dogs.count > 0){
        for(Dog * dog in dogs){
            NSLog(@"Dog [name=%@, sex=%@]", dog.name, dog.sex);
        }
    }else{
        NSLog(@"No dog found");
    }
    
}

- (void) testUpdate {
    NSEntityDescription * entity = [NSEntityDescription entityForName: @"Dog" inManagedObjectContext: _context];
    
    NSPredicate * predicate = [NSPredicate predicateWithFormat: @"name=%@", @"Dog111"];
    
    NSFetchRequest * request = [[NSFetchRequest alloc] init];
    [request setEntity: entity];
    [request setPredicate: predicate];
    
    NSArray * dogs = [_context executeFetchRequest:request error:nil];
    if(dogs.count > 0){
        for(Dog * dog in dogs) {
            dog.sex = @"母";
        }
    }
    [_context save:nil];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
