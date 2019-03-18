//
// Created by Jiangmingz on 2018/7/5.
// Copyright (c) 2018 poholo Inc. All rights reserved.
//

#import "NSDecimalNumber+MCText.h"


@implementation NSDecimalNumber (MCText)

- (NSString *)roundDownText {
    NSDecimalNumberHandler *roundingBehavior = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundDown scale:5 raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO];
    NSDecimalNumber *roundedOunces = [self decimalNumberByRoundingAccordingToBehavior:roundingBehavior];
    return [roundedOunces stringValue];
}

+ (NSDecimalNumber *)doubleDecimal:(NSNumber *)number {
    NSString *doubleString = [NSString stringWithFormat:@"%.5lf", number.doubleValue];
    return [NSDecimalNumber decimalNumberWithString:doubleString];
}

@end
