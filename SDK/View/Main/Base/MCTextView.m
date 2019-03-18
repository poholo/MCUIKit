//
// Created by Jiangmingz on 2017/3/15.
// Copyright (c) 2017 poholo Inc. All rights reserved.
//

#import "MCTextView.h"

@interface MCTextView ()

@property(nonatomic, strong) UILabel *placeholderLabel;

@end

@implementation MCTextView

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)initialize {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshPlaceholder) name:UITextViewTextDidChangeNotification object:self];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self initialize];
}

- (void)refreshPlaceholder {
    if ([[self text] length]) {
        [_placeholderLabel setAlpha:0];
    } else {
        [_placeholderLabel setAlpha:1];
    }

    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (void)setText:(NSString *)text {
    [super setText:text];
    [self refreshPlaceholder];
}

- (void)setFont:(UIFont *)font {
    [super setFont:font];
    _placeholderLabel.font = self.font;

    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (void)layoutSubviews {
    [super layoutSubviews];

    [_placeholderLabel sizeToFit];
    _placeholderLabel.frame = CGRectMake(8, 8, CGRectGetWidth(self.frame) - 16, CGRectGetHeight(_placeholderLabel.frame));
}

- (void)setPlaceholder:(NSString *)placeholder {
    _placeholder = placeholder;
    _placeholderLabel.text = self.placeholder;
    [self addSubview:_placeholderLabel];
    [self refreshPlaceholder];
}

- (UILabel *)placeholderLabel {
    if (!_placeholderLabel) {
        _placeholderLabel = [UILabel new];
        _placeholderLabel.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
        _placeholderLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _placeholderLabel.numberOfLines = 0;
        _placeholderLabel.font = self.font;
        _placeholderLabel.backgroundColor = [UIColor clearColor];
        _placeholderLabel.textColor = [UIColor lightTextColor];
        _placeholderLabel.alpha = 0;
    }

    return _placeholderLabel;
}

@end
