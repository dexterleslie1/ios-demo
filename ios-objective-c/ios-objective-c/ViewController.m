//
//  ViewController.m
//  ios-objective-c
//
//  Created by john on 19/6/6.
//  Copyright © 2019年 ios-objective-c. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "ClassStaticMethod.h"
#import "FISPerson.h"
#import "FISClass.h"
#import "ClassA.h"
#import "ClassB.h"
#import "StaticClass1.h"
#import "StaticClass1Sub1.h"
#import "StaticVariableClass1.h"
#import "ConstantClass.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 构造和析构函数测试
    FISPerson *zachDrossman = [[FISPerson alloc] initWithName:@"Zach Drossman"];
    FISPerson *markMurray = [[FISPerson alloc] initWithName:@"Mark Murray"];
    FISPerson *anishKumar = [[FISPerson alloc] initWithName:@"Anish Kumar"];
    FISClass *class = [[FISClass alloc] initWithName:@"004"
                                          roomNumber:@4
                                          instructor:zachDrossman
                                            students:@[markMurray, anishKumar]];
    NSLog(@"FISClass 004: %@", class);
    
    class = [FISClass classWithName:@"005" roomNumber:@5 instructor:zachDrossman students:@[anishKumar, markMurray]];
    NSLog(@"FISClass 005: %@", class);
    
    // 派生、重写
    ClassA *classA = [[ClassA alloc] initWithName:@"ClassA实例"];
    NSString *result = [classA toString];
    NSLog(@"ClassA to String: %@", result);
    
    ClassA *classB = [[ClassB alloc] initWithName:@"ClassB实例" withAge:10];
    result = [classB toString];
    NSLog(@"ClassB to String: %@", result);
    
    // 静态+initialize、+load方法演示
    StaticClass1 *staticClass1 = [[StaticClass1 alloc] init];
    StaticClass1Sub1 *staticClass1Sub1 = [[StaticClass1Sub1 alloc] init];
    
    // 静态变量演示
    NSNumber *counterTemporary = StaticVariableClass1.getStaticVariable;
    NSLog(@"第一次静态变量counter=%d", [counterTemporary intValue]);
    counterTemporary = StaticVariableClass1.getStaticVariable;
    NSLog(@"第二次静态变量counter=%d", [counterTemporary intValue]);
    
    // 常量演示
    NSLog(@"GATEWAY_TYPE_API=%@", GATEWAY_TYPE_API);
    
    Person *person = [[Person alloc] init];
    person.name = @"姓名";
    person.password = @"123456789";
    
    NSLog(@"name=%@, password=%@", person.name, person.password);
    [person toString:12];
    
    [ClassStaticMethod staticMethod:1 parameter2:2];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
