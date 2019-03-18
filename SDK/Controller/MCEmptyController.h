//
// Created by Jiangmingz on 2018/8/19.
// Copyright (c) 2018 poholo Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MCController.h"
#import "MCEmptyDisplayNodeDelegate.h"

@class MCEmptyDisplayView;


@interface MCEmptyController : MCController <MCEmptyDisplayNodeDelegate>

@property(nonatomic, readonly) MCEmptyDisplayView *emptyDisplayView;
@property(nonatomic, assign) BOOL hasData;

- (void)refresh;

- (void)pullToRefresh;

- (void)stopRefresh;

@end