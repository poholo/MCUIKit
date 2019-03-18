//
//  NSString+Date.h
//  Dream
//
//  Created by 江明 赵 on 7/6/14.
//  Copyright (c) 2014 江明 赵. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@interface NSString (MCDate)

- (NSDate *)someDay;

@end


@interface NSString (Size)

- (CGSize)sizeFromLimitSize:(CGSize)size font:(UIFont *)font;

@end