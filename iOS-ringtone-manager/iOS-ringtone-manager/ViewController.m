//
//  ViewController.m
//  iOS-ringtone-manager
//
//  Created by MacOS on 2020/9/27.
//  Copyright © 2020 YingShun International Network Co., Limited. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *buttonPlayStart;
@property (weak, nonatomic) IBOutlet UIButton *buttonPlayStop;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.buttonPlayStart addTarget:self action:@selector(buttonPlayStartEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self.buttonPlayStop addTarget:self action:@selector(buttonPlayStopEvent:) forControlEvents:UIControlEventTouchUpInside];
}

- (void) buttonPlayStartEvent:(UIButton *) sender {
    [[RingtoneManager sharedInstance] start:60];
}

- (void) buttonPlayStopEvent:(UIButton *) sender {
    [[RingtoneManager sharedInstance] stop];
}

@end
