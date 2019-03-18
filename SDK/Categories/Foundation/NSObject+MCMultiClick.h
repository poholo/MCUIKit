//
//  NSObject+MultiClick.h
//  Gym
//
//  Created by majiancheng on 2017/2/10.
//  Copyright © 2017年 poholo Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (MCMultiClick)

@property (nonatomic, assign) NSTimeInterval acceptInterval; ///< 间隔 s
@property (nonatomic, assign) NSTimeInterval acceptTime;     ///< 上次触发事件时间

/**
 * 是否接受本次事件
 */
- (BOOL)canAcceptEvent;

@end
