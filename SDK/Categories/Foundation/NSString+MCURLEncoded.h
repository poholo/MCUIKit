//
// Created by 赵江明 on 15/11/23.
// Copyright (c) 2015 poholo Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MCURLEncoded)

- (NSString *)escapedURLString;

- (NSString *)urlEncode;

- (NSString *)urlDecode;

- (NSString *)addUrlFromDictionary:(NSDictionary *)params hasQuestionMark:(NSString *)hasQuestionMark;

- (NSDictionary *)params;

- (NSMutableString *)urlParamString:(NSMutableDictionary *)quaryDict;

- (NSString *)createUrl;

- (NSString *)urlForAddQuryItems:(NSDictionary <NSString *, NSString *> *)queryItems;

@end
