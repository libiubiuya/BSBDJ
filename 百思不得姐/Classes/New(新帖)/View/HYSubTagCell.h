//
//  HYSubTagCell.h
//  百思不得姐
//
//  Created by 李好一 on 16/2/23.
//  Copyright © 2016年 李好一. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HYSubTagItem;
@interface HYSubTagCell : UITableViewCell

/** 订阅模型 */
@property (nonatomic, strong) HYSubTagItem *item;

+ (instancetype)subTagCell;

@end
