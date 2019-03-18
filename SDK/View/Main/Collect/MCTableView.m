//
// Created by Jiangmingz on 2017/3/16.
// Copyright (c) 2017 poholo Inc. All rights reserved.
//

#import "MCTableView.h"
#import "MCColor.h"

@implementation MCTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.backgroundColor = [MCColor colorVIII];
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return self;
}

@end