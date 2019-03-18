//
// Created by Jiangmingz on 2017/3/16.
// Copyright (c) 2017 poholo Inc. All rights reserved.
//

#import "NSNumber+MCText.h"

#import "MCLog.h"

@implementation NSNumber (MCText)

- (NSString *)doubleText {
    MCLog(@"[DoubleText] 1 -> %@", self);
    NSString *doubleString = [NSString stringWithFormat:@"%.5lf", self.doubleValue];
    NSDecimalNumber *decNumber = [NSDecimalNumber decimalNumberWithString:doubleString];
    MCLog(@"[DoubleText] 2 -> %@", decNumber);
    return [NSString stringWithFormat:@"%@", decNumber];
}

//转换数量
- (NSString *)text {
    long long count = [self longLongValue];
    long long wan = count / 10000;
    if (wan > 0) {
        long long yi = wan / 10000;
        if (yi > 0) return [NSString stringWithFormat:@"%.1f亿", wan / 10000.0];
        return [NSString stringWithFormat:@"%.1f万", count / 10000.0];
    } else {
        if (count == 0) {
            return @"0";
        }
        return [NSString stringWithFormat:@"%lld", count];
    }
}

- (NSString *)numLimt99 {
    long long count = [self longLongValue];
    if (count < 999) {
        return [NSString stringWithFormat:@"%lld", count];
    }
    return @"999+";
}


- (NSString *)countFormat {
    long long count = [self longLongValue];
    long long wan = count / 10000;
    if (wan > 0) {
        long long yi = wan / 10000;
        if (yi > 0) return [NSString stringWithFormat:@"%.1f亿", wan / 10000.0];
        return [NSString stringWithFormat:@"%.1f万", count / 10000.0];
    } else {
        if (count == 0) {
            return @"0";
        }

        return [NSString stringWithFormat:@"%lld", count];
    }
}

@end
