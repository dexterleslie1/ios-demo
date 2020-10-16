//
//  ViewController.m
//  iOS-NSString
//
//  Created by MacOS on 2020/10/10.
//  Copyright © 2020 YingShun International Network Co., Limited. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 截取子字符串
    NSString *sipAccountUri = @"sip:5@192.168.1.66:5060";
    NSRange range = [sipAccountUri rangeOfString:@"@"];
    NSString *registerUri = [sipAccountUri substringFromIndex:range.location+range.length];
    NSAssert([registerUri isEqualToString:@"192.168.1.66:5060"], @"意料之外错误");
    
    // 字符串padding
    NSString *someString = @"1234";
    NSString *padded = [someString stringByPaddingToLength:8 withString:@" " startingAtIndex:0];
    NSLog(@"[%@]", someString);
    NSLog(@"[%@]", padded);
}


@end
