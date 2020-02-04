//
//  VibrationManager.h
//  iOS-vibration
//
//  Created by MacOS on 2020/1/26.
//  Copyright © 2020 MacOS. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface VibrationManager : NSObject

@property (nonatomic) BOOL stopped;

+ (id) sharedManager;
- (void) startVibrate:(int) timeoutSeconds;
- (void) stopVibrate;

@end

NS_ASSUME_NONNULL_END
