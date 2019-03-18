//
// Created by Jiangmingz on 2017/3/15.
// Copyright (c) 2017 poholo Inc. All rights reserved.
//

#import "MCLabel.h"

@interface MCLabel ()

@property(nonatomic, strong) NSMutableParagraphStyle *style;

@end

@implementation MCLabel

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.lineSpace = 0.0f;
        self.style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
        self.style.alignment = self.textAlignment;
        self.style.lineBreakMode = self.lineBreakMode;
        self.style.lineSpacing = self.lineSpace;
    }
    return self;
}


- (void)setTextAlignment:(NSTextAlignment)textAlignment {
    [super setTextAlignment:textAlignment];
    self.style.alignment = self.textAlignment;
    [self setText:self.text];
}

- (void)setLineBreakMode:(NSLineBreakMode)lineBreakMode {
    [super setLineBreakMode:lineBreakMode];
    self.style.lineBreakMode = self.lineBreakMode;
    [self setText:self.text];
}

- (void)setLineSpace:(CGFloat)lineSpace {
    _lineSpace = lineSpace;
    self.style.lineSpacing = lineSpace;
    [self setText:self.text];
}

- (void)setText:(NSString *)text {
    if (_style && text && [text isKindOfClass:[NSString class]]) {
        NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:text];
        [attrStr addAttribute:NSParagraphStyleAttributeName value:_style range:NSMakeRange(0, attrStr.length)];
        [attrStr addAttribute:NSFontAttributeName value:self.font range:NSMakeRange(0, attrStr.length)];
        [attrStr addAttribute:NSForegroundColorAttributeName value:self.textColor range:NSMakeRange(0, attrStr.length)];

        self.attributedText = attrStr;
    } else {
        [super setText:text];
    }
}

- (void)setAttributedText:(NSAttributedString *)attributedText {
    [super setAttributedText:attributedText];
}

@end
