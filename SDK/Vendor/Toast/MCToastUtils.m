//
// Created by Jiangmingz on 15/12/31.
// Copyright (c) 2015 GymChina inc. All rights reserved.
//


#import "MCToastUtils.h"

#import "UIView+MCToast.h"

#import "MMPopupWindow.h"

@implementation MCToastUtils

+ (UIView *)keyWindowView {
    UIView *attachView = [MMPopupWindow sharedWindow].attachView;
    if (![MMPopupWindow sharedWindow].hidden) {
        NSArray<__kindof UIView *> *subviews = [attachView subviews];
        if ([subviews count] > 0) {
            __kindof UIView *view = [subviews lastObject];
            if (!view.hidden && view.alpha > 0.0f) {
                return view;
            }
        }
    }

    UIWindow *window = [[UIApplication sharedApplication].windows firstObject];
    if (!window) {
        window = [UIApplication sharedApplication].keyWindow;
    }

    return window;
}

+ (void)showTitle:(NSString *)title {
    [[self keyWindowView] makeToast:title];
}

+ (void)showOnTabTopTitle:(NSString *)title {
    [[self keyWindowView] makeToast:title duration:2.0 position:CSToastPositionTabBottom];
}

+ (void)showTopTitle:(NSString *)title {
    [[self keyWindowView] makeToast:title duration:2.0 position:CSToastPositionTop];
}

+ (void)showCenterTitle:(NSString *)title {
    [[self keyWindowView] makeToast:title duration:2.0 position:CSToastPositionCenter];
}

+ (void)showGrayTop:(NSString *)title {
    UIView *toastView = [[self keyWindowView] makeToast:title duration:2.0 position:CSToastPositionTop];
    toastView.backgroundColor = [UIColor grayColor];
}

+ (void)showGrayCenter:(NSString *)title {
    UIView *toastView = [[self keyWindowView] makeToast:title duration:2.0 position:CSToastPositionCenter];
    toastView.backgroundColor = [UIColor grayColor];
}

@end
