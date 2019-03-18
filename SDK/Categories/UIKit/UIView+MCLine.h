//
// Created by majiancheng on 2018/6/12.
// Copyright (c) 2018 poholo Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (MCLine)

@property(nonatomic, strong) UIView *lineView;

@property(nonatomic, strong) UIView *topLineView;

- (void)addCustomTopLineHeight:(CGFloat)height;

- (void)addBottomLineHieght:(CGFloat)height;

- (void)addCustomTopLineHeight:(CGFloat)height edge:(UIEdgeInsets)edgeInsets;

- (void)addBottomLineHieght:(CGFloat)height edge:(UIEdgeInsets)edgeInsets;

@end