//
// Created by Jiangmingz on 2017/3/15.
// Copyright (c) 2017 poholo Inc. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface MCButton : UIButton

- (void)setImageURL:(NSString *)urlString forState:(UIControlState)state defaultImage:(UIImage *)defaultImage;

- (void)setBackgroundImageURL:(NSString *)urlString forState:(UIControlState)state defaultImage:(UIImage *)defaultImage;

@end