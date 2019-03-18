//
// Created by Jiangmingz on 2017/3/15.
// Copyright (c) 2017 poholo Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MCCollectionCell : UICollectionViewCell

@property(nonatomic, strong) NSIndexPath *indexPath;

+ (NSString *)identifier;

+ (CGSize)size;

@end
