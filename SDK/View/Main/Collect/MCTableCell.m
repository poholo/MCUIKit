//
// Created by Jiangmingz on 2017/3/15.
// Copyright (c) 2017 poholo Inc. All rights reserved.
//

#import "MCTableCell.h"

#import "MCColor.h"

@implementation MCTableCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.contentView.backgroundColor = [MCColor colorVIII];
    }
    return self;
}

+ (NSString *)identifier {
    return NSStringFromClass([self class]);
}

+ (CGFloat)height {
    return 44.0f;
}

@end
