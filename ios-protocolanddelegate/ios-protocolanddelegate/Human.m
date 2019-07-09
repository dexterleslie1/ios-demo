//
//  Human.m
//  ios-protocolanddelegate
//
//  Created by john on 19/7/9.
//  Copyright © 2019年 future. All rights reserved.
//

#import "Human.h"

@implementation Human

- (void)eat{
    if(self.delegate && [self.delegate respondsToSelector:@selector(watch)]){
        [self.delegate eat];
    }else{
        NSLog(@"Human eat");
    }
}

- (void)watch{
    NSLog(@"Human watch");
}

@end
