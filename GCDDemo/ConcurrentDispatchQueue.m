//
//  ConcurrentDispatchQueue.m
//  GCDDemo
//
//  Created by qinzhiwei on 16/5/17.
//  Copyright © 2016年 qinzhiwei. All rights reserved.
//

#import "ConcurrentDispatchQueue.h"

@interface ConcurrentDispatchQueue ()
{
    dispatch_queue_t _concurrentQueue;
    BOOL _isCanceled;
}
@end

@implementation ConcurrentDispatchQueue

- (id)init{
    if (self = [super init]) {
        _concurrentQueue = dispatch_queue_create("com.lobster.concurrentQueue", DISPATCH_QUEUE_CONCURRENT);
    }
    return self;
}

- (void)pushQueue:(taskBlock)task{
    //If you want to be able to cancel your running jobs, you'll need to do so in your own logic. GCD purposefully doesn't expose a true cancellation API.
    dispatch_async(_concurrentQueue, ^{
        while (!_isCanceled) {
            task();
        }
    });
}

- (void)suspend{
    dispatch_suspend(_concurrentQueue);
}

- (void)resume{
    dispatch_resume(_concurrentQueue);
}

- (void)cancel{
    _isCanceled = YES;
}

- (void)dealloc{
    _concurrentQueue = nil;
}

@end
