//
// Created by majiancheng on 2019/5/20.
// Copyright (c) 2019 majiancheng. All rights reserved.
//

#import "ListDataVM.h"
#import "ActionDto.h"
#import "MCController.h"
#import "MCEmptyController.h"
#import "MCEmptyTableController.h"
#import "MCRefreshTableController.h"
#import "MCEmptyGridController.h"
#import "MCRefreshGridController.h"
#import "MCTabBarController.h"
#import "MCNavController.h"
#import "TestEmptyController.h"
#import "TestTableController.h"
#import "TestRefreshTableController.h"
#import "TestEmptyTableController.h"


@implementation ListDataVM

- (void)refresh {
    {
        ActionDto *dto = [ActionDto new];
        dto.name = @"MCController";
        dto.target = [MCController class];
        [self.dataList addObject:dto];
    }
    {
        ActionDto *dto = [ActionDto new];
        dto.name = @"TestEmptyController";
        dto.target = [TestEmptyController class];
        [self.dataList addObject:dto];
    }

    {
        ActionDto *dto = [ActionDto new];
        dto.name = @"MCTableController";
        dto.target = [TestTableController class];
        [self.dataList addObject:dto];
    }

    {
        ActionDto *dto = [ActionDto new];
        dto.name = @"MCEmptyTableController";
        dto.target = [TestEmptyTableController class];
        [self.dataList addObject:dto];
    }
    {
        ActionDto *dto = [ActionDto new];
        dto.name = @"MCRefreshTableController";
        dto.target = [TestRefreshTableController class];
        [self.dataList addObject:dto];
    }
    {
        ActionDto *dto = [ActionDto new];
        dto.name = @"MCGridController";
        dto.target = [MCGridController class];
        [self.dataList addObject:dto];
    }
    {
        ActionDto *dto = [ActionDto new];
        dto.name = @"MCEmptyGridController";
        dto.target = [MCEmptyGridController class];
        [self.dataList addObject:dto];
    }
    {
        ActionDto *dto = [ActionDto new];
        dto.name = @"MCRefreshGridController";
        dto.target = [MCRefreshGridController class];
        [self.dataList addObject:dto];
    }
    {
        ActionDto *dto = [ActionDto new];
        dto.name = @"MCTabBarController";
        dto.target = [MCTabBarController class];
        [self.dataList addObject:dto];
    }
    {
        ActionDto *dto = [ActionDto new];
        dto.name = @"MCNavController";
        dto.target = [MCNavController class];
        [self.dataList addObject:dto];
    }
    {
        ActionDto *dto = [ActionDto new];
        dto.name = @"MCWebController";
        dto.target = [MCController class];
        [self.dataList addObject:dto];
    }
}

- (NSMutableArray<ActionDto *> *)dataList {
    if (!_dataList) {
        _dataList = [NSMutableArray new];
    }
    return _dataList;
}

@end