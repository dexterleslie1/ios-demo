//
//  main.m
//  iOS-keepalive-with-silent-audio
//
//  Created by MacOS on 2020/9/14.
//  Copyright © 2020 YingShun International Network Co., Limited. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
