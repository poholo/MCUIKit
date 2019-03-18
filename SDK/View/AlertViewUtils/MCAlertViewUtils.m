//
// Created by 赵江明 on 15/12/30.
// Copyright (c) 2015 poholo Inc. All rights reserved.
//

#import "MCAlertViewUtils.h"
#import "MMPopupWindow.h"

@implementation MCAlertViewUtils

+ (MMAlertView *)showWithTitle:(NSString *)title detail:(NSString *)detail itemHandler:(MMPopupItemHandler)itemHandler {
    MMPopupItem *cancelItem = MMItemMake(@"取消", MMItemTypeNormal, itemHandler);
    MMPopupItem *doneItem = MMItemMake(@"确定", MMItemTypeHighlight, itemHandler);
    MMAlertView *alertView = [[MMAlertView alloc] initWithTitle:title
                                                         detail:detail
                                                          items:@[cancelItem, doneItem]];
    [MMPopupWindow sharedWindow].touchWildToHide = YES;

    [alertView show];
    return alertView;
}

+ (MMAlertView *)showWithTitle:(NSString *)title detail:(NSString *)detail {
    MMPopupItem *cancelItem = MMItemMake(@"知道了", MMItemTypeHighlight, nil);
    MMAlertView *alertView = [[MMAlertView alloc] initWithTitle:title
                                                         detail:detail
                                                          items:@[cancelItem]];
    [MMPopupWindow sharedWindow].touchWildToHide = YES;

    [alertView show];
    return alertView;
}

@end
