//
// Created by Jiangmingz on 2018/9/2.
// Copyright (c) 2018 poholo Inc. All rights reserved.
//

#import "NoPasteTextField.h"


@implementation NoPasteTextField

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    UIMenuController *menuController = [UIMenuController sharedMenuController];
    if (menuController) {
        [UIMenuController sharedMenuController].menuVisible = NO;
    }

    return NO;
}

@end
