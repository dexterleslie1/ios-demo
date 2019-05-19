//
//  ViewController.m
//  ios-stomp-client-demo
//
//  Created by john on 19/5/18.
//  Copyright © 2019年 xy. All rights reserved.
//

#import "ViewController.h"
#import "WebsocketStompKit.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSURL *websocketUrl = [NSURL URLWithString:@"http://192.168.1.2:8080/chatEndpointWithoutSockJS"];
    STOMPClient *client = [[STOMPClient alloc] initWithURL:websocketUrl webSocketHeaders:@{} useHeartbeat:NO];
    
    NSDictionary *stompHeaders = @{@"username": @"B"};
    [client connectWithHeaders: stompHeaders
           completionHandler:^(STOMPFrame *_, NSError *error) {
               if (error) {
                   NSLog(@"%@", error);
                   return;
               }
               [client subscribeTo:@"/user/queue/receiveMessage" messageHandler:^(STOMPMessage *message) {
                   NSLog(@"%@",message.body);
                   //NSDictionary *headers = @{@"content-type": @"text/plain;charset=UTF-8"};
                   [client sendTo:@"/app/sendMessage" /*headers: headers*/ body:@"{toUsername:'A',message:'你好吗？用户A'}"];
               }];
               
           }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
