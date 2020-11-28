//
//  AppDelegate.m
//  iOS-layout
//
//  Created by MacOS on 2020/11/28.
//  Copyright © 2020 YingShun International Network Co., Limited. All rights reserved.
//

#import "AppDelegate.h"
#import "XibViewController.h"
#import "AutolayoutViewController.h"
#import "Autolayout2ViewController.h"
#import "AutolayoutXibViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor redColor];
//    UIViewController *viewController = [[XibViewController alloc] initWithNibName:@"XibViewController"
//                                                                            bundle:[NSBundle mainBundle]];
//    UIViewController *viewController = [[Autolayout2ViewController alloc] initWithNibName:@"Autolayout2ViewController"
//                                                                                  bundle:[NSBundle mainBundle]];
    UIViewController *viewController = [[AutolayoutXibViewController alloc] initWithNibName:@"AutolayoutXibViewController"
                                                                                     bundle:[NSBundle mainBundle]];
    self.window.rootViewController = viewController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
