//
// Created by majiancheng on 2018/6/12.
// Copyright (c) 2018 poholo Inc. All rights reserved.
//

#import "UIView+MCLine.h"

#import <objc/runtime.h>
#import <Masonry.h>

#import "MCColor.h"


static char *kLineUITableViewCellKey = "kLineUITableViewCellKey";
static char *kTopLineUITableViewCellKey = "kTopLineUITableViewCellKey";

@implementation UIView (MCLine)

- (UIView *)lineView {
    return objc_getAssociatedObject(self, kLineUITableViewCellKey);
}

- (void)setLineView:(UIView *)lineView {
    objc_setAssociatedObject(self, kLineUITableViewCellKey, lineView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)topLineView {
    return objc_getAssociatedObject(self, kTopLineUITableViewCellKey);
}

- (void)setTopLineView:(UIView *)topLineView {
    objc_setAssociatedObject(self, kTopLineUITableViewCellKey, topLineView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)addLine {
    if (self.lineView == nil) {
        self.lineView = [[UIView alloc] init];
        [self addSubview:self.lineView];
        self.lineView.backgroundColor = [MCColor rgba:0xffffff1a];
    }
}

- (void)addTopline {
    if (self.topLineView == nil) {
        self.topLineView = [[UIView alloc] init];
        [self addSubview:self.topLineView];
        self.topLineView.backgroundColor = [MCColor rgba:0xffffff1a];
    }
}


- (void)addCustomTopLineHeight:(CGFloat)height {
    [self addCustomTopLineHeight:height edge:UIEdgeInsetsZero];
}

- (void)addBottomLineHieght:(CGFloat)height {
    [self addBottomLineHieght:height edge:UIEdgeInsetsZero];
}

- (void)addCustomTopLineHeight:(CGFloat)height edge:(UIEdgeInsets)edgeInsets {
    [self addTopline];

    [self.topLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(edgeInsets.top);
        make.left.equalTo(self.mas_left).offset(edgeInsets.left);
        make.right.equalTo(self.mas_right).offset(-edgeInsets.right);
        make.height.mas_equalTo(height);
    }];
}

- (void)addBottomLineHieght:(CGFloat)height edge:(UIEdgeInsets)edgeInsets {
    [self addLine];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(edgeInsets.left);
        make.right.equalTo(self.mas_right).offset(-edgeInsets.right);
        make.bottom.equalTo(self).offset(-edgeInsets.bottom);
        make.height.mas_equalTo(height);
    }];
}


@end
