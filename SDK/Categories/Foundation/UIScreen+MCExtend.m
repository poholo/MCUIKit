//
// Created by Jiangmingz on 2017/3/16.
// Copyright (c) 2017 poholo Inc. All rights reserved.
//

#import "UIScreen+MCExtend.h"


@implementation UIScreen (MCExtend)

+ (CGSize)size {
    return [[UIScreen mainScreen] bounds].size;
}

+ (CGSize)sizeSwap {
    return CGSizeMake([self size].height, [self size].width);
}

+ (CGFloat)width {
    return [[UIScreen mainScreen] bounds].size.width;
}

+ (CGFloat)height {
    return [[UIScreen mainScreen] bounds].size.height;
}

+ (CGFloat)scale {
    return [UIScreen mainScreen].scale;
}

+ (CGFloat)screenWidth9Division16 {
    return (9.0f / 16.0f) * [self width];
}

+ (CGFloat)smallPlaylistCoverHeight {
    return ([self width] - 30.0f) / 3.6f;
}

+ (CGFloat)smallPlaylistCoverWide {
    return [self smallPlaylistCoverHeight] * 1.8f;
}

+ (CGFloat)deviceScale {
    return (MIN([UIScreen width], [UIScreen height]) / 375.0f);
}

+ (BOOL)isRetina {
    return ([[UIScreen mainScreen] respondsToSelector:@selector(displayLinkWithTarget:selector:)] &&
            ([UIScreen mainScreen].scale > 1.0));
}

@end
