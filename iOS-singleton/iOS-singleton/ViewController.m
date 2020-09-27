//
//  ViewController.m
//  iOS-singleton
//
//  Created by MacOS on 2020/9/27.
//  Copyright © 2020 YingShun International Network Co., Limited. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[Singleton1Manager sharedInstance] method];
    [[Singleton2Manager sharedInstance] method];
}


@end
