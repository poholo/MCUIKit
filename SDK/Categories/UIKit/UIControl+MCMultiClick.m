//
// Created by Jiangmingz on 2016/6/30.
// Copyright (c) 2016 poholo Inc. All rights reserved.
//


#import "UIControl+MCMultiClick.h"
#import <objc/runtime.h>

static const char *UIControl_acceptEventInterval = "UIControl_acceptEventInterval";
static const char *UIControl_acceptEventTime = "UIControl_acceptEventTime";

@implementation UIControl (MCMultiClick)

- (NSTimeInterval)acceptEventInterval {
    return [objc_getAssociatedObject(self, UIControl_acceptEventInterval) doubleValue];
}

- (void)setAcceptEventInterval:(NSTimeInterval)acceptEventInterval {
    objc_setAssociatedObject(self, UIControl_acceptEventInterval, @(acceptEventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSTimeInterval)acceptEventTime {
    return [objc_getAssociatedObject(self, UIControl_acceptEventTime) doubleValue];
}

- (void)setAcceptEventTime:(NSTimeInterval)acceptEventTime {
    objc_setAssociatedObject(self, UIControl_acceptEventTime, @(acceptEventTime), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (void)load {
    Method beforeMethod = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    Method afterMethod = class_getInstanceMethod(self, @selector(mm_sendAction:to:forEvent:));
    method_exchangeImplementations(beforeMethod, afterMethod);
}

- (void)mm_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    if (self.acceptEventInterval != 0) {
        if ([[NSDate date] timeIntervalSince1970] - self.acceptEventTime < self.acceptEventInterval) {
            return; 
        }

        self.acceptEventTime = [[NSDate date] timeIntervalSince1970];
    }

    [self mm_sendAction:action to:target forEvent:event];
}

@end
