//
//  MCHUDView.m
//  Gym
//
//  Created by SunYuanYang on 15/12/24.
//  Copyright © 2015年 poholo Inc. All rights reserved.
//

#import "MCHUDView.h"

#import <MBProgressHUD/MBProgressHUD.h>

#import "AppDelegate.h"

static MBProgressHUD *hud;

@implementation MCHUDView

+ (void)show {
    if (hud) return;

    if (hud) {
        [[self class] dismiss];
    }
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    hud = [MBProgressHUD showHUDAddedTo:keyWindow animated:YES];
    hud.contentColor = [UIColor whiteColor];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.color = [UIColor colorWithWhite:0.0 alpha:0.8];
}

+ (void)showWithText:(NSString *)text {
    if (hud) return;

    if (hud) {
        [[self class] dismiss];
    }
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    hud = [MBProgressHUD showHUDAddedTo:keyWindow animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.label.textColor = [UIColor whiteColor];
    hud.label.text = text;
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.color = [UIColor blackColor];
}


+ (void)dismiss {
    [hud hideAnimated:YES];
    hud = nil;
}

+ (void)progress:(CGFloat)progress {
    if (hud) {
        [self dismiss];
    }
    hud.mode = MBProgressHUDModeDeterminateHorizontalBar;
    hud.progress = progress;
}
@end
