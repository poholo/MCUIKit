//
// Created by Jiangmingz on 2017/3/22.
// Copyright (c) 2017 poholo Inc. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface UIButton (MCImageText)

//上下居中，图片在上，文字在下
- (void)verticalCenterImageAndTitle:(CGFloat)spacing;

- (void)verticalCenterImageAndTitle; //默认5.0

//左右居中，文字在左，图片在右
- (void)horizontalCenterTitleAndImage:(CGFloat)spacing;

- (void)horizontalCenterTitleAndImage; //默认5.0

//左右居中，图片在左，文字在右
- (void)horizontalCenterImageAndTitle:(CGFloat)spacing;

- (void)horizontalCenterImageAndTitle; //默认5.0

//文字居中，图片在左边
- (void)horizontalCenterTitleAndImageLeft:(CGFloat)spacing;

- (void)horizontalCenterTitleAndImageLeft; //默认5.0

//文字居中，图片在右边
- (void)horizontalCenterTitleAndImageRight:(CGFloat)spacing;

- (void)horizontalCenterTitleAndImageRight; //默认5.0

@end