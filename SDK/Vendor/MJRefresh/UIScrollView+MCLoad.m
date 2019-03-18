//
//  UITableView+Refrelsh.m
//  TableReflesh
//
//  Created by xue on 15/4/20.
//  Copyright (c) 2015年 poholo. All rights reserved.
//

#import "UIScrollView+MCLoad.h"

#import <MJRefresh/MJRefreshBackNormalFooter.h>

#import "MCRefreshGifHeader.h"
#import "MCRefreshAutoFooter.h"

static char headerKey;
static char footerKey;

@interface UIScrollView ()


@end

@implementation UIScrollView (MCLoad)

@dynamic headerRefrelshing;
@dynamic footerRefrelshing;

- (void)setHeaderRefrelshing:(TableBeginRefrelshing)headerRefrelshing {
    objc_setAssociatedObject(self, &headerKey, headerRefrelshing, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (TableBeginRefrelshing)headerRefrelshing {
    TableBeginRefrelshing headerRefrelshing = objc_getAssociatedObject(self, &headerKey);
    return headerRefrelshing;
}

- (void)setFooterRefrelshing:(TableBeginRefrelshing)footerRefrelshing {
    objc_setAssociatedObject(self, &footerKey, footerRefrelshing, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (TableBeginRefrelshing)footerRefrelshing {
    TableBeginRefrelshing footerRefrelshing = objc_getAssociatedObject(self, &footerKey);
    return footerRefrelshing;
}

- (void)setHeaderStateInHeaderRefresh:(TableBeginRefrelshing)headerRefrelshing {
    self.headerRefrelshing = headerRefrelshing;
    MCRefreshGifHeader *gifHeader = [MCRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadHeaderData)];
    self.mj_header = gifHeader;
}

- (void)setFooterStateInFooterRefresh:(TableBeginRefrelshing)footerRefrelshing {
    self.footerRefrelshing = footerRefrelshing;
    MCRefreshAutoFooter *autoFooter = [MCRefreshAutoFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadFooterData)];
    self.mj_footer = autoFooter;
}

- (void)loadHeaderData {
    if (self.headerRefrelshing) {
        self.headerRefrelshing();
    }
}

- (void)loadFooterData {
    if (self.footerRefrelshing) {
        self.footerRefrelshing();
    }
}

- (void)stopAll {
    [self.mj_header endRefreshing];
    [self.mj_footer endRefreshing];
}

- (void)stopRefresh {
    [self.mj_header endRefreshing];
}

- (void)stopMore {
    [self.mj_footer endRefreshing];
}

- (void)removeHeader {
    [self hideHeader:YES];
}

- (void)hideHeader:(BOOL)hide {
    self.mj_header.hidden = hide;
}

- (void)removeFooter {
    [self hideFooter:YES];
}

- (void)hideFooter:(BOOL)hide {
    self.mj_footer.hidden = hide;
}

- (void)triggerPullToRefresh {
    [self.mj_header beginRefreshing];
}

@end
