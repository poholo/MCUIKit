//
// Created by Jiangmingz on 2017/3/22.
// Copyright (c) 2017 poholo Inc. All rights reserved.
//

#import "MCRefreshGridController.h"

#import "MCCollectionView.h"
#import "UIScrollView+MCLoad.h"

@interface MCRefreshGridController ()

@property(nonatomic, assign) BOOL isFirst;
@property(nonatomic, assign) BOOL isLast;
@property(nonatomic, assign) BOOL isRefresh;
@property(nonatomic, assign) NSInteger count;

@end

@implementation MCRefreshGridController


- (instancetype)init {
    self = [super init];
    if (self) {
        self.hasMore = YES;
    }

    return self;
}

- (instancetype)initWithRouterParams:(NSDictionary *)params {
    self = [super initWithRouterParams:params];
    if (self) {
        self.hasMore = YES;
    }

    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.collectionView.scrollEnabled = NO;
    [self configureRefresh];

    if (self.hasMore) {
        [self configureMore];
    }

    [self changeStatus:MCRefreshStatus];
}

- (void)configureRefresh {
    self.isFirst = YES;

    __weak typeof(self) weakSelf = self;
    [self.collectionView setHeaderStateInHeaderRefresh:^{
        __strong typeof(self) strongSelf = weakSelf;

        if (strongSelf.isFirst) {
            strongSelf.isFirst = NO;
            [strongSelf pullToRefresh];
        }
    }];
}

- (void)triggerPullToRefresh {
    [self.collectionView triggerPullToRefresh];
}

- (void)pullToRefresh {
    self.isRefresh = YES;

    [self refresh];
}

- (void)stopRefresh {
    self.isFirst = YES;

    NSInteger count = [self hasDataWithCount];
    if (count > 0) {
        self.collectionView.scrollEnabled = YES;
        [self changeStatus:MCDataStatus];
        [self.collectionView hideFooter:count < 20];
    } else {
        self.collectionView.scrollEnabled = NO;
        [self changeStatus:MCNoDataStatus];
    }

    self.count = count;
    [self.collectionView stopRefresh];
    [self reloadData];
}

- (void)configureMore {
    self.isLast = YES;

    __weak typeof(self) weakSelf = self;
    [self.collectionView setFooterStateInFooterRefresh:^{
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
        self.collectionView.scrollEnabled = YES;
        [self.collectionView hideFooter:self.count == count];
    }
    self.count = count;

    [self.collectionView stopMore];
    [self reloadData];
}

- (void)stopAll {
    self.isFirst = YES;
    self.isLast = YES;

    if (self.isRefresh) {
        if ([self hasData]) {
            self.collectionView.scrollEnabled = YES;
        } else {
            self.collectionView.scrollEnabled = NO;
            [self changeStatus:MCErrorStatus];
        }
    } else {
        self.collectionView.scrollEnabled = YES;
    }

    [self.collectionView stopAll];
}

- (void)removeHeader {
    [self.collectionView removeHeader];
}

- (void)hideHeader:(BOOL)hide {
    [self.collectionView hideHeader:hide];
}

- (void)removeFooter {
    [self.collectionView removeFooter];
}

- (void)hideFooter:(BOOL)hide {
    [self.collectionView hideFooter:hide];
}


@end
