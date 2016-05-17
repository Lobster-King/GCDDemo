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
    BOOL _isCanceled;
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
    //If you want to be able to cancel your running jobs, you'll need to do so in your own logic. GCD purposefully doesn't expose a true cancellation API.
    dispatch_async(_serialQueue, ^{
        while (!_isCanceled) {
            task();
        }
    });
}

- (void)suspend{
    dispatch_suspend(_serialQueue);
}

- (void)resume{
    dispatch_resume(_serialQueue);
}

- (void)cancel{
    _isCanceled = YES;
}

- (void)dealloc{
    _serialQueue = nil;
}

@end
