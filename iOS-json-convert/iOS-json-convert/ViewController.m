//
//  ViewController.m
//  iOS-json-convert
//
//  Created by MacOS on 2020/9/29.
//  Copyright © 2020 YingShun International Network Co., Limited. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // NSDictionary转换为json
    NSDictionary *dictionary = @{@"k1": @"v1"};
    NSData *data = [NSJSONSerialization dataWithJSONObject:dictionary options:NSJSONWritingPrettyPrinted error:nil];
    NSString *json;
    if(data) {
        json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    NSLog(@"json=%@", json);
    
    // json转换为NSDictionary
    NSData *jsonData = [json dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error;
    dictionary = [NSJSONSerialization JSONObjectWithData:jsonData
                                                 options:NSJSONReadingMutableContainers
                                                   error:&error];
    if(error) {
        NSLog(@"json解析错误，原因：%@", error);
    }
    NSLog(@"dictionary=%@", dictionary);
}


@end
