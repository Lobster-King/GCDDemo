//
//  SerialDispatchQueue.m
//  GCDDemo
//
//  Created by qinzhiwei on 16/5/17.
//  Copyright © 2016年 qinzhiwei. All rights reserved.
//

#import "SerialDispatchQueue.h"

@interface SerialDispatchQueue ()
{
    dispatch_queue_t _serialQueue;
}
@end

@implementation SerialDispatchQueue

- (id)init{
    if (self = [super init]) {
        _serialQueue = dispatch_queue_create("com.lobster.serialQueue", DISPATCH_QUEUE_SERIAL);
    }
    return self;
}

- (void)pushQueue:(taskBlock)task{
    dispatch_async(_serialQueue, task);
}

- (void)suspend{
    dispatch_suspend(_serialQueue);
}

- (void)resume{
    dispatch_resume(_serialQueue);
}

- (void)dealloc{
    _serialQueue = nil;
}

@end
