//
//  RingtoneManager.h
//  iOS-ringtone-manager
//
//  Created by MacOS on 2020/9/27.
//  Copyright © 2020 YingShun International Network Co., Limited. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RingtoneManager : NSObject<AVAudioPlayerDelegate>

/* 来电铃声是否已停止播放 */
@property(nonatomic) BOOL stopped;
@property(nonatomic) AVAudioPlayer *player;

+ (id) sharedInstance;

/**
 * 开始播放来电铃声
 */
- (void) start: (int) timeoutSeconds;
/**
 * 停止播放来电铃声
 */
- (void) stop;

@end

NS_ASSUME_NONNULL_END
