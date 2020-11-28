//
//  MasonryViewController.m
//  iOS-layout
//
//  Created by MacOS on 2020/11/28.
//  Copyright © 2020 YingShun International Network Co., Limited. All rights reserved.
//

#import "MasonryViewController.h"
#import "Masonry.h"

@interface MasonryViewController ()

@end

@implementation MasonryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIView *view = [[UIView alloc] init];
    [view setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:view];

//    // 上、下、左、右边距20
//    [view mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.view).offset(20);
//        make.bottom.equalTo(self.view).offset(-20);
//        make.left.equalTo(self.view).offset(20);
//        make.right.equalTo(self.view).offset(-20);
//    }];
    
    // 高100、宽100、水平和垂直居中
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(100);
        make.centerX.equalTo(self.view).offset(0);
        make.centerY.equalTo(self.view).offset(0);
    }];
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
