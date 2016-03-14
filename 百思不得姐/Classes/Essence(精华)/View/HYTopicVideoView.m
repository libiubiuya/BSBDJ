//
//  HYTopicVideoView.m
//  百思不得姐
//
//  Created by 李好一 on 16/3/9.
//  Copyright © 2016年 李好一. All rights reserved.
//

#import "HYTopicVideoView.h"
#import "HYTopicItem.h"

#import <UIImageView+WebCache.h>

@interface HYTopicVideoView ()

/** 背景图片 */
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
/** 播放次数 */
@property (weak, nonatomic) IBOutlet UILabel *playCountLabel;
/** 播放时长 */
@property (weak, nonatomic) IBOutlet UILabel *videoTimeLabel;

@end

@implementation HYTopicVideoView

- (void)setTopicItem:(HYTopicItem *)topicItem
{
    _topicItem = topicItem;
    
    // 背景
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:topicItem.image1]];
    
    // 播放数量
    if (topicItem.playcount >= 10000) {
        self.playCountLabel.text = [NSString stringWithFormat:@"%.1f万次播放", topicItem.playcount / 10000.0];
    } else {
        self.playCountLabel.text = [NSString stringWithFormat:@"%zd次播放", topicItem.playcount];
    }
    
    // 播放时长
    NSInteger minute = topicItem.videotime / 60;
    NSInteger second = topicItem.videotime % 60;
    self.videoTimeLabel.text = [NSString stringWithFormat:@"%02zd : %02zd", minute, second];
}

@end
