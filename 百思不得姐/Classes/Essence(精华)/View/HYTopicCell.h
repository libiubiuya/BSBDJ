//
//  HYTopicCell.h
//  百思不得姐
//
//  Created by 李好一 on 16/3/4.
//  Copyright © 2016年 李好一. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HYTopicItem;

@interface HYTopicCell : UITableViewCell

/** 帖子模型 */
@property (nonatomic, strong) HYTopicItem *topicItem;

@end
