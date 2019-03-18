//
//  MClineCell.m
//  Gym
//
//  Created by 孙元洋 on 2017/3/17.
//  Copyright © 2017年 poholo Inc. All rights reserved.
//

#import "MClineCell.h"

//#import <Masonry.h>
//#import <ReactiveCocoa.h>

#import "MCColor.h"

@implementation MClineCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.lineView = [UIView new];
        self.lineView.backgroundColor = [MCColor colorIX];
        [self.contentView addSubview:self.lineView];
        
//        @weakify(self);
//        [self.lineView mas_makeConstraints:^(MASConstraintMaker *maker) {
//            @strongify(self);
//            maker.left.offset(16);
//            maker.right.equalTo(self.mas_right);
//            maker.top.equalTo(self.mas_bottom).offset(-0.4f);
//            maker.bottom.equalTo(self.mas_bottom);
//        }];
    }
    
    return self;
}


@end
