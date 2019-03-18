//
//  NSString+Date.m
//  Dream
//
//  Created by 江明 赵 on 7/6/14.
//  Copyright (c) 2014 江明 赵. All rights reserved.
//

#import "NSString+MCDate.h"

@implementation NSString (MCDate)

- (NSDate *)someDay {
    static NSDateFormatter *dateFormatter;
    if (dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    }

    NSDate *date = [dateFormatter dateFromString:self];
    return date;
}

@end

@implementation NSString (Size)

- (CGSize)sizeFromLimitSize:(CGSize)size font:(UIFont *)font {
    CGFloat maxWidth = size.width;
    CGSize maxSize = CGSizeMake(maxWidth, CGFLOAT_MAX);
    CGSize textSize = CGSizeZero;
    // iOS7以后使用boundingRectWithSize，之前使用sizeWithFont
    if ([self respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
        // 多行必需使用NSStringDrawingUsesLineFragmentOrigin，网上有人说不是用NSStringDrawingUsesFontLeading计算结果不对
        NSStringDrawingOptions opts = NSStringDrawingUsesLineFragmentOrigin |
                NSStringDrawingUsesFontLeading;

        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
        [style setLineBreakMode:NSLineBreakByCharWrapping];

        NSDictionary *attributes = @{NSFontAttributeName: font, NSParagraphStyleAttributeName: style};

        CGRect rect = [self boundingRectWithSize:maxSize
                                         options:opts
                                      attributes:attributes
                                         context:nil];
        textSize = rect.size;
    } else {
        textSize = [self sizeWithFont:font constrainedToSize:maxSize lineBreakMode:NSLineBreakByCharWrapping];
    }

    return textSize;
}
@end
