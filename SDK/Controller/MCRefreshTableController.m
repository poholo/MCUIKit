//
// Created by Jiangmingz on 2017/3/13.
// Copyright (c) 2017 poholo Inc. All rights reserved.
//

#import "MCRefreshTableController.h"

#import "UIScrollView+MCLoad.h"
#import "MCLog.h"

@interface MCRefreshTableController ()

@property(nonatomic, assign) BOOL isFirst;
@property(nonatomic, assign) BOOL isLast;
@property(nonatomic, assign) BOOL isRefresh;
@property(nonatomic, assign) NSInteger count;

@end

@implementation MCRefreshTableController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.hasMore = YES;
        self.hasRefresh = YES;
    }

    return self;
}

- (instancetype)initWithRouterParams:(NSDictionary *)params {
    self = [super initWithRouterParams:params];
    if (self) {
        self.hasMore = YES;
        self.hasRefresh = YES;
    }

    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.scrollEnabled = NO;

    if (self.hasRefresh) {
        [self configureRefresh];
    }

    if (self.hasMore) {
        [self configureMore];
    }

    [self changeStatus:MCRefreshStatus];
}

- (void)configureRefresh {
    self.isFirst = YES;

    __weak typeof(self) weakSelf = self;
    [self.tableView setHeaderStateInHeaderRefresh:^{
        __strong typeof(self) strongSelf = weakSelf;

        if (strongSelf.isFirst) {
            strongSelf.isFirst = NO;
            [strongSelf pullToRefresh];
        }
    }];
}

- (void)triggerPullToRefresh {
    [self.tableView triggerPullToRefresh];
}

- (void)pullToRefresh {
    self.isRefresh = YES;

    [self refresh];
}

- (void)stopRefresh {
    self.isFirst = YES;

    NSInteger count = [self hasDataWithCount];
    if (count > 0) {
        self.tableView.scrollEnabled = YES;
        [self changeStatus:MCDataStatus];
        [self.tableView hideFooter:count < 20];
    } else {
        self.tableView.scrollEnabled = NO;
        [self changeStatus:MCNoDataStatus];
    }

    self.count = count;
    [self.tableView stopRefresh];
    [self reloadData];
}

- (void)configureMore {
    self.isLast = YES;

    __weak typeof(self) weakSelf = self;
    [self.tableView setFooterStateInFooterRefresh:^{
        __strong __typeof(self) strongSelf = weakSelf;

        if (strongSelf.isLast) {
            strongSelf.isLast = NO;
            [strongSelf pullToMore];
        }
    }];
}

- (void)pullToMore {
    self.isRefresh = NO;

    [self more];
}

- (void)more {

}

- (void)stopMore {
    self.isLast = YES;

    NSInteger count = [self hasDataWithCount];
    if (count > 0) {
        self.tableView.scrollEnabled = YES;
        [self.tableView hideFooter:self.count == count];
    }
    self.count = count;

    [self.tableView stopMore];
    [self reloadData];
}

- (void)stopAll {
    self.isFirst = YES;
    self.isLast = YES;

    if (self.isRefresh) {
        if ([self hasData]) {
            self.tableView.scrollEnabled = YES;
            [self changeStatus:MCDataStatus];
        } else {
            self.tableView.scrollEnabled = NO;
            [self changeStatus:MCErrorStatus];
        }
    } else {
        self.tableView.scrollEnabled = YES;
    }

    [self.tableView stopAll];
}

- (void)removeHeader {
    [self.tableView removeHeader];
}

- (void)hideHeader:(BOOL)hide {
    [self.tableView hideHeader:hide];
}

- (void)removeFooter {
    [self.tableView removeFooter];
}

- (void)hideFooter:(BOOL)hide {
    [self.tableView hideFooter:hide];
}

@end
