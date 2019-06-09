//
//  ViewController.m
//  ios-objective-c
//
//  Created by john on 19/6/6.
//  Copyright © 2019年 ios-objective-c. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    Person *person = [[Person alloc] init];
    person.name = @"姓名";
    person.password = @"123456789";
    
    NSLog(@"name=%@, password=%@", person.name, person.password);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
