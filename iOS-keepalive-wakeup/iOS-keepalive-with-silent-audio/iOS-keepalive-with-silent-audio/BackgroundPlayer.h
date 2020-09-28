//
//  BackgroundPlayer.h
//  ZPChat
//
//  Created by MacOS on 2020/9/23.
//  Copyright © 2020 yiyingda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface BackgroundPlayer : NSObject <AVAudioPlayerDelegate>
{
    AVAudioPlayer* _player;
}

+ (id) sharedInstance;
- (void)startPlayer;
- (void)stopPlayer;
@end
