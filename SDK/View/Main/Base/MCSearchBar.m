//
//  MCSearchBar.m
//  WaQuGame
//
//  Created by gdb-work on 2017/6/9.
//  Copyright © 2017年 poholo Inc. All rights reserved.
//

#import "MCSearchBar.h"

#import "MCColor.h"
#import "UIImage+MCCreate.h"
#import "UIView+Extend.h"
#import "UIView+MCCorner.h"

@interface MCSearchBar ()
@property (nonatomic, assign) BOOL white;
@end

@implementation MCSearchBar

- (instancetype)init {
    self = [super init];
    if (self) {

    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame White:(BOOL)white {
    self = [super initWithFrame:frame];
    if (self) {
        self.white = white;
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    [self setImage:[UIImage imageNamed:@"search_gray"] forSearchBarIcon:UISearchBarIconSearch state:UIControlStateNormal];
    UIView *backgroundView = [self subViewOfClassName:@"_UISearchBarSearchFieldBackgroundView"];
    [backgroundView addCorner:(CGRectGetHeight(rect) - 17.0f) / 2.0f];
    UITextField *searchField=[self valueForKey:@"_searchField"];

    if (self.white) {
        searchField.backgroundColor = [MCColor colorII];
        self.backgroundImage = [UIImage imageWithColor:[MCColor colorI]];
    }else{
        searchField.backgroundColor = [MCColor colorVIII];
        searchField.textColor = [MCColor colorI];
        self.backgroundImage = [UIImage imageWithColor:[MCColor colorVII]];
    }


}

@end
