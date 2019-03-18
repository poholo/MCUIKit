//
// Created by Jiangmingz on 2017/3/22.
// Copyright (c) 2017 poholo Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@protocol MMPTextViewDelegate <NSObject>

@optional

- (void)mm_sendText:(NSString *)text;

- (void)didChangeToolBarHight:(CGFloat)duce;

@end

@interface MCPlaceholderTextView : UITextView <UITextFieldDelegate, UITextViewDelegate>

@property(nonatomic, assign) CGFloat previousHeight;
@property(nonatomic, assign) CGFloat minHeight;
@property(nonatomic, assign) CGFloat maxHeight;
@property(nonatomic, weak) id <MMPTextViewDelegate> pTextViewDelegate;

- (void)placeholderTopLayout;

- (void)changePFont:(UIFont *)pFont;

- (void)changePColor:(UIColor *)pColor;

- (void)changePText:(NSString *)pText;

- (void)textViewDidChange:(UITextView *)textView;

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView;

- (void)clearPlaceholder;

@end
