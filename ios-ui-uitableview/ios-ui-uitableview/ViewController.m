//
//  ViewController.m
//  ios-ui-uitableview
//
//  Created by john on 19/7/9.
//  Copyright © 2019年 future. All rights reserved.
//

#import "ViewController.h"
#import "TestingTableView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    TestingTableView *tableView = [[TestingTableView alloc] init];
    tableView.frame = self.view.bounds;
    for(int i=1; i<=10000; i++){
        [tableView.data addObject:[NSNumber numberWithInt:i]];
    }
    [self.view addSubview:tableView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
