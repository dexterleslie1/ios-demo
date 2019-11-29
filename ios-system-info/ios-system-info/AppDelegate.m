//
//  AppDelegate.m
//  ios-system-info
//
//  Created by dexterleslie@gmail.com on 2019/11/29.
//  Copyright © 2019 dexterleslie@gmail.com. All rights reserved.

#import "AppDelegate.h"
#import <sys/utsname.h>



@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    NSString *name = [[UIDevice currentDevice] name];
    NSString *model = [[UIDevice currentDevice] model];
    NSString *systemName = [[UIDevice currentDevice] systemName];
    NSString *systemVersion = [[UIDevice currentDevice] systemVersion];
    NSUUID *identifierForVendor = [[UIDevice currentDevice] identifierForVendor];
    
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    [dictionary setObject:name forKey:@"name"];
    [dictionary setObject:model forKey:@"model"];
    [dictionary setObject:systemName forKey:@"systemName"];
    [dictionary setObject:systemVersion forKey:@"systemVersion"];
    [dictionary setObject:[NSString stringWithFormat:@"%@",identifierForVendor] forKey:@"identifierForVendor"];
    [dictionary setObject:[AppDelegate judgeIphoneType] forKey:@"iphoneType"];
    
    NSData *data = [NSJSONSerialization dataWithJSONObject:dictionary options:NSJSONWritingPrettyPrinted error:nil];
    NSString *json = @"{}";
    if(data) {
        json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    NSLog(@"%@", json);
    
    return YES;
}

#pragma mark -- 判断手机型号
+(NSString*)judgeIphoneType {
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString * phoneType = [NSString stringWithCString: systemInfo.machine encoding:NSASCIIStringEncoding];
    // simulator 模拟器
    if ([phoneType isEqualToString:@"i386"])   return @"Simulator";
    if ([phoneType isEqualToString:@"x86_64"])  return @"Simulator";
    //  常用机型  不需要的可自行删除
    if([phoneType isEqualToString:@"iPhone1,1"])  return @"iPhone 2G";
    if([phoneType isEqualToString:@"iPhone1,2"])  return @"iPhone 3G";
    if([phoneType isEqualToString:@"iPhone2,1"])  return @"iPhone 3GS";
    if([phoneType isEqualToString:@"iPhone3,1"])  return @"iPhone 4";
    if([phoneType isEqualToString:@"iPhone3,2"])  return @"iPhone 4";
    if([phoneType isEqualToString:@"iPhone3,3"])  return @"iPhone 4";
    if([phoneType isEqualToString:@"iPhone4,1"])  return @"iPhone 4S";
    if([phoneType isEqualToString:@"iPhone5,1"])  return @"iPhone 5";
    if([phoneType isEqualToString:@"iPhone5,2"])  return @"iPhone 5";
    if([phoneType isEqualToString:@"iPhone5,3"])  return @"iPhone 5c";
    if([phoneType isEqualToString:@"iPhone5,4"])  return @"iPhone 5c";
    if([phoneType isEqualToString:@"iPhone6,1"])  return @"iPhone 5s";
    if([phoneType isEqualToString:@"iPhone6,2"])  return @"iPhone 5s";
    if([phoneType isEqualToString:@"iPhone7,1"])  return @"iPhone 6 Plus";
    if([phoneType isEqualToString:@"iPhone7,2"])  return @"iPhone 6";
    if([phoneType isEqualToString:@"iPhone8,1"])  return @"iPhone 6s";
    if([phoneType isEqualToString:@"iPhone8,2"])  return @"iPhone 6s Plus";
    if([phoneType isEqualToString:@"iPhone8,4"])  return @"iPhone SE";
    if([phoneType isEqualToString:@"iPhone9,1"])  return @"iPhone 7";
    if([phoneType isEqualToString:@"iPhone9,2"])  return @"iPhone 7 Plus";
    if([phoneType isEqualToString:@"iPhone10,1"]) return @"iPhone 8";
    if([phoneType isEqualToString:@"iPhone10,4"]) return @"iPhone 8";
    if([phoneType isEqualToString:@"iPhone10,2"]) return @"iPhone 8 Plus";
    if([phoneType isEqualToString:@"iPhone10,5"]) return @"iPhone 8 Plus";
    if([phoneType isEqualToString:@"iPhone10,3"]) return @"iPhone X";
    if([phoneType isEqualToString:@"iPhone10,6"]) return @"iPhone X";
    if([phoneType isEqualToString:@"iPhone11,8"]) return @"iPhone XR";
    if([phoneType isEqualToString:@"iPhone11,2"]) return @"iPhone XS";
    if([phoneType isEqualToString:@"iPhone11,4"]) return @"iPhone XS Max";
    if([phoneType isEqualToString:@"iPhone11,6"]) return @"iPhone XS Max";
    return phoneType;
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
