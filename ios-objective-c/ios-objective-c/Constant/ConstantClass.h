//
//  ConstantClass.h
//  ios-objective-c
//
//  Created by MacOS on 2020/11/24.
//  Copyright © 2020 ios-objective-c. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
api网关
*/
static const NSString *GATEWAY_TYPE_API = @"GATEWAY_TYPE_API";
/**
图片api网关
*/
static const NSString *GATEWAY_TYPE_IMAGE_API = @"GATEWAY_TYPE_IMAGE_API";
/**
官网
*/
static const NSString *GATEWAY_TYPE_OFFICIAL = @"GATEWAY_TYPE_OFFICIAL";
/**
Websocket网关，用于消息推送
*/
static const NSString *GATEWAY_TYPE_SOCKET_PUSH = @"GATEWAY_TYPE_SOCKET_PUSH";

NS_ASSUME_NONNULL_BEGIN

@interface ConstantClass : NSObject

@end

NS_ASSUME_NONNULL_END
