//
// Created by Jiangmingz on 2016/6/30.
// Copyright (c) 2016 poholo Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIControl (MCMultiClick)

@property(nonatomic, assign) NSTimeInterval acceptEventInterval; //点击的间隔
@property(nonatomic, assign) NSTimeInterval acceptEventTime; //上一次点击时间

@end