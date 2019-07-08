//
//  ViewController.m
//  ios-ui-uiimageview
//
//  Created by john on 19/7/8.
//  Copyright © 2019年 future. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *bundlePath = [[NSBundle mainBundle] bundlePath];
    NSLog(@"Bundle path:%@", bundlePath);
    
    NSString *resourcePath = [[NSBundle mainBundle] resourcePath];
    NSLog(@"Resource path:%@", resourcePath);
    
    UIImage *uiImage = [UIImage imageNamed:@"icon_mok"];
    UIImageView *uiImageView = [[UIImageView alloc] initWithImage:uiImage];
    uiImageView.frame = CGRectMake(0, 0, 100, 100);
    [self.view addSubview:uiImageView];
    
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"icon_t2.png" ofType:nil];
    uiImage = [UIImage imageWithContentsOfFile:imagePath];
    uiImageView = [[UIImageView alloc] initWithImage: uiImage];
    uiImageView.frame = CGRectMake(0, 105, 100, 100);
    [self.view addSubview: uiImageView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
