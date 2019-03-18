//
// Created by Jiangmingz on 2017/7/5.
// Copyright (c) 2017 poholo Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MCProgressHUDView : NSObject

+ (void)show;

+ (void)showIndeterminate;

+ (void)text:(NSString *)text;

+ (void)progress:(CGFloat)progress;

+ (void)dismiss;

@end
