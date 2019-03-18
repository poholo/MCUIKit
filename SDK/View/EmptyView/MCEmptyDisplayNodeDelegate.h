//
// Created by Jiangmingz on 2017/3/15.
// Copyright (c) 2017 poholo Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, MCEmptyStatus) {
    MCRefreshStatus,
    MCNoDataStatus,
    MCNoNetworkStatus,
    MCErrorStatus,
    MCDataStatus,
};

@protocol MCEmptyDisplayNodeDelegate <NSObject>

- (void)refresh;

@optional

- (NSAttributedString *)displayNoDataAttributedText;

- (NSString *)displayNoDataText;

- (UIImage *)displayButtonImage;

- (BOOL)canShowActionBtn;

- (void)displayButtonAction;

@end
