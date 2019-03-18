//
// Created by Jiangmingz on 2018/7/10.
// Copyright (c) 2018 poholo Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (MCCompress)

/*
 *  压缩图片方法(先压缩质量再压缩尺寸)
 */
- (NSData *)compressWithLengthLimit:(NSUInteger)maxLength;

/*
 *  压缩图片方法(压缩质量)
 */
- (NSData *)compressQualityWithLengthLimit:(NSInteger)maxLength;

/*
 *  压缩图片方法(压缩质量二分法)
 */
- (NSData *)compressMidQualityWithLengthLimit:(NSInteger)maxLength;

/*
 *  压缩图片方法(压缩尺寸)
 */
- (NSData *)compressBySizeWithLengthLimit:(NSUInteger)maxLength;

- (UIImage *)imageWithSize:(CGSize)size;

@end
