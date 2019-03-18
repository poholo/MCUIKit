//
// Created by Jiangmingz on 2017/3/16.
// Copyright (c) 2017 poholo Inc. All rights reserved.
//

#import "MCTapCell.h"


@implementation MCTapCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickCell)];
        [self.contentView addGestureRecognizer:tapGestureRecognizer];
    }

    return self;
}

- (void)clickCell {

}

@end