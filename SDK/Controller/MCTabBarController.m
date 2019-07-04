//
// Created by Jiangmingz on 2017/3/15.
// Copyright (c) 2017 poholo Inc. All rights reserved.
//

#import "MCTabBarController.h"

#import "MCNavController.h"

@implementation MCTabBarController

- (BOOL)shouldAutorotate {
    return [self.selectedViewController shouldAutorotate];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return [self.selectedViewController supportedInterfaceOrientations];;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return [self.selectedViewController preferredInterfaceOrientationForPresentation];;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self observeSelected];
    }

    return self;
}

- (void)observeSelected {
    //@weakify(self);
//    [RACObserve(self, selectedIndex) subscribeNext:^(NSNumber *number) {
//        @strongify(self);
//        if (!self.viewControllers) {
//            return;
//        }
//
//        NSInteger index = [number integerValue];
//        [[MMRoutable sharedRouter] setNavigationController:self.viewControllers[index]];
//        [AppDelegate share].currentNavController = (MCNavController *)self.viewControllers[index];
//    }];
//
//    [RACObserve(self, selectedViewController) subscribeNext:^(MCNavController *navController) {
//        @strongify(self);
//
//        if (!self.viewControllers) {
//            return;
//        }
//
//        [[MMRoutable sharedRouter] setNavigationController:navController];
//        [AppDelegate share].currentNavController = (MCNavController *)navController;
//    }];
}

@end
