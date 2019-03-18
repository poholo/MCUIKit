//
// Created by Jiangmingz on 2017/3/22.
// Copyright (c) 2017 poholo Inc. All rights reserved.
//

#import "MCController.h"

@class MCCollectionView;

@interface MCGridController : MCController <UICollectionViewDelegate, UICollectionViewDataSource>

@property(nonatomic, strong, readonly) MCCollectionView *collectionView;
@property(nonatomic, strong) UICollectionViewLayout *layout;
@property(nonatomic, assign) UIEdgeInsets edgeInsets;

- (void)reloadData;

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView;

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;

@end