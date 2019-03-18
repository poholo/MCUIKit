//
// Created by majiancheng on 2017/8/22.
// Copyright (c) 2017 poholo Inc. All rights reserved.
//


#import "NSString+MCExtend.h"

#import "MCColor.h"


@implementation NSString (MCExtend)

- (NSString *)findContainURL {
    NSString *regExpString = @"https?://[a-zA-Z0-9\\-.]+(?::(\\d+))?(?:(?:/[a-zA-Z0-9\\-._?,'+\\&%$=~*!():@\\\\]*)+)?";
    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regExpString options:NSRegularExpressionCaseInsensitive error:&error];
    NSTextCheckingResult *result = [regex firstMatchInString:self options:0 range:NSMakeRange(0, [self length])];
    if (result) {
        return [self substringWithRange:result.range];
    }

    return @"";
}

- (BOOL)validatorIsURL {
    return [self hasPrefix:@"http://"] || [self hasPrefix:@"https://"];
}

- (NSString *)getURLPath {
    NSString *regExpString = @"((([A-Za-z]{3,9}:(?:\\/\\/)?)(?:[-;:&=\\+\\$,\\w]+@)?[A-Za-z0-9.-]+(:[0-9]+)?|(?:ww\u200C\u200Bw.|[-;:&=\\+\\$,\\w]+@)[A-Za-z0-9.-]+)((?:\\/[\\+~%\\/.\\w-_]*)?\\??(?:[-\\+=&;%@.\\w_]*)#?\u200C\u200B(?:[\\w]*))?)";
    NSRange range = [self rangeOfString:regExpString options:NSRegularExpressionSearch];
    return [self substringFromIndex:range.length];
}

- (NSMutableAttributedString *)convert2SearchHotTextRanges:(NSArray<NSValue *> *)ranges {
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:self];
    [ranges enumerateObjectsUsingBlock:^(NSValue *range, NSUInteger idx, BOOL *stop) {
        NSRange range1 = [range rangeValue];
        if (range1.location < self.length && range1.location + range1.length <= self.length) {
            [attString setAttributes:@{NSForegroundColorAttributeName: [MCColor colorIV]} range:range1];
        }
    }];
    return attString;
}

- (NSString *)filterHTTP {
    if ([self hasPrefix:@"http://"]) {
        return [[self componentsSeparatedByString:@"http://"] lastObject];
    } else if ([self hasPrefix:@"http://"]) {
        return [[self componentsSeparatedByString:@"https://"] lastObject];
    } else {
        return self;
    }
}

// 根据指定文本和字体计算尺寸
- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font {
    return [self sizeWithText:text font:font maxWidth:MAXFLOAT maxHeight:MAXFLOAT];
}

// 根据指定文本,字体和最大宽度计算尺寸
- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxWidth:(CGFloat)maxWidth maxHeight:(CGFloat)maxHeight {
    static NSMutableDictionary *attrDict;
    if (!attrDict) {
        attrDict = [NSMutableDictionary dictionary];
    }

    attrDict[NSFontAttributeName] = font;
    CGSize size = [text boundingRectWithSize:CGSizeMake(maxWidth, maxHeight)
                                     options:NSStringDrawingUsesLineFragmentOrigin
                                  attributes:attrDict
                                     context:nil].size;
    return size;
}

@end
