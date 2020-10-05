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

+ (id)sharedInstance;

//- (void) fetchAndDisplay;

/**
 正确用法，演示正确使用MOC
 */
- (void) testCorrectUsage;

@property (strong, nonatomic) NSManagedObjectContext *singleMOC;
@property (strong, nonatomic) NSArray *studentSharedBetweenThreads;

/**
 正确用法，演示一个MOC在线程之间共享
 */
- (void) testSingleMOCSharedBetweenThreads;
/**
 错误用法，演示ManagedObject在线程之间共享，连续调用此函数会预期出现错误
 */
- (void) testManagedObjectSharedBetweenThreads;
/**
 错误用法，两个没有共同父级MOC数据不一致
 */
- (void) testTwoIndependentMOCInconsistent;
/**
 测试performBlock和performBlockAndWait是否有并发问题和是否会阻塞线程
 结果并发没有问题，只是main MOC会导致UI卡顿，不会阻塞其他线程执行
 */
- (void) testPerformBlockAndPerformBlockAndWait;
@end
