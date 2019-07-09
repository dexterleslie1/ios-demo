//
//  ViewController.m
//  ios-protocolanddelegate
//
//  Created by john on 19/7/9.
//  Copyright © 2019年 future. All rights reserved.
//

#import "ViewController.h"
#import "Human.h"
#import "Dog.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    Human *human = [[Human alloc] init];
    Dog *dog = [[Dog alloc] init];
    [human eat];
    [human watch];
    [dog eat];
    [dog watch];
    
    human.delegate = dog;
    [human eat];
    [human watch];
    [dog eat];
    [dog watch];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
