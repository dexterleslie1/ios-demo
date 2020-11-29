//
//  ViewController.m
//  iOS-UISlider
//
//  Created by MacOS on 2020/11/29.
//  Copyright © 2020 YingShun International Network Co., Limited. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UIButton *buttonReset;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.slider addTarget:self
                    action:@selector(onValueChanged:)
          forControlEvents:UIControlEventValueChanged];
    [self.buttonReset addTarget:self
                         action:@selector(onClickedButtonReset:)
               forControlEvents:UIControlEventTouchUpInside];
}

- (void) onValueChanged:(UISlider *)slider {
    float value = slider.value;
    NSLog(@"Slider当前值：%f", value);
}

- (void) onClickedButtonReset:(UIButton *)button {
    self.slider.value = 50;
}

@end
