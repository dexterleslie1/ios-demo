//
//  NotificationService.m
//  nse
//
//  Created by MacOS on 2020/6/13.
//  Copyright © 2020 future.com. All rights reserved.
//

#import "NotificationService.h"
#import <AudioToolbox/AudioToolbox.h>

@interface NotificationService ()

@property (nonatomic, strong) void (^contentHandler)(UNNotificationContent *contentToDeliver);
@property (nonatomic, strong) UNMutableNotificationContent *bestAttemptContent;

@end

@implementation NotificationService

- (void)didReceiveNotificationRequest:(UNNotificationRequest *)request withContentHandler:(void (^)(UNNotificationContent * _Nonnull))contentHandler{
//    [[UNUserNotificationCenter currentNotificationCenter] removeAllDeliveredNotifications];
    NSDictionary *userInfo = request.content.userInfo;
    NSString *customPayloadId = [userInfo objectForKey:@"custom-payload-id"];
    
    UNUserNotificationCenter *notificationCenter = [UNUserNotificationCenter currentNotificationCenter];
    [notificationCenter getDeliveredNotificationsWithCompletionHandler:^(NSArray<UNNotification *> * _Nonnull notifications) {
        for(UNNotification *notification in notifications) {
            NSString *customPayloadIdTemporary = notification.request.content.userInfo[@"custom-payload-id"];
            if([customPayloadId isEqualToString:customPayloadIdTemporary]) {
                NSArray *identifiers = [NSArray arrayWithObject: notification.request.identifier];
                [notificationCenter removeDeliveredNotificationsWithIdentifiers: identifiers];
            }
        }
    }];
    
    self.contentHandler = contentHandler;
    self.bestAttemptContent = [request.content mutableCopy];
    
    // Modify the notification content here...
    self.bestAttemptContent.title = [NSString stringWithFormat:@"id:%@ - %@ [modified]", customPayloadId, self.bestAttemptContent.title];
    self.bestAttemptContent.sound = [UNNotificationSound soundNamed:@"audio.wav"];
    
    self.contentHandler(self.bestAttemptContent);
}

- (void)serviceExtensionTimeWillExpire {
    // Called just before the extension will be terminated by the system.
    // Use this as an opportunity to deliver your "best attempt" at modified content, otherwise the original push payload will be used.
    self.contentHandler(self.bestAttemptContent);
}

@end
