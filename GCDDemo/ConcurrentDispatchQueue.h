//
//  ConcurrentDispatchQueue.h
//  GCDDemo
//
//  Created by qinzhiwei on 16/5/17.
//  Copyright © 2016年 qinzhiwei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "config.h"

@interface ConcurrentDispatchQueue : NSObject

- (void)pushQueue:(taskBlock)task;
- (void)suspend;
- (void)resume;
- (void)cancel;

@end
