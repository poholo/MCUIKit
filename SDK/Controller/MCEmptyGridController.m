//
// Created by Jiangmingz on 2017/3/22.
// Copyright (c) 2017 poholo Inc. All rights reserved.
//


#import "MCEmptyGridController.h"

#import "MCEmptyDisplayView.h"
#import "MCCollectionView.h"

@interface MCEmptyGridController ()

@property(nonatomic, strong) MCEmptyDisplayView *emptyDisplayView;

@end

@implementation MCEmptyGridController

- (instancetype)init {
    self = [super init];
    if (self) {
    }

    return self;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];

    [self createEmtpyFrame];
}

- (void)createEmtpyFrame {
    if (self.hasTopEmpty) {
        self.emptyDisplayView.frame = CGRectMake(0, 0, CGRectGetWidth(self.collectionView.frame), CGRectGetWidth(self.collectionView.frame));
    } else {
        self.emptyDisplayView.frame = CGRectMake(0, 0, CGRectGetWidth(self.collectionView.frame), CGRectGetHeight(self.collectionView.frame));
    }
}

- (void)removeEmptyView {
    [self.emptyDisplayView removeFromSuperview];
    self.emptyDisplayView = nil;
}

- (void)createEmptyView {
    if (!self.emptyDisplayView) {
        self.emptyDisplayView = [MCEmptyDisplayView new];
        self.emptyDisplayView.delegate = self;
        [self.collectionView addSubview:self.emptyDisplayView];
    }

    [self createEmtpyFrame];
}

- (BOOL)hasData {
    NSInteger section = [self numberOfSectionsInCollectionView:self.collectionView];
    if (section == 0) {
        return NO;
    }

    for (NSInteger i = 0; i < section; ++i) {
        NSInteger itemsInSection = [self collectionView:self.collectionView numberOfItemsInSection:i];
        if (itemsInSection > 0) {
            return YES;
        }
    }

    return NO;
}

- (NSInteger)hasDataWithCount {
    NSInteger count = 0;
    NSInteger section = [self numberOfSectionsInCollectionView:self.collectionView];
    if (section > 0) {
        for (NSInteger i = 0; i < section; ++i) {
            count = count + [self collectionView:self.collectionView numberOfItemsInSection:i];
        }
    }

    return count;
}

- (void)changeStatus:(MCEmptyStatus)emptyStatus {
    if (emptyStatus == MCDataStatus) {
        [self removeEmptyView];
    } else {
        [self createEmptyView];

        self.emptyDisplayView.emptyStatus = emptyStatus;
    }
}

- (void)refresh {

}

- (void)stopRefresh {
    if ([self hasData]) {
        [self changeStatus:MCDataStatus];
    } else {
        [self refreshError];
    }

    [self reloadData];
}


- (void)pullRefresh {
    [self changeStatus:MCRefreshStatus];
    [self refresh];
}

- (void)refreshCount:(NSInteger)count {
    if (count > 0) {
        [self changeStatus:MCDataStatus];
    } else {
        [self changeStatus:MCNoDataStatus];
    }
}

- (void)refreshError {
//    if ([[ReachabilitySession share] isReachable]) {
//        [self changeStatus:MCErrorStatus];
//    } else {
//        [self changeStatus:MCNoNetworkStatus];
//    }
}

@end
