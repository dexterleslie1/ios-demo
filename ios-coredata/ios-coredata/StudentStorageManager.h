//
//  StudentStorageManager.h
//  ios-coredata
//
//  Created by john on 19/6/10.
//  Copyright © 2019年 future. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface StudentStorageManager : NSObject

@property (nonatomic, retain) NSManagedObjectContext * context;

+ (id)sharedInstance;
- (void) fetchAndDisplay;

@end
