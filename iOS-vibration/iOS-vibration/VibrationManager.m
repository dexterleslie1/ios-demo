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

- (void) startVibrate {
    @synchronized (self) {
        if(!self.stopped) {
            return;
        }
        self.stopped = NO;
    }
    
    dispatch_queue_t queue = dispatch_queue_create("com.future.demo.ios.vibration", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        while(!self.stopped) {
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
            [NSThread sleepForTimeInterval:1];
        }
    });
}

- (void) stopVibrate {
    self.stopped = YES;
}

@end
