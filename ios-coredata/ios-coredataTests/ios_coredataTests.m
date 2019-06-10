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

@interface ios_coredataTests : XCTestCase

@end

@implementation ios_coredataTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testInsert {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    AppDelegate * app = [UIApplication sharedApplication].delegate;
    Dog *dog = [NSEntityDescription insertNewObjectForEntityForName:@"Dog" inManagedObjectContext: app.persistentContainer.viewContext];
    dog.name = @"Dog111";
    dog.sex = @"公";
    dog.age = 100;
    [app saveContext];
}

- (void) testFetch {
    AppDelegate * app = [UIApplication sharedApplication].delegate;
    NSEntityDescription * entity = [NSEntityDescription entityForName:@"Dog" inManagedObjectContext:app.persistentContainer.viewContext];
    NSFetchRequest * request = [[NSFetchRequest alloc] init];
    [request setEntity: entity];
    NSArray * array = [app.persistentContainer.viewContext executeFetchRequest:request error:nil];
    for(Dog * dog in array){
        NSLog(@"Dog [name=%@, sex=%@]", dog.name, dog.sex);
    }
}

- (void) testFetchByPredicate {
    AppDelegate * app = [UIApplication sharedApplication].delegate;
    NSEntityDescription * entity = [NSEntityDescription entityForName:@"Dog" inManagedObjectContext:app.persistentContainer.viewContext];
    
    NSPredicate * predicate = [NSPredicate predicateWithFormat: @"name=%@", @"Dog111"];
    
    NSFetchRequest * request = [[NSFetchRequest alloc] init];
    [request setEntity: entity];
    [request setPredicate: predicate];
    NSArray * dogs = [app.persistentContainer.viewContext executeFetchRequest:request error:nil];
    if(dogs.count > 0){
        for(Dog * dog in dogs){
            NSLog(@"Dog name:%@", dog.name);
        }
    }else{
        NSLog(@"No dog found");
    }
    
}

- (void) testUpdate {
    AppDelegate * app = [UIApplication sharedApplication].delegate;
    NSEntityDescription * entity = [NSEntityDescription entityForName: @"Dog" inManagedObjectContext: app.persistentContainer.viewContext];
    
    NSPredicate * predicate = [NSPredicate predicateWithFormat: @"name=%@", @"Dog111"];
    
    NSFetchRequest * request = [[NSFetchRequest alloc] init];
    [request setEntity: entity];
    [request setPredicate: predicate];
    
    NSArray * dogs = [app.persistentContainer.viewContext executeFetchRequest:request error:nil];
    if(dogs.count > 0){
        for(Dog * dog in dogs) {
            dog.sex = @"母";
        }
    }
    [app saveContext];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
