//
// Created by Jiangmingz on 2017/3/15.
// Copyright (c) 2017 poholo Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MCTableController.h"
#import "MCEmptyDisplayNodeDelegate.h"

@class MCEmptyDisplayView;

@interface MCEmptyTableController : MCTableController <MCEmptyDisplayNodeDelegate>

@property(nonatomic, readonly) MCEmptyDisplayView *emptyDisplayView;

- (BOOL)hasData;

- (NSInteger)hasDataWithCount;

- (void)pullToRefresh;

- (void)refresh;

- (void)stopRefresh;

- (void)changeStatus:(MCEmptyStatus)emptyStatus;

- (void)createEmptyView;

@end