//
// Created by Jiangmingz on 2017/3/15.
// Copyright (c) 2017 poholo Inc. All rights reserved.
//

#import "MCButton.h"

#import "UIButton+WebCache.h"


@implementation MCButton

- (void)setImageURL:(NSString *)urlString forState:(UIControlState)state defaultImage:(UIImage *)defaultImage {
    NSURL *url = [NSURL URLWithString:urlString];
    [self sd_setImageWithURL:url forState:state placeholderImage:defaultImage];
}

- (void)setBackgroundImageURL:(NSString *)urlString forState:(UIControlState)state defaultImage:(UIImage *)defaultImage {
    NSURL *url = [NSURL URLWithString:urlString];
    [self sd_setBackgroundImageWithURL:url forState:state placeholderImage:defaultImage];
}

@end

