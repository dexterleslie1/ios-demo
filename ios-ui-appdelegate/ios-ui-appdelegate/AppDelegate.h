//
//  AppDelegate.h
//  ios-ui-appdelegate
//
//  Created by john on 19/7/6.
//  Copyright © 2019年 future. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) RootViewController *rootViewController;

@end

