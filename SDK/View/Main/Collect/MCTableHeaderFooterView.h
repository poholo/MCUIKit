//
// Created by 江明 赵 on 12/12/14.
// Copyright (c) 2014 江明 赵. All rights reserved.
//

#import <Foundation/Foundation.h>

@import UIKit;

@class LogParam;

@interface MCTableHeaderFooterView : UITableViewHeaderFooterView

@property(nonatomic, strong) LogParam *logParam;

+ (NSString *)identifier;

+ (NSString *)reuseIdentifier;

+ (CGFloat)staticHeight;

@end
