
//
// Created by 江明 赵 on 12/31/14.
// Copyright (c) 2014 江明 赵. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (MCDate)

- (NSDate *)date;

- (NSString *)minSec;

- (NSString *)timeNowInterval;

- (NSString *)min;

- (NSString *)timeText;

- (NSString *)mSec;

- (NSString *)timeLocalNow;

- (NSString *)ymdText;

- (NSString *)mdText;

- (NSString *)dayText;

- (NSString *)timeAgo;

/**
 * mm月dd日  HH:MM
 */
- (NSString *)mmddHHMM;

- (NSString *)yyyyMMddHHmm;

/** YYYY-MM-dd */
- (NSString *)yyyy_MM_dd;

- (NSString *)yyyyMMdd;

/**yyyy-MM-dd HH:mm*/
- (NSString *)yyyy_MM_ddHHmm;

- (NSString *)yyyy_MM_ddHHmmss;

- (NSString *)mmddHHMM2;

- (NSString *)mmdd;

+ (NSNumber *)compareCurrentTime:(NSDate *)compareDate;

- (NSString *)timeInfo;

- (BOOL)isUpload;

@end


@interface NSNumber (Formart)
/***
 * 共同数字展现格式
 */
- (NSString *)commenNumber2String;

@end
