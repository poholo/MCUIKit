//
// Created by Jiangmingz on 2017/3/15.
// Copyright (c) 2017 poholo Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@interface MCController : UIViewController

@property(nonatomic, copy) NSString *uuid;
@property(nonatomic, copy) NSString *time;
@property(nonatomic, copy) NSString *referId;
@property(nonatomic, copy) NSString *sourceId;

+ (NSString *)identifier;

- (instancetype)initWithRouterParams:(NSDictionary *)params;

- (void)disappearView;

- (void)viewLoading;

@end
