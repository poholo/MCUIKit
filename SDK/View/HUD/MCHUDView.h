//
//  MCHUDView.h
//  Gym
//
//  Created by SunYuanYang on 15/12/24.
//  Copyright © 2015年 poholo Inc. All rights reserved.
//

@import UIKit;

@interface MCHUDView : NSObject

+ (void)show;

+ (void)showWithText:(NSString *)text;

+ (void)dismiss;

+ (void)progress:(CGFloat)progress;

@end
