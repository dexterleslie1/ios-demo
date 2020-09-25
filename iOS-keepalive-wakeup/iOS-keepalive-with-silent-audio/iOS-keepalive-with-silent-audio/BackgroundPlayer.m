//
//  BackgroundPlayer.m
//  ZPChat
//
//  Created by MacOS on 2020/9/23.
//  Copyright © 2020 yiyingda. All rights reserved.
//

#import "BackgroundPlayer.h"

@implementation BackgroundPlayer

- (void)startPlayer {
    if (_player && [_player isPlaying]) {
        return;
    }
    AVAudioSession *session = [AVAudioSession sharedInstance];
    [[AVAudioSession sharedInstance] setMode:AVAudioSessionModeDefault error:nil];

//    NSString* route = [[[[[AVAudioSession sharedInstance] currentRoute] outputs] objectAtIndex:0] portType];
//
//    if ([route isEqualToString:AVAudioSessionPortHeadphones] || [route isEqualToString:AVAudioSessionPortBluetoothA2DP] || [route isEqualToString:AVAudioSessionPortBluetoothLE] || [route isEqualToString:AVAudioSessionPortBluetoothHFP]) {
//        if (@available(iOS 10.0, *)) {
//            [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayAndRecord
//                                             withOptions:(AVAudioSessionCategoryOptionMixWithOthers | AVAudioSessionCategoryOptionAllowBluetooth | AVAudioSessionCategoryOptionAllowBluetoothA2DP)
//                                                   error:nil];
//        } else {
//            // Fallback on earlier versions
//        }
//    }else{
        [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayAndRecord
                                         withOptions:(AVAudioSessionCategoryOptionMixWithOthers)
                                               error:nil];
//    }
    
    [session setActive:YES error:nil];
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"mute5s" withExtension:@"wav"];
    _player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [_player prepareToPlay];
    [_player setDelegate:self];
    _player.numberOfLoops = -1;
    BOOL ret = [_player play];
    if (!ret) {
        NSLog(@"play failed,please turn on audio background mode");
    }
}

- (void)stopPlayer {
    // 此处不能设置AVAudioSession相关参数，只能是单纯地停止播放无声音乐
    if (_player) {
        [_player stop];
        _player = nil;
        AVAudioSession *session = [AVAudioSession sharedInstance];
        [session setActive:NO error:nil];
        NSLog(@"stop in play background success");
    }
}

@end
