//
//  AppDelegate.h
//  iOS-coredata-migration-change-attribute-type
//
//  Created by MacOS on 2021/1/17.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

