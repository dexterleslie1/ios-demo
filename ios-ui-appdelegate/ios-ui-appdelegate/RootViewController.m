//
//  RootViewController.m
//  ios-ui-appdelegate
//
//  Created by john on 19/7/6.
//  Copyright © 2019年 future. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSLog(@"RootViewController viewDidLoad");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)simpleButtonPressed:(id) sender{
    self.buttonPressedCount++;
    NSString *displayString = [NSString stringWithFormat:@"Button pressed %d times", self.buttonPressedCount];
    self.buttonPressLabel.text = displayString;
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
