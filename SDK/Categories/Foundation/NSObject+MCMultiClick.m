//
//  NSObject+MultiClick.m
//  Gym
//
//  Created by majiancheng on 2017/2/10.
//  Copyright © 2017年 poholo Inc. All rights reserved.
//

#import "NSObject+MCMultiClick.h"

#import <objc/runtime.h>

#import "MCLog.h"

const char *NSObject_acceptTime = "NSObject_acceptTime";
const char *NSObject_acceptInterval = "NSObject_acceptInterval";

@implementation NSObject (MCMultiClick)

- (NSTimeInterval)acceptTime {
    return [objc_getAssociatedObject(self, NSObject_acceptTime) doubleValue];
}

- (void)setAcceptTime:(NSTimeInterval)acceptTime {
    objc_setAssociatedObject(self, NSObject_acceptTime, @(acceptTime), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSTimeInterval)acceptInterval {
    NSTimeInterval acceptInterval = [objc_getAssociatedObject(self, NSObject_acceptInterval) doubleValue];
    return acceptInterval > 0 ? acceptInterval : .5f;
}

- (void)setAcceptInterval:(NSTimeInterval)acceptInterval {
    objc_setAssociatedObject(self, NSObject_acceptInterval, @(acceptInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)canAcceptEvent {
    if (self.acceptInterval == 0) {
        return NO;
    }

    if ([[NSDate date] timeIntervalSince1970] - self.acceptTime > self.acceptInterval) {
        self.acceptTime = [[NSDate date] timeIntervalSince1970];
        return YES;
    }

    MCLog(@"~~~.abort repeat req nowTime: %lf", [[NSDate date] timeIntervalSince1970]);
    return NO;
}


@end
