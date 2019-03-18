//
//  MCEmptyDisplayView.m
//  Gym
//
//  Created by Jiangmingz on 2017/3/9.
//  Copyright © 2017年 poholo Inc. All rights reserved.
//

#import "MCEmptyDisplayView.h"
//
//#import <ReactiveCocoa/ReactiveCocoa.h>
#import <Masonry/Masonry.h>

#import "MCColor.h"
//#import "ReachabilitySession.h"
#import "MCLabel.h"
#import "MCButton.h"
#import "MCImageView.h"


@interface MCEmptyDisplayView ()

@property(nonatomic, strong) MCButton *button;
@property(nonatomic, strong) MCLabel *label;
@property(nonatomic, strong) MCImageView *imageView;
@property(nonatomic, strong) UIActivityIndicatorView *activityIndicator;

@end

@implementation MCEmptyDisplayView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setup];
    }

    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }

    return self;
}

- (void)setup {
    self.emptyStatus = -1;
    self.backgroundColor = [MCColor colorVII];
}

- (void)addLayout {
    if (self.emptyStatus == MCRefreshStatus) {
        [self.activityIndicator mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(100, 100));
        }];
    } else if (self.emptyStatus == MCNoNetworkStatus || self.emptyStatus == MCNoDataStatus || self.emptyStatus == MCErrorStatus) {
        if (self.imageView.image) {
            [self.imageView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(self);
                make.bottom.equalTo(self.label.mas_top).offset(-5.0f);
                make.size.mas_equalTo(self.imageView.image.size);
            }];

            [self.label mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(self.mas_centerY);
                make.left.equalTo(self.mas_left).offset(5);
                make.right.equalTo(self.mas_right).offset(-5);
            }];
        } else {
            [self.label mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(self.mas_centerY).offset(-60);
                make.left.equalTo(self.mas_left).offset(5);
                make.right.equalTo(self.mas_right).offset(-5);
            }];
        }


        [self.button mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.label.mas_bottom).offset(5);
            make.centerX.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(36.0f, 36.0f));
        }];
    }
}

- (void)setMCEmptyStatus:(MCEmptyStatus)emptyStatus {
//    if (![[ReachabilitySession share] isReachable]) {
//        emptyStatus = MCNoNetworkStatus;
//    }

    if (_emptyStatus == emptyStatus) {
        return;
    }

    [self removeAll];

    if (emptyStatus == MCDataStatus) {

        [self removeFromSuperview];
    } else {

        if (emptyStatus == MCRefreshStatus) {

            [self addSubview:self.activityIndicator];
            if (![self.activityIndicator isAnimating]) {
                [self.activityIndicator startAnimating];
            }
        } else {
            [self addSubview:self.imageView];
            [self addSubview:self.label];
            [self addSubview:self.button];
            self.button.hidden = YES;

//            WQAttributed *attributed = [WQAttributed new];
//            attributed.alignment = NSTextAlignmentCenter;
//            attributed.textColor = [MCColor colorII];
//            if (emptyStatus == MCNoNetworkStatus) {
//                self.button.hidden = NO;
//                NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:@"网络不给力哦" attributes:[attributed dictionary]];
//                self.label.attributedText = attributedString;
//            } else if (emptyStatus == MCNoDataStatus) {
//                NSAttributedString *attributedString = [self displayNoDataText];
//                self.label.attributedText = attributedString;
//                [self configActionBtn];
//                [self configImage];
//            } else if (emptyStatus == MCErrorStatus) {
//                self.button.hidden = NO;
//                NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:@"访问错误" attributes:[attributed dictionary]];
//                self.label.attributedText = attributedString;
//            }
        }

        _emptyStatus = emptyStatus;
        [self addLayout];
    }
}

- (void)removeAll {
    [self.label removeFromSuperview];
    [self.button removeFromSuperview];

    if ([self.activityIndicator isAnimating]) {
        [self.activityIndicator stopAnimating];
    }

    [self.activityIndicator removeFromSuperview];
}

- (MCLabel *)label {
    if (!_label) {
        _label = [MCLabel new];
        _label.numberOfLines = 0;
        _label.textAlignment = NSTextAlignmentCenter;
        _label.font = [UIFont systemFontOfSize:12.0f];
        _label.textColor = [MCColor colorI];
        _label.shadowOffset = CGSizeMake(.5, .5);
        _label.shadowColor = [MCColor colorIV];
    }

    return _label;
}

- (MCButton *)button {
    if (!_button) {
        _button = [MCButton new];
        [_button setImage:[self buttonImage] forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    }

    return _button;
}

- (MCImageView *)imageView {
    if (!_imageView) {
        _imageView = [MCImageView new];
    }
    return _imageView;
}

- (UIActivityIndicatorView *)activityIndicator {
    if (!_activityIndicator) {
        _activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        [_activityIndicator sizeToFit];
        return _activityIndicator;
    }

    return _activityIndicator;
}

- (UIImage *)buttonImage {
    UIImage *buttonImage;
    if ([self.delegate respondsToSelector:@selector(displayButtonImage)]) {
        buttonImage = [self.delegate displayButtonImage];
    } else {
        buttonImage = [UIImage imageNamed:@"ic_load_w"];
    }

    return buttonImage;
}

- (NSAttributedString *)displayNoDataText {
    NSAttributedString *displayText;
//    WQAttributed *attributed = [WQAttributed new];
//    attributed.alignment = NSTextAlignmentCenter;
//    attributed.textColor = [MCColor colorII];
//    if ([self.delegate respondsToSelector:@selector(displayNoDataAttributedText)]) {
//        displayText = [self.delegate displayNoDataAttributedText];
//    } else if ([self.delegate respondsToSelector:@selector(displayNoDataText)]) {
//        displayText = [[NSAttributedString alloc] initWithString:[self.delegate displayNoDataText] attributes:[attributed dictionary]];
//    } else {
//        displayText = [[NSAttributedString alloc] initWithString:@"暂无数据" attributes:[attributed dictionary]];
//    }
    return displayText;
}

- (void)configActionBtn {
    if ([self.delegate respondsToSelector:@selector(canShowActionBtn)]) {
        BOOL canShow = [self.delegate canShowActionBtn];
        self.button.hidden = !canShow;
    } else {
        self.button.hidden = YES;
    }
}

- (void)configImage {
    if ([self.delegate respondsToSelector:@selector(displayButtonImage)]) {
        self.imageView.image = [self.delegate displayButtonImage];
    }
}

- (void)buttonAction {
    if ([self.delegate respondsToSelector:@selector(displayButtonAction)]) {
        [self.delegate displayButtonAction];
    } else {
        [self refresh];
    }
}

- (void)refresh {
    self.emptyStatus = MCRefreshStatus;
    if ([self.delegate respondsToSelector:@selector(refresh)]) {
        [self.delegate refresh];

//        if (![[ReachabilitySession share] isReachable]) {
//            if (![self.activityIndicator isAnimating]) {
//                if (!self.activityIndicator.superview) {
//                    [self addSubview:self.activityIndicator];
//                }
//
//                @weakify(self);
//                [self.activityIndicator mas_remakeConstraints:^(MASConstraintMaker *make) {
//                    @strongify(self);
//                    make.center.equalTo(self);
//                    make.size.mas_equalTo(CGSizeMake(100, 100));
//                }];
//
//                [self.activityIndicator startAnimating];
//                self.label.hidden = YES;
//                self.button.hidden = YES;
//                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t) (0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//                    [self.activityIndicator stopAnimating];
//                    self.label.hidden = NO;
//                    self.button.hidden = NO;
//                });
//            }
//        }
    }
}

@end
