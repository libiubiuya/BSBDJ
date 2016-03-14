//
//  HYTopicPictureView.m
//  百思不得姐
//
//  Created by 李好一 on 16/3/9.
//  Copyright © 2016年 李好一. All rights reserved.
//

#import "HYTopicPictureView.h"
#import "HYTopicItem.h"

#import <UIImageView+WebCache.h>

@interface HYTopicPictureView ()

/** 背景图片 */
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
/** 点击查看大图按钮 */
@property (weak, nonatomic) IBOutlet UIButton *seeBigPictureButton;
/** GIF图片 */
@property (weak, nonatomic) IBOutlet UIImageView *gifView;

@end

@implementation HYTopicPictureView

- (void)setTopicItem:(HYTopicItem *)topicItem
{
    _topicItem = topicItem;
    
    // 设置背景图片
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:topicItem.image1]];
    
    // gif
    self.gifView.hidden = !topicItem.is_gif;
    
    // 查看大图按钮
    if (topicItem.isBigPicture) {
        if (topicItem.is_gif) {
            self.seeBigPictureButton.hidden = YES;
            self.imageView.contentMode = UIViewContentModeScaleAspectFit;
            self.imageView.clipsToBounds = NO;
        } else {
            self.seeBigPictureButton.hidden = NO;
            self.imageView.contentMode = UIViewContentModeTop;
            self.imageView.clipsToBounds = YES;
        }
    } else {
        self.seeBigPictureButton.hidden = YES;
        self.imageView.contentMode = UIViewContentModeScaleToFill;
        self.imageView.clipsToBounds = NO;
    }
    
}

@end
