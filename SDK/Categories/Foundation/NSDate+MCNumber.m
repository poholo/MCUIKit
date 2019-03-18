//
// Created by 赵江明 on 15/11/12.
// Copyright (c) 2015 poholo Inc. All rights reserved.
//

#import "NSDate+MCNumber.h"


@implementation NSDate (MCNumber)

- (long long)llmSec {
    long long value = (long long) ([self timeIntervalSince1970] * 1000);
    return value;
}

- (NSNumber *)msec {
    return @([self llmSec]);
}

- (NSString *)msecText {
    return [[self msec] stringValue];
}

+ (long long)llmSec {
    long long value = (long long) ([[NSDate date] timeIntervalSince1970] * 1000);
    return value;
}

+ (NSNumber *)msec {
    return @([self llmSec]);
}

+ (NSString *)msecText {
    return [[self msec] stringValue];
}

+ (long long)llSec {
    long long value = (long long) [[NSDate date] timeIntervalSince1970];
    return value;
}

+ (NSNumber *)sec {
    return @([self llSec]);
}

+ (NSString *)secText {
    return [[self sec] stringValue];
}

@end
