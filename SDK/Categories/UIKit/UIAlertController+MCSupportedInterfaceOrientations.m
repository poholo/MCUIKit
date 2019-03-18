//
// Created by majiancheng on 2018/7/27.
// Copyright (c) 2018 poholo Inc. All rights reserved.
//

#import "UIAlertController+MCSupportedInterfaceOrientations.h"


@implementation UIAlertController (MCSupportedInterfaceOrientations)

#if __IPHONE_OS_VERSION_MAX_ALLOWED < 90000
- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

#else

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

#endif

@end