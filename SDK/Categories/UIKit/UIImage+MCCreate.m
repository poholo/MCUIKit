//
//  UIImage+ImageWithColor.m
//  UIImage-ImageWithColor
//
//  Created by Bruno Tortato Furtado on 14/12/13.
//  Copyright (c) 2013 No Zebra Network. All rights reserved.
//

#import "UIImage+MCCreate.h"

@implementation UIImage (MCCreate)

+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return image;
}

- (UIImage *)imageWithColor:(UIColor *)color {
    UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0, self.size.height);
    CGContextScaleCTM(context, 1.0, -1.0f);
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextClipToMask(context, rect, self.CGImage);
    [color setFill];
    CGContextFillRect(context, rect);
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size xSpace:(CGFloat)xSpace ySpace:(CGFloat)ySpace cornorRadius:(CGFloat)radius {

    CGRect rect = CGRectMake(xSpace, ySpace, size.width, size.height);

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(xSpace * 2 + size.width, ySpace * 2 + size.height), NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextSetLineWidth(context, 1);
    CGFloat scale = [UIScreen mainScreen].scale;
    CGContextAddArc(context, xSpace + size.width / 2.0f, ySpace + size.height / 2.0f, size.width / 2.0f, 0, M_PI * 2.0f, YES);

    CGContextSetAllowsAntialiasing(context, YES);
    CGContextSetShouldAntialias(context, YES);

    CGContextDrawPath(context, kCGPathFill);
    CGContextFillPath(context);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return image;
}

// 图文水平居中
+ (UIImage *)imageWithSize:(CGSize)size
                     color:(UIColor *)color
                     image:(UIImage *)image
                     title:(NSString *)title
                    xSpace:(CGFloat)xSpace
                  fontSize:(CGFloat)fontSize
                 textColor:(UIColor *)textColor {
    
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGSize imageSize = image.size;

    // 文字居中显示在画布上
    NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paragraphStyle.alignment = NSTextAlignmentCenter;//文字居中

    // 计算文字所占的size,文字居中显示在画布上
    UIFont *font = [UIFont systemFontOfSize:fontSize];
    CGSize textSize = [title boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin
                                       attributes:@{NSFontAttributeName: font} context:nil].size;
    
    // 绘制背景
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context,CGRectMake(0, 0, size.width, size.height));

    // 绘制图片
    CGFloat xImage = (size.width - imageSize.width - xSpace - textSize.width) * 0.5f;
    CGFloat yImage = (size.height - imageSize.height) * 0.5f;
    [image drawInRect:CGRectMake(xImage, yImage, imageSize.width, imageSize.height)];

    // 绘制文字
    CGFloat xText = xImage + imageSize.width + xSpace;
    CGFloat yText = (size.height - textSize.height) * 0.5f;
    NSDictionary *attributes = @{NSFontAttributeName: font, NSForegroundColorAttributeName: textColor, NSParagraphStyleAttributeName: paragraphStyle};
    [title drawInRect:CGRectMake(xText, yText, textSize.width, textSize.height) withAttributes:attributes];

    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return newImage;
}


@end
