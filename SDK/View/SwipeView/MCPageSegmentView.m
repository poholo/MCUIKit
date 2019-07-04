//
// Created by Jiangmingz on 2016/7/4.
// Copyright (c) 2016 poholo Inc. All rights reserved.
//

#import "MCPageSegmentView.h"

#import <HMSegmentedControl/HMSegmentedControl.h>
#import <Masonry.h>

#import "MCSwipeView.h"

@interface MCPageSegmentView () <SwipeViewDelegate, SwipeViewDataSource>

@property(nonatomic, strong) MCSwipeView *swipeView;
@property(nonatomic, strong) MCView *liveView;
@property(nonatomic, strong) HMSegmentedControl *segmentedControl;

@end

@implementation MCPageSegmentView

- (instancetype)initWithTitles:(NSArray *)titles {
    self = [super init];
    if (self) {
        [self createPageSegmentViews:titles];
        [self createPageSegmentLayout];
    }

    return self;
}

- (void)createPageSegmentViews:(NSArray *)titles {
    self.swipeView = [MCSwipeView new];
    self.swipeView.alignment = SwipeViewAlignmentCenter;
    self.swipeView.pagingEnabled = YES;
    self.swipeView.itemsPerPage = 1;
    self.swipeView.truncateFinalPage = YES;
    self.swipeView.delegate = self;
    self.swipeView.dataSource = self;
    [self addSubview:self.swipeView];

    self.segmentedControl = [[HMSegmentedControl alloc] initWithSectionTitles:titles];
    self.segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationNone;
    self.segmentedControl.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor blackColor], NSFontAttributeName: [UIFont systemFontOfSize:18.0f]};
    self.segmentedControl.selectedTitleTextAttributes = @{NSForegroundColorAttributeName: [UIColor yellowColor], NSFontAttributeName: [UIFont systemFontOfSize:18.0f]};
    [self.segmentedControl addTarget:self action:@selector(changeValue) forControlEvents:UIControlEventValueChanged];
    self.segmentedControl.userInteractionEnabled = YES;
    [self addSubview:self.segmentedControl];

    self.liveView = [MCView new];
    self.liveView.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:self.liveView];
}

- (void)createPageSegmentLayout {
    [self.segmentedControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self);
        make.height.mas_equalTo(44.0f);
    }];
    [self.swipeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.segmentedControl.mas_bottom);
        make.bottom.left.right.equalTo(self);
    }];

    [self.liveView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.bottom.equalTo(self.segmentedControl.mas_bottom);
        make.height.mas_equalTo(0.5f);
    }];
}

- (void)changeValue {
    [self.swipeView scrollToItemAtIndex:self.segmentedControl.selectedSegmentIndex duration:0.2f];
}

- (NSInteger)numberOfItemsInSwipeView:(MCSwipeView *)swipeView {
    if ([self.delegate respondsToSelector:@selector(numberOfItems)]) {
        return [self.delegate numberOfItems];
    }

    return 0;
}

- (UIView *)swipeView:(MCSwipeView *)swipeView viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view {
    if ([self.delegate respondsToSelector:@selector(viewForItemAtIndex:reusingView:)]) {
        return [self.delegate viewForItemAtIndex:index reusingView:view];
    }

    return nil;
}

- (void)swipeViewDidScroll:(MCSwipeView *)swipeView {
    [self.segmentedControl setSelectedSegmentIndex:self.swipeView.currentItemIndex];
}

- (CGSize)swipeViewItemSizeXL:(MCSwipeView *)swipeView {
    return self.swipeView.bounds.size;
}

- (NSInteger)currentItemIndex {
    return self.swipeView.currentItemIndex;
}

- (void)reloadData {
    [self.swipeView reloadData];
}

- (void)reloadItemAtIndex:(NSInteger)index {
    [self.swipeView reloadItemAtIndex:index];
}

- (void)scrollByOffset:(CGFloat)offset duration:(NSTimeInterval)duration {
    [self.swipeView scrollByOffset:offset duration:duration];
}

- (void)scrollToOffset:(CGFloat)offset duration:(NSTimeInterval)duration {
    [self.swipeView scrollToOffset:offset duration:duration];
}

- (void)scrollByNumberOfItems:(NSInteger)itemCount duration:(NSTimeInterval)duration {
    [self.swipeView scrollByNumberOfItems:itemCount duration:duration];
}

- (void)scrollToItemAtIndex:(NSInteger)index duration:(NSTimeInterval)duration {
    [self.swipeView scrollToItemAtIndex:index duration:duration];
}

- (void)scrollToPage:(NSInteger)page duration:(NSTimeInterval)duration {
    [self.swipeView scrollToPage:page duration:duration];
}

@end
