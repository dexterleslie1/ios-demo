//
//  RingtoneManager.m
//  iOS-ringtone-manager
//
//  Created by MacOS on 2020/9/27.
//  Copyright © 2020 YingShun International Network Co., Limited. All rights reserved.
//

#import "RingtoneManager.h"

@implementation RingtoneManager

+ (id) sharedInstance {
    static RingtoneManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!instance) {
            instance = [[self alloc] init];
            instance.stopped = YES;
        }
    });
    return instance;
}

- (void) start:(int)timeoutSeconds {
    @synchronized (self) {
        if(!self.stopped) {
            return;
        }
        self.stopped = NO;
        
        if(!self.player) {
            AVAudioSession *audioSession = [AVAudioSession sharedInstance];
            NSError *error;
            [audioSession setCategory:AVAudioSessionCategoryPlayback
                          withOptions:AVAudioSessionCategoryOptionDefaultToSpeaker
                          error:&error];
            if(error) {
                NSLog(@"调用AVAudioSession#setCategory错误，原因：%@", error);
            }
            
            NSURL *url = [[NSBundle mainBundle] URLForResource:@"audiocall" withExtension:@"wav"];
            self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
            [self.player prepareToPlay];
            [self.player setDelegate: self];
            self.player.numberOfLoops = -1;
            BOOL ret = [self.player play];
            if (!ret) {
                NSLog(@"调用AVAudioPalyer#play方法错误，调用AVAudioSession#setCategory设置正确的category");
            }
        }
    }
    
    if(timeoutSeconds>=0) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(timeoutSeconds * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.stopped = YES;
            [self stop];
            NSLog(@"播放来电铃声超时，时间%d秒", timeoutSeconds);
        });
    }
    
    NSLog(@"开始播放来电铃声");
}

- (void) stop {
    self.stopped = YES;
    if(self.player) {
        [self.player stop];
        self.player = nil;
    }
    
    AVAudioSession *session = [AVAudioSession sharedInstance];
    [session setActive:NO error:nil];
    
    NSLog(@"停止播放来电铃声");
}

@end
