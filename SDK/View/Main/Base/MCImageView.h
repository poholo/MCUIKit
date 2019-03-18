//
// Created by Jiangmingz on 2017/3/15.
// Copyright (c) 2017 poholo Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@interface MCImageView : UIImageView

- (void)hide;

- (void)show;

- (void)setImageURL:(NSString *)urlString defaultImage:(UIImage *)defaultImage;

@end