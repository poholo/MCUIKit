//
// Created by 赵江明 on 15/11/12.
// Copyright (c) 2015 poholo Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (MCNumber)


- (long long)llmSec;

- (NSNumber *)msec;

- (NSString *)msecText;

/**
 * 毫秒
 */
+ (long long)llmSec;


/**
 * 毫秒
 */
+ (NSNumber *)msec;

/**
 * 毫秒字符串
 */
+ (NSString *)msecText;

/**
 * 秒
 */
+ (long long)llSec;

/**
 * 秒
 */
+ (NSNumber *)sec;


/**
 * 秒字符串
 */
+ (NSString *)secText;



@end