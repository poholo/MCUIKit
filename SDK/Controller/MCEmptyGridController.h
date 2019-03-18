//
// Created by Jiangmingz on 2017/3/22.
// Copyright (c) 2017 poholo Inc. All rights reserved.
//

#import "MCGridController.h"

#import "MCEmptyDisplayNodeDelegate.h"

@class MCEmptyDisplayView;


@interface MCEmptyGridController : MCGridController <MCEmptyDisplayNodeDelegate>

@property(nonatomic, assign) BOOL hasTopEmpty;
@property(nonatomic, readonly) MCEmptyDisplayView *emptyDisplayView;

- (BOOL)hasData;

- (NSInteger)hasDataWithCount;

- (void)refresh;

- (void)changeStatus:(MCEmptyStatus)emptyStatus;

- (void)pullRefresh;

- (void)stopRefresh;

@end