//
// Created by Jiangmingz on 2017/3/15.
// Copyright (c) 2017 poholo Inc. All rights reserved.
//

#import "MCImageView.h"

#import "UIImageView+WebCache.h"

@implementation MCImageView

- (void)hide {
    if (self.hidden) {
        return;
    }

    self.hidden = YES;
}

- (void)show {
    if (!self.hidden) {
        return;
    }

    self.hidden = NO;
}

- (void)setImageURL:(NSString *)urlString defaultImage:(UIImage *)defaultImage {
    NSURL *url = [NSURL URLWithString:urlString];
    [self sd_setImageWithURL:url placeholderImage:defaultImage];
}

@end

