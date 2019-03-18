//
// Created by 赵江明 on 15/11/30.
// Copyright (c) 2015 SunYuanYang. All rights reserved.
//

#import "MCRefreshGifHeader.h"


@implementation MCRefreshGifHeader

- (void)prepare {
    [super prepare];

    self.backgroundColor = [UIColor clearColor];

    NSMutableArray *idelImages = [[NSMutableArray alloc] init];
    NSMutableArray *refreshImages = [[NSMutableArray alloc] init];

    for (NSInteger i = 0; i < 1; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"loading1_000%zd", i]];
        [idelImages addObject:image];
    }

    for (NSInteger i = 0; i < 9; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"loading1_000%zd", i]];
        [refreshImages addObject:image];
    }

    // 设置普通状态的动画图片
    [self setImages:idelImages forState:MJRefreshStateIdle];

    // 设置正在刷新状态的动画图片
    [self setImages:refreshImages forState:MJRefreshStateRefreshing];

    self.stateLabel.hidden = YES;
    self.lastUpdatedTimeLabel.hidden = YES;
}

@end
