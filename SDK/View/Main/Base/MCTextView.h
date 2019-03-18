//
// Created by Jiangmingz on 2017/3/15.
// Copyright (c) 2017 poholo Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@interface MCTextView : UITextView

@property(nonatomic, strong, readonly) UILabel *placeholderLabel;
@property(nonatomic, copy) NSString *placeholder;

@end
