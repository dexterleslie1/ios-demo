//
//  VibrationManager.m
//  iOS-vibration
//
//  Created by MacOS on 2020/1/26.
//  Copyright © 2020 MacOS. All rights reserved.
//

#import "VibrationManager.h"
#import <AudioToolbox/AudioToolbox.h>

@implementation VibrationManager

+ (id) sharedManager {
    static VibrationManager *sharedManager;
    @synchronized (self) {
        if(sharedManager==nil) {
            sharedManager = [[VibrationManager alloc] init];
            sharedManager.stopped = YES;
        }
    }
    return sharedManager;
}

- (void) startVibrate:(int) timeoutSeconds{
    @synchronized (self) {
        if(!self.stopped) {
            return;
        }
        self.stopped = NO;
    }
    
    if(timeoutSeconds<=0) {
        timeoutSeconds = 10;
    }
    
    NSDate * startTime = [NSDate date];
    dispatch_queue_t queue = dispatch_queue_create("com.future.demo.ios.vibration", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        BOOL isTimeout = NO;
        while(!self.stopped && !isTimeout) {
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
            [NSThread sleepForTimeInterval:1];
            
            NSDate *currentTime = [NSDate date];
            NSTimeInterval interval = [currentTime timeIntervalSinceDate:startTime];
            if(interval>=timeoutSeconds) {
                self.stopped = YES;
            }
        }
    });
}

- (void) stopVibrate {
    self.stopped = YES;
}

@end
