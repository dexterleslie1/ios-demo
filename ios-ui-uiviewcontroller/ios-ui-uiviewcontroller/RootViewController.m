//
//  RootViewController.m
//  ios-ui-uiviewcontroller
//
//  Created by john on 19/7/7.
//  Copyright © 2019年 future. All rights reserved.
//

#import "RootViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.buttonGoTo1 addTarget:self action:@selector(buttonGoTo1Click:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonGoTo1Click:(id) sender{
    FirstViewController *viewController = [[FirstViewController alloc] init];
    [self presentViewController:viewController animated:YES completion:nil];
}

- (IBAction) buttonGoTo2Click:(id) sender{
    SecondViewController *viewController = [[SecondViewController alloc] init];
    [self presentViewController:viewController animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
