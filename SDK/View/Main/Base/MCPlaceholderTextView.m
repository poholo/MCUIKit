//
// Created by Jiangmingz on 2017/3/22.
// Copyright (c) 2017 poholo Inc. All rights reserved.
//

#import "MCPlaceholderTextView.h"

#import "UIScreen+MCExtend.h"

#define DefaultPlaceholderText @"说点什么吧"

@interface MCPlaceholderTextView ()

@property(nonatomic, strong) UILabel *pLabel;
@property(nonatomic, copy) NSString *pText;

@end

@implementation MCPlaceholderTextView

- (instancetype)initWithFrame:(CGRect)frame textContainer:(NSTextContainer *)textContainer {
    NSTextContainer *container = [[NSTextContainer alloc] initWithSize:CGSizeMake([UIScreen width], [UIScreen height])];
    container.widthTracksTextView = YES;
    container.heightTracksTextView = YES;
    self = [super initWithFrame:frame textContainer:textContainer];
    if (self) {
        self.minHeight = 34.0f;
        self.maxHeight = 50.0f;
        self.previousHeight = self.minHeight;
        self.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleTopMargin;
        self.returnKeyType = UIReturnKeySend;
        self.enablesReturnKeyAutomatically = YES; // UITextView内部判断send按钮是否可以用
        self.delegate = self;
        self.font = [UIFont systemFontOfSize:15];
        self.textColor = [UIColor colorWithWhite:1 alpha:0.5];
        self.contentInset = UIEdgeInsetsZero;
        self.showsVerticalScrollIndicator = NO;
        self.backgroundColor = [UIColor clearColor];

        self.pLabel = [UILabel new];
        self.pLabel.backgroundColor = [UIColor clearColor];
        self.pLabel.text = DefaultPlaceholderText;
        self.pLabel.font = [UIFont systemFontOfSize:14.0f];
        [self addSubview:self.pLabel];

//        [self placeholderCenterLayout];
    }

    return self;
}
//
//- (void)placeholderTopLayout {
//    [self.pLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self).offset(5);
//        make.left.equalTo(self).offset(5);
//        make.right.equalTo(self).offset(-5);
//        make.height.mas_equalTo(25.0f);
//    }];
//}
//
//- (void)placeholderCenterLayout {
//    [self.pLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self).offset(5);
//        make.left.equalTo(self).offset(5);
//        make.right.equalTo(self).offset(-5);
//        make.height.mas_equalTo(25.0f);
//    }];
//}

- (void)setText:(NSString *)text {
    [super setText:text];

    [self textDidChange];
}

- (void)changePFont:(UIFont *)pFont {
    self.pLabel.font = pFont;
}

- (void)changePColor:(UIColor *)pColor {
    self.pLabel.textColor = pColor;
}

- (void)changePText:(NSString *)pText {
    if (pText) {
        self.pText = [pText mutableCopy];
    } else {
        self.pText = DefaultPlaceholderText;
    }

    self.pLabel.text = _pText;
}

#pragma mark- UITextViewDelegate

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    return YES;
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
    [textView becomeFirstResponder];
    [self textViewDidChange:self.textInputView];
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    [textView resignFirstResponder];
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if ([text isEqualToString:@"\n"]) {
        if ([self.pTextViewDelegate respondsToSelector:@selector(mm_sendText:)]) {
            [self.pTextViewDelegate mm_sendText:textView.text];
            [self textViewDidChange:self.textInputView];
        }

        return NO;
    }

    return YES;
}

- (void)clearPlaceholder {
    self.pLabel.text = @"";
}

- (void)textDidChange {
    [self textViewDidChange:self.textInputView];
}

- (void)textViewDidChange:(UITextView *)textView {
    if (self.text.length == 0) {
        self.pLabel.text = self.pText;
    } else {
        self.pLabel.text = @"";
    }

    CGFloat height = [self getTextViewContentHeight:textView];
    if (height == self.previousHeight) {
        return;
    }

    if (height < self.minHeight) {
        return;
    }

    if (height > self.maxHeight) {
        return;
    }

    if ([self.pTextViewDelegate respondsToSelector:@selector(didChangeToolBarHight:)]) {
        [self.pTextViewDelegate didChangeToolBarHight:height];
    }

    self.previousHeight = height;
}

- (CGFloat)getTextViewContentHeight:(UITextView *)textView {
    return ceilf([textView sizeThatFits:textView.frame.size].height);
}

@end
