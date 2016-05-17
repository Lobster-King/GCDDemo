//
//  main.m
//  GCDDemo
//
//  Created by qinzhiwei on 16/5/17.
//  Copyright © 2016年 qinzhiwei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "SerialDispatchQueue.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        //1.SerialDispatchQueue
        
        SerialDispatchQueue *serialQueue = [SerialDispatchQueue new];
        
        [serialQueue pushQueue:^{
            for (int i = 0; i<100000; i++) {
                printf("hello word %d",i);
            }
        }];
        
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
