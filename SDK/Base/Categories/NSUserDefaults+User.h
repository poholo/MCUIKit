//
// Created by Jiangmingz on 2016/10/20.
// Copyright (c) 2016 poholo Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (User)

+ (void)setUserToken:(NSString *)token;

+ (NSString *)getUserToken;

+ (void)removeUserToken;

+ (void)setUserId:(NSString *)userId;

+ (NSString *)getUserId;

+ (void)removeUserId;

+ (void)setAppName:(NSString *)appName;

+ (NSString *)getAppName;

+ (void)removeAppName;

@end
