//
// Created by majiancheng on 2019/5/20.
// Copyright (c) 2019 majiancheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ActionDto;


@interface ListDataVM : NSObject

@property(nonatomic, assign) BOOL isRefresh;

@property(nonatomic, strong) NSMutableArray<ActionDto *> *dataList;

- (void)refresh;

@end