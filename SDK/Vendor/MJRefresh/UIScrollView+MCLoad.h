//
//  UITableView+Refrelsh.h
//  TableReflesh
//
//  Created by xue on 15/4/20.
//  Copyright (c) 2015年 poholo. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void (^TableBeginRefrelshing)(void);

@interface UIScrollView (MCLoad)

@property(nonatomic, copy) TableBeginRefrelshing headerRefrelshing;
@property(nonatomic, copy) TableBeginRefrelshing footerRefrelshing;

- (void)setHeaderStateInHeaderRefresh:(TableBeginRefrelshing)headerRefrelshing;

- (void)setFooterStateInFooterRefresh:(TableBeginRefrelshing)footerRefrelshing;

- (void)triggerPullToRefresh;

- (void)stopAll;

- (void)stopRefresh;

- (void)stopMore;

- (void)removeHeader;

- (void)removeFooter;

- (void)hideFooter:(BOOL)hide;

- (void)hideHeader:(BOOL)hide;

@end
