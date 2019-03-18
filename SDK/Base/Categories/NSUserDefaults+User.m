//
// Created by Jiangmingz on 2016/10/20.
// Copyright (c) 2016 poholo Inc. All rights reserved.
//

#import "NSUserDefaults+User.h"

static NSString *const kWQUserDefaultKeyToken = @"user_token";
static NSString *const kWQUserDefaultKeyId = @"user_id";
static NSString *const kWQUserDefaultKeyAppName = @"app_name";

@implementation NSUserDefaults (User)

+ (void)setUserToken:(NSString *)token {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:token forKey:kWQUserDefaultKeyToken];
    [userDefaults synchronize];
}

+ (NSString *)getUserToken {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults objectForKey:kWQUserDefaultKeyToken];
}

+ (void)removeUserToken {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:kWQUserDefaultKeyToken];
    [userDefaults synchronize];
}

+ (void)setUserId:(NSString *)userId {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:userId forKey:kWQUserDefaultKeyId];
    [userDefaults synchronize];
}

+ (NSString *)getUserId {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults objectForKey:kWQUserDefaultKeyId];
}

+ (void)removeUserId {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:kWQUserDefaultKeyId];
    [userDefaults synchronize];
}

+ (void)setAppName:(NSString *)appName {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:appName forKey:kWQUserDefaultKeyAppName];
    [userDefaults synchronize];
}

+ (NSString *)getAppName {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults objectForKey:kWQUserDefaultKeyAppName];
}

+ (void)removeAppName {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:kWQUserDefaultKeyAppName];
    [userDefaults synchronize];
}

@end
