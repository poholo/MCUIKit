//
// Created by Jiangmingz on 2017/7/5.
// Copyright (c) 2017 poholo Inc. All rights reserved.
//

#import "MCProgressHUDView.h"

#import "MBProgressHUD.h"

#import "AppDelegate.h"

static MBProgressHUD *progressHUD;

@implementation MCProgressHUDView

+ (void)showOnView:(UIView *)view {
    progressHUD = [MBProgressHUD showHUDAddedTo:view animated:YES];
    progressHUD.contentColor = [UIColor whiteColor];
    progressHUD.mode = MBProgressHUDModeAnnularDeterminate;
    progressHUD.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    progressHUD.bezelView.color = [UIColor colorWithWhite:0.0 alpha:0.8];
    progressHUD.label.text = @"0%";
}

+ (void)showIndeterminate {
    if (progressHUD) {
        return;
    }
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    progressHUD = [MBProgressHUD showHUDAddedTo:keyWindow animated:YES];
    progressHUD.contentColor = [UIColor whiteColor];
    progressHUD.mode = MBProgressHUDModeIndeterminate;
    progressHUD.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    progressHUD.bezelView.color = [UIColor colorWithWhite:0.0 alpha:0.8];
    progressHUD.label.text = @"0%";
    
}

+ (void)show {
    if (progressHUD) {
        return;
    }
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    [[self class] showOnView:keyWindow];
}

+ (void)text:(NSString *)text {
    progressHUD.label.text = text;
}

+ (void)progress:(CGFloat)progress {
    if (progressHUD.progress == 0.0f && progress > 0.99) {
        return;
    }

    progressHUD.label.text = [NSString stringWithFormat:@"%zd%%", (NSInteger) (progress * 100)];
    [progressHUD setProgress:progress];
}

+ (void)dismiss {
    [progressHUD hideAnimated:YES];
    progressHUD = nil;
}

@end
