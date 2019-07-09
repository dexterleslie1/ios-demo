//
//  Human.h
//  ios-protocolanddelegate
//
//  Created by john on 19/7/9.
//  Copyright © 2019年 future. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Creature.h"

@interface Human : NSObject <Creature>

@property (nonatomic, weak) id <Creature> delegate;

@end
