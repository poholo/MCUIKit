//
// Created by Jiangmingz on 2017/3/22.
// Copyright (c) 2017 poholo Inc. All rights reserved.
//

#import "MCEmptyGridController.h"


@interface MCRefreshGridController : MCEmptyGridController

@property(nonatomic, assign) BOOL hasMore;

- (void)pullToRefresh;

- (void)triggerPullToRefresh;

- (void)stopRefresh;

- (void)pullToMore;

- (void)more;

- (void)stopMore;

- (void)stopAll;

- (void)removeHeader;

- (void)hideHeader:(BOOL)hide;

- (void)removeFooter;

- (void)hideFooter:(BOOL)hide;

@end