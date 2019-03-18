//
//  WQDataController.m
//  Gym
//
//  Created by Jiangmingz on 2017/3/8.
//  Copyright © 2017年 poholo Inc. All rights reserved.
//

#import "MCEmptyTableController.h"

#import "MCEmptyDisplayView.h"

@interface MCEmptyTableController ()

@property(nonatomic, strong) MCEmptyDisplayView *emptyDisplayView;

@end

@implementation MCEmptyTableController

- (instancetype)init {
    self = [super init];
    if (self) {

    }

    return self;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.emptyDisplayView.frame = CGRectMake(0, 0, CGRectGetWidth(self.tableView.frame), CGRectGetHeight(self.tableView.frame));
}

- (void)removeEmptyView {
    [self.emptyDisplayView removeFromSuperview];
    self.emptyDisplayView = nil;
}

- (void)createEmptyView {
    if (!self.emptyDisplayView) {
        self.emptyDisplayView = [MCEmptyDisplayView new];
        self.emptyDisplayView.delegate = self;
        [self.tableView addSubview:self.emptyDisplayView];
    }
    self.emptyDisplayView.frame = CGRectMake(0, 0, CGRectGetWidth(self.tableView.frame), CGRectGetHeight(self.tableView.frame));
}

- (BOOL)hasData {
    NSInteger section = [self numberOfSectionsInTableView:self.tableView];
    if (section == 0) {
        return NO;
    }

    for (int i = 0; i < section; ++i) {
        NSInteger itemsInSection = [self tableView:self.tableView numberOfRowsInSection:i];
        if (itemsInSection > 0) {
            return YES;
        }
    }

    return NO;
}

- (NSInteger)hasDataWithCount {
    NSInteger count = 0;
    NSInteger section = [self numberOfSectionsInTableView:self.tableView];
    if (section > 0) {
        for (NSInteger i = 0; i < section; ++i) {
            count = count + [self tableView:self.tableView numberOfRowsInSection:i];
        }
    }

    return count;
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

    [self reloadData];
}

- (void)pullToRefresh {
    [self changeStatus:MCRefreshStatus];
    [self refresh];
}


- (void)refresh {

}

@end
