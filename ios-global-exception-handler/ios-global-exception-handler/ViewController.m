//
//  ViewController.m
//  ios-global-exception-handler
//
//  Created by dexterleslie@gmail.com on 2019/11/29.
//  Copyright © 2019 dexterleslie@gmail.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(50, 50, 200, 50)];
    [button setTitle:@"Crash the app" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:button];
}

- (void)buttonClick:(id) sender{
    Boolean b = true;
    if(b) {
        NSException *exception = [[NSException alloc] initWithName:@"Expected exception" reason:nil userInfo:nil];
        @throw exception;
    }
}

@end
