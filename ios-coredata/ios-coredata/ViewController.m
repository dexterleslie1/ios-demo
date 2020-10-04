//
//  ViewController.m
//  ios-coredata
//
//  Created by john on 19/6/9.
//  Copyright © 2019年 future. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *buttonInvoke;
@property (weak, nonatomic) IBOutlet UIButton *buttonLog;

@property (assign, nonatomic) int count;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.count = 0;
    [self.buttonInvoke addTarget:self action:@selector(onButtonInvokeClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.buttonLog addTarget:self action:@selector(onButtonLogClicked:) forControlEvents:UIControlEventTouchUpInside];
}

- (void) onButtonInvokeClicked:(UIButton *) button {
    [[StudentStorageManager sharedInstance] testSingleMOCSharedBetweenThreads];
}

- (void) onButtonLogClicked:(UIButton *) button {
    NSLog(@"当前计数器值%d", self.count);
    self.count++;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
