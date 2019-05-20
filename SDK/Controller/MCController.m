//
// Created by Jiangmingz on 2017/3/15.
// Copyright (c) 2017 poholo Inc. All rights reserved.
//

#import "MCController.h"

#import "MCLog.h"

@implementation MCController

- (instancetype)initWithRouterParams:(NSDictionary *)params {
    self = [super init];
    if (self) {
        self.uuid = [[NSUUID UUID] UUIDString];
    }

    return self;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.uuid = [[NSUUID UUID] UUIDString];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    MCLog(@"%@ loaded", NSStringFromClass([self class]));
    self.view.backgroundColor = [UIColor whiteColor];
    [self viewLoading];

    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.extendedLayoutIncludesOpaqueBars = NO;
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)viewLoading {

}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];

    [self disappearView];
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (BOOL)prefersStatusBarHidden {
    return NO;
}

- (void)disappearView {

}

+ (NSString *)identifier {
    return NSStringFromClass([self class]);
}

- (void)dealloc {
    MCLog(@"%s", __func__);
}


- (BOOL)shouldAutorotate {
    return NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end
