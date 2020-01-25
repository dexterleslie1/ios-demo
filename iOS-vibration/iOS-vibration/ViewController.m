//
//  ViewController.m
//  iOS-vibration
//
//  Created by MacOS on 2020/1/25.
//  Copyright © 2020 MacOS. All rights reserved.
//

#import "ViewController.h"
#import <AudioToolbox/AudioToolbox.h>
#import "VibrationManager.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *buttonStartVibration;
@property (weak, nonatomic) IBOutlet UIButton *buttonStopVibration;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.buttonStartVibration addTarget:self action:@selector(buttonStartVibrationOnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.buttonStopVibration addTarget:self action:@selector(buttonStopVibrationOnClicked:) forControlEvents:UIControlEventTouchUpInside];
}

- (void) buttonStartVibrationOnClicked: (UIButton *) button {
    [[VibrationManager sharedManager] startVibrate];
}

- (void) buttonStopVibrationOnClicked: (UIButton *) button {
    [[VibrationManager sharedManager] stopVibrate];
}

@end
