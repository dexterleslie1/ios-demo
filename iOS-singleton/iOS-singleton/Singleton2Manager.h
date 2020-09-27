//
//  Singleton2Manager.h
//  iOS-singleton
//
//  Created by MacOS on 2020/9/27.
//  Copyright © 2020 YingShun International Network Co., Limited. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Singleton2Manager : NSObject

+ (id) sharedInstance;

- (void) method;

@end

NS_ASSUME_NONNULL_END
