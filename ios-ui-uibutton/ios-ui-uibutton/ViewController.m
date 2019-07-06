//
//  ViewController.m
//  ios-ui-uibutton
//
//  Created by john on 19/7/6.
//  Copyright © 2019年 future. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CGRect rect = CGRectMake(0, 30, 200, 60);
    UIButton *button1 = [[UIButton alloc] initWithFrame:rect];
    [button1 setTitle:@"Button initWithFrame" forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button1 setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:button1];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    rect = CGRectMake(0, 100, 200, 60);
    button2.frame = rect;
    [button2 setTitle:@"Button withType" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button2 setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:button2];
    
    UIButton *button3 = [[UIButton alloc] initWithFrame:CGRectMake(0, 170, 200, 60)];
    [button3 setTitle:@"Click me" forState:UIControlStateNormal];
    [button3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button3 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:button3];
}

- (void)buttonClick:(id) sender{
    NSLog(@"Button click!!");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
