//
//  ios_global_exception_handlerUITests.m
//  ios-global-exception-handlerUITests
//
//  Created by dexterleslie@gmail.com on 2019/11/29.
//  Copyright © 2019 dexterleslie@gmail.com. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface ios_global_exception_handlerUITests : XCTestCase

@end

@implementation ios_global_exception_handlerUITests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.

    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;

    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];

    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

@end
