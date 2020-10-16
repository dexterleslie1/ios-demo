//
//  CustomLogFormatter.m
//  iOS-cocoalumberjack
//
//  Created by MacOS on 2020/10/16.
//  Copyright © 2020 YingShun International Network Co., Limited. All rights reserved.
//

#import "CustomLogFormatter.h"

@implementation CustomLogFormatter

- (NSString *)formatLogMessage:(DDLogMessage *) message {
    NSString *logLevel;
    switch (message.flag) {
        case DDLogFlagError    : logLevel = @"ERROR"; break;
        case DDLogFlagWarning  : logLevel = @"WARN"; break;
        case DDLogFlagInfo     : logLevel = @"INFO"; break;
        case DDLogFlagDebug    : logLevel = @"DEBUG"; break;
        default                : logLevel = @"VERB"; break;
    }
    
    logLevel = [logLevel stringByPaddingToLength:5 withString:@" " startingAtIndex:0];

    NSString *filename = message.file;
    filename = [filename lastPathComponent];
    long line = message.line;
    NSString *fileAndLine = [NSString stringWithFormat:@"%@:%ld", filename, line];
    fileAndLine = [fileAndLine stringByPaddingToLength:20 withString:@" " startingAtIndex:0];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeZone: [NSTimeZone localTimeZone]];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *currentTime = [NSDate now];
    NSString *currentTimeString = [formatter stringFromDate:currentTime];
    
    return [NSString stringWithFormat:@"[%@] %@ %@ : %@", logLevel, currentTimeString, fileAndLine, message.message];
}

@end
