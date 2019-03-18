//
// Created by 赵江明 on 15/12/30.
// Copyright (c) 2015 poholo Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MMPopupItem.h"
#import "MMAlertView.h"

@interface MCAlertViewUtils : NSObject

+ (MMAlertView *)showWithTitle:(NSString *)title detail:(NSString *)detail;

+ (MMAlertView *)showWithTitle:(NSString *)title detail:(NSString *)detail itemHandler:(MMPopupItemHandler)itemHandler;

@end
