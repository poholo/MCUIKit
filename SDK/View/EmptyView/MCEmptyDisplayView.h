//
// Created by Jiangmingz on 2017/3/15.
// Copyright (c) 2017 poholo Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MCView.h"
#import "MCEmptyDisplayNodeDelegate.h"

@class MCLabel;
@class MCButton;
@class MCImageView;

@interface MCEmptyDisplayView : MCView

@property(nonatomic, weak) id <MCEmptyDisplayNodeDelegate> delegate;
@property(nonatomic, assign) MCEmptyStatus emptyStatus;

@property(nonatomic, strong, readonly) MCButton *button;
@property(nonatomic, strong, readonly) MCImageView *imageView;
@property(nonatomic, strong, readonly) MCLabel *label;

@end
