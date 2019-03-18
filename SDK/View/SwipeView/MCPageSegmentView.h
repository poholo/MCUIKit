//
// Created by Jiangmingz on 2016/7/4.
// Copyright (c) 2016 poholo Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MCView.h"

@class MCSwipeView;
@class HMSegmentedControl;

@protocol PageSegmentViewDelegate <NSObject>

- (NSInteger)numberOfItems;

- (UIView *)viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view;

@end

@interface MCPageSegmentView : MCView

@property(nonatomic, weak) id <PageSegmentViewDelegate> delegate;

- (instancetype)initWithTitles:(NSArray *)titles;

- (NSInteger)currentItemIndex;

- (void)reloadData;

- (void)reloadItemAtIndex:(NSInteger)index;

- (void)scrollByOffset:(CGFloat)offset duration:(NSTimeInterval)duration;

- (void)scrollToOffset:(CGFloat)offset duration:(NSTimeInterval)duration;

- (void)scrollByNumberOfItems:(NSInteger)itemCount duration:(NSTimeInterval)duration;

- (void)scrollToItemAtIndex:(NSInteger)index duration:(NSTimeInterval)duration;

- (void)scrollToPage:(NSInteger)page duration:(NSTimeInterval)duration;

@end
