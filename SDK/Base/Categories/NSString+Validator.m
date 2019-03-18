//
// Created by 赵江明 on 16/1/7.
// Copyright (c) 2016 poholo Inc. All rights reserved.
//

#import "NSString+Validator.h"

@implementation NSString (Validator)

- (BOOL)validateName {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"[\\u4e00-\\u9fa5\\w\\-]+"];
    BOOL isValid = [predicate evaluateWithObject:self];
    return isValid;
}

- (BOOL)validateSpace {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"\\s"];
    BOOL isValid = [predicate evaluateWithObject:self];
    return isValid;
}

- (NSInteger)hzLength {
    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"[\\u4e00-\\u9fa5]" options:NSRegularExpressionCaseInsensitive error:&error];
    NSUInteger count = [regex numberOfMatchesInString:self options:0 range:NSMakeRange(0, [self length])];
    return count;
}

- (NSInteger)charLength {
    return [self length] + [self hzLength];
}

- (NSString *)removeSpaceAndNewline {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString *)removeSpace {
    return [self stringByReplacingOccurrencesOfString:@" " withString:@""];
}

- (NSString *)removeAllSpaceAndNewline {
    NSString *temp = [self removeSpaceAndNewline];
    return [[temp stringByReplacingOccurrencesOfString:@"\n" withString:@""] stringByReplacingOccurrencesOfString:@"\r" withString:@""];
}

#pragma 正则匹配用户身份证号15或18位

- (BOOL)checkUserIdCard {
    NSString *pattern = @"(^[0-9]{15}$)|([0-9]{17}([0-9]|X)$)";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    return [pred evaluateWithObject:self];
}

- (BOOL)isNum {
    NSString *number = @"^[0-9]+$";
    NSPredicate *numberPre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", number];
    return [numberPre evaluateWithObject:self];
}

- (BOOL)headIsZero {
    NSString *head = [self substringToIndex:1];
    return [head isEqualToString:@"0"] && self.length > 1;
}

- (BOOL)validateEmail {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

- (BOOL)validatePhone {
    NSString *phoneRegex = @"1[3|5|7|8|][0-9]{9}";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    return [phoneTest evaluateWithObject:self];
}

- (BOOL)validateNumber {
    NSString *regex = @"^[1-9]\\d*|0$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}

- (NSString *)pathFromURL {
    NSString *regExpString = @"^((http://)|(https://))?([a-zA-Z0-9]([a-zA-Z0-9\\-]{0,61}[a-zA-Z0-9])?\\.)+[a-zA-Z]{2,6}(/)";
    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regExpString options:NSRegularExpressionCaseInsensitive error:&error];
    NSTextCheckingResult *result = [regex firstMatchInString:self options:0 range:NSMakeRange(0, [self length])];
    if (result) {
        return [self substringWithRange:result.range];
    }

    return @"";
}

- (NSString *)replaceURLOfPath {
    NSString *regExpString = @"^((http://)|(https://))?([a-zA-Z0-9]([a-zA-Z0-9\\-]{0,61}[a-zA-Z0-9])?\\.)+[a-zA-Z]{2,6}";
    return [self stringByReplacingOccurrencesOfString:regExpString withString:@""];
}

- (NSRange)hostRange {
    NSString *regExpString = @"([a-zA-Z0-9]([a-zA-Z0-9\\-]{0,61}[a-zA-Z0-9])?\\.)+[a-zA-Z]{2,6}";
    NSRange range = [self rangeOfString:regExpString options:NSRegularExpressionSearch];
    return range;
}

- (BOOL)validateHttpIP {
    // 包含全部情况的为 ^((http://)|(https://))?\d+.\d+.\d+.\d+(:\d+)?
    NSString *regex = @"^((http://)|(https://))?\\d+.\\d+.\\d+.\\d+(:\\d+)?";
    NSRange range = [self rangeOfString:regex options:NSRegularExpressionSearch];
    return range.location != NSNotFound;
}

- (BOOL)validateNumberHost {
    NSString *regex = @"^((http://)|(https://))?\\d+.\\d+.\\d+.\\d+";
    NSRange range = [self rangeOfString:regex options:NSRegularExpressionSearch];
    return range.location != NSNotFound;
}

@end
