//
// Created by Jiangmingz on 2018/8/19.
// Copyright (c) 2018 poholo Inc. All rights reserved.
//

#import "MCEmptyController.h"
#import "MCEmptyDisplayView.h"

@interface MCEmptyController ()

@property(nonatomic, strong) MCEmptyDisplayView *emptyDisplayView;

@end

@implementation MCEmptyController

- (instancetype)init {
    self = [super init];
    if (self) {

    }

    return self;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];

    self.emptyDisplayView.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame));
}

- (void)removeEmptyView {
    [self.emptyDisplayView removeFromSuperview];
    self.emptyDisplayView = nil;
}

- (void)createEmptyView {
    if (!self.emptyDisplayView) {
        self.emptyDisplayView = [MCEmptyDisplayView new];
        self.emptyDisplayView.delegate = self;
        [self.view addSubview:self.emptyDisplayView];
    }
    self.emptyDisplayView.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame));
}

- (void)changeStatus:(MCEmptyStatus)emptyStatus {
    if (emptyStatus == MCDataStatus) {
        [self removeEmptyView];
    } else {
        [self createEmptyView];
    }

    self.emptyDisplayView.emptyStatus = emptyStatus;
}

- (void)stopRefresh {
    if ([self hasData]) {
        [self changeStatus:MCDataStatus];
    } else {
        [self changeStatus:MCErrorStatus];
    }
}

- (void)pullToRefresh {
    [self changeStatus:MCRefreshStatus];
    [self refresh];
}

- (void)refresh {

}

@end