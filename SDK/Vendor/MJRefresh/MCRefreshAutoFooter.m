//
// Created by Jiangmingz on 16/1/27.
// Copyright (c) 2016 SunYuanYang. All rights reserved.
//

#import "MCRefreshAutoFooter.h"

#import "SDiOSVersion.h"

@interface MCRefreshAutoFooter ()

@property(weak, nonatomic) UIActivityIndicatorView *loadingView;

@end

@implementation MCRefreshAutoFooter

#pragma makr - 重写父类的方法

- (void)prepare {
    [super prepare];

    self.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhite;

    // 隐藏刷新状态的文字
    self.automaticallyRefresh = YES;
    self.automaticallyHidden = YES;
    self.refreshingTitleHidden = YES;
    self.stateLabel.hidden = YES;
    if ([SDiOSVersion deviceSize] != Screen3Dot5inch) {
        self.triggerAutomaticallyRefreshPercent = -6.0f;
    }
    self.backgroundColor = [UIColor clearColor];
}

#pragma mark - 懒加载子控件

- (UIActivityIndicatorView *)loadingView {
    if (!_loadingView) {
        UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:self.activityIndicatorViewStyle];
        loadingView.color = [UIColor grayColor];
        loadingView.hidesWhenStopped = YES;
        [self addSubview:_loadingView = loadingView];
    }

    return _loadingView;
}

- (void)setActivityIndicatorViewStyle:(UIActivityIndicatorViewStyle)activityIndicatorViewStyle {
    _activityIndicatorViewStyle = activityIndicatorViewStyle;

    self.loadingView = nil;
    [self setNeedsLayout];
}


- (void)placeSubviews {
    [super placeSubviews];

    if (self.loadingView.constraints.count) return;
    
    CGFloat loadingCenterX = self.mj_w * 0.5f;
    CGFloat loadingCenterY = self.mj_h * 0.5f;
    if (!self.hidden) {
        // 圈圈
        if (!self.isRefreshingTitleHidden) {
            loadingCenterX -= 100.0f;
        }
    }
    self.loadingView.center = CGPointMake(loadingCenterX, loadingCenterY);
}

- (void)setState:(MJRefreshState)state {
    MJRefreshCheckState

    // 根据状态做事情
    if (state == MJRefreshStateNoMoreData || state == MJRefreshStateIdle) {
        [self.loadingView stopAnimating];
    } else if (state == MJRefreshStateRefreshing) {
        [self.loadingView startAnimating];
    }
}

@end
