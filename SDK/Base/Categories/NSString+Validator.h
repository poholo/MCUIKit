//
// Created by 赵江明 on 16/1/7.
// Copyright (c) 2016 poholo Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Validator)

- (BOOL)validateName;

- (BOOL)validateSpace;

- (NSInteger)hzLength;

- (NSInteger)charLength;

- (NSString *)removeSpaceAndNewline;

- (NSString *)removeAllSpaceAndNewline;

- (NSString *)removeSpace;

- (BOOL)checkUserIdCard;

- (BOOL)isNum;

- (BOOL)headIsZero;

- (BOOL)validateEmail;

- (BOOL)validatePhone;

- (BOOL)validateNumber;

- (NSString *)pathFromURL;

- (NSString *)replaceURLOfPath;

- (NSRange)hostRange;

- (BOOL)validateHttpIP;

- (BOOL)validateNumberHost;

@end
