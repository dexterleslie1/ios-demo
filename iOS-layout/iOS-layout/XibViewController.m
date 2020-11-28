//
//  XibViewController.m
//  iOS-layout
//
//  Created by MacOS on 2020/11/28.
//  Copyright © 2020 YingShun International Network Co., Limited. All rights reserved.
//

#import "XibViewController.h"

@interface XibViewController ()

@end

@implementation XibViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.buttonClickme addTarget:self action:@selector(onClickedButtonClickme:) forControlEvents:UIControlEventTouchUpInside];
}

- (void) onClickedButtonClickme:(UIButton *) button {
    NSLog(@"已经点击我了");
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
