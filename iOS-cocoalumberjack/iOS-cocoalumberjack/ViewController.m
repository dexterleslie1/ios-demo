//
//  ViewController.m
//  iOS-cocoalumberjack
//
//  Created by MacOS on 2020/9/28.
//  Copyright © 2020 YingShun International Network Co., Limited. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *buttonLog;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.buttonLog addTarget:self action:@selector(buttonLogEvent:) forControlEvents:UIControlEventTouchUpInside];
}

- (void) buttonLogEvent:(UIButton *) sender {
    DDLogError(@"DDLogError");
    DDLogWarn(@"DDLogWarn");
    DDLogInfo(@"DDLogInfo");
    DDLogDebug(@"DDLogDebug");
    DDLogVerbose(@"DDLogVerbose");
}

@end
