//
// Created by 江明 赵 on 12/12/14.
// Copyright (c) 2014 江明 赵. All rights reserved.
//

#import "MCTableHeaderFooterView.h"

#import "MCColor.h"

@implementation MCTableHeaderFooterView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [MCColor colorV];
    }

    return self;
}

+ (NSString *)identifier {
    return NSStringFromClass([self class]);
}

+ (NSString *)reuseIdentifier {
    return NSStringFromClass([self class]);
}

+ (CGFloat)staticHeight {
    return 44.0f;
}

@end
