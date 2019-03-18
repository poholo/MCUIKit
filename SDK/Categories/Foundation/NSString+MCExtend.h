//
// Created by majiancheng on 2017/8/22.
// Copyright (c) 2017 poholo Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (MCExtend)

- (NSString *)findContainURL;

- (NSString *)getURLPath;

- (BOOL)validatorIsURL;

- (NSMutableAttributedString *)convert2SearchHotTextRanges:(NSArray<NSValue *> *)ranges;

- (NSString *)filterHTTP;

// 根据指定文本和字体计算尺寸
- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font;

// 根据指定文本,字体和最大宽度计算尺寸
- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxWidth:(CGFloat)maxWidth maxHeight:(CGFloat)maxHeight;

@end
