//
//  HYTabBar.h
//  百思不得姐
//
//  Created by 李好一 on 16/1/25.
//  Copyright © 2016年 李好一. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HYTopicItem;
@interface HYTabBar : UITabBar

/** 帖子模型 */
@property (nonatomic, strong) HYTopicItem *topicItem;

@end
