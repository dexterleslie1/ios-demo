//
//  Autolayout2ViewController.m
//  iOS-layout
//
//  Created by MacOS on 2020/11/28.
//  Copyright © 2020 YingShun International Network Co., Limited. All rights reserved.
//

#import "Autolayout2ViewController.h"

@interface Autolayout2ViewController ()

@end

@implementation Autolayout2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UIView *leftView = [[UIView alloc] init];
    [leftView setBackgroundColor:[UIColor greenColor]];
    leftView.translatesAutoresizingMaskIntoConstraints = NO;
    UIView *rightView = [[UIView alloc] init];
    [rightView setBackgroundColor:[UIColor purpleColor]];
    rightView.translatesAutoresizingMaskIntoConstraints = NO;
    UIView *bottomView = [[UIView alloc] init];
    [bottomView setBackgroundColor:[UIColor orangeColor]];
    bottomView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:leftView];
    [self.view addSubview:rightView];
    [self.view addSubview:bottomView];
    
    // leftView的上 = self.view的上+20
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:leftView
                                                           attribute:NSLayoutAttributeTop
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:self.view
                                                           attribute:NSLayoutAttributeTop
                                                          multiplier:1.0
                                                            constant:20]];
    // leftView的左 = self.view的左+20
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:leftView
                                                           attribute:NSLayoutAttributeLeft
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:self.view
                                                           attribute:NSLayoutAttributeLeft
                                                          multiplier:1.0
                                                            constant:20]];
    // rightView的上 = leftView的上
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:rightView
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:leftView
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1.0
                                                           constant:0]];
    // rightView的左 = leftView的右+20
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:rightView
                                                          attribute:NSLayoutAttributeLeft
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:leftView
                                                          attribute:NSLayoutAttributeRight
                                                         multiplier:1.0
                                                           constant:20]];
    // rightView的右 = self.view的右-20
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:rightView
                                                          attribute:NSLayoutAttributeRight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeRight
                                                         multiplier:1.0
                                                           constant:-20]];
    // leftView的宽 = rightView的宽
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:leftView
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:rightView
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:1.0
                                                           constant:0]];
    // leftView的高 = rightView的高
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:leftView
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:rightView
                                                          attribute:NSLayoutAttributeHeight
                                                         multiplier:1.0
                                                           constant:0]];
    // bottomView的左 = self.view的左+20
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:bottomView
                                                          attribute:NSLayoutAttributeLeft
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeLeft
                                                         multiplier:1.0
                                                           constant:20]];
    // bottomView的右 = self.view的右-20
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:bottomView
                                                          attribute:NSLayoutAttributeRight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeRight
                                                         multiplier:1.0
                                                           constant:-20]];
    // bottomView的上 = leftView的下+20
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:bottomView
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:leftView
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:20]];
    // bottomView的高 = leftView的高
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:bottomView
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:leftView
                                                          attribute:NSLayoutAttributeHeight
                                                         multiplier:1.0
                                                           constant:0]];
    // bottomView的下 = self.view的下-20
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:bottomView
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:-20]];
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
