//
// Created by Jiangmingz on 2017/3/13.
// Copyright (c) 2017 poholo Inc. All rights reserved.
//

#import "MCEmptyTableController.h"


@interface MCRefreshTableController : MCEmptyTableController

@property(nonatomic, assign) BOOL hasRefresh;
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
