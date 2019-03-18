//
//  MCTapCollectionCell.m
//  Bull
//
//  Created by 孙元洋 on 2018/7/18.
//  Copyright © 2018年 poholo Inc. All rights reserved.
//

#import "MCTapCollectionCell.h"

@implementation MCTapCollectionCell

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickCell)];
        [self.contentView addGestureRecognizer:tapGestureRecognizer];
    }

    return self;
}

- (void)clickCell {

}


@end
