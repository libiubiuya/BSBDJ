//
//  HYTopicCell.m
//  百思不得姐
//
//  Created by 李好一 on 16/3/4.
//  Copyright © 2016年 李好一. All rights reserved.
//

#import "HYTopicCell.h"
#import "HYTopicItem.h"
#import <UIImageView+WebCache.h>

@interface HYTopicCell ()

/** 头像 */
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
/** 昵称 */
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
/** 创建时间 */
@property (weak, nonatomic) IBOutlet UILabel *createdAtLabel;
/** 文本内容 */
@property (weak, nonatomic) IBOutlet UILabel *text_label;
/** 顶 */
@property (weak, nonatomic) IBOutlet UIButton *dingButton;
/** 踩 */
@property (weak, nonatomic) IBOutlet UIButton *caiButton;
/** 分享 */
@property (weak, nonatomic) IBOutlet UIButton *repostButton;
/** 评论 */
@property (weak, nonatomic) IBOutlet UIButton *commentButton;
/** 最热评论-整体 */
@property (weak, nonatomic) IBOutlet UIView *topCmtView;
/** 最热评论-文字内容 */
@property (weak, nonatomic) IBOutlet UILabel *topCmtLabel;

@end

@implementation HYTopicCell

- (void)setTopicItem:(HYTopicItem *)topicItem
{
    _topicItem = topicItem;
    
    // 占位图片
    UIImage *placeholder = [UIImage imageNamed:@"defaultUserIcon"];
    
    // 下载图片
    [self.profileImageView sd_setImageWithURL:[NSURL URLWithString:topicItem.profile_image] placeholderImage:placeholder completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (image == nil) return;
        
    }];
    
    self.nameLabel.text = topicItem.name;
    self.createdAtLabel.text = topicItem.created_at;
    self.text_label.text = topicItem.text;
    [self.dingButton setTitle:[NSString stringWithFormat:@"%zd", topicItem.ding] forState:UIControlStateNormal];
    [self.caiButton setTitle:[NSString stringWithFormat:@"%zd", topicItem.cai] forState:UIControlStateNormal];
    [self.repostButton setTitle:[NSString stringWithFormat:@"%zd", topicItem.repost] forState:UIControlStateNormal];
    [self.commentButton setTitle:[NSString stringWithFormat:@"%zd", topicItem.comment] forState:UIControlStateNormal];
}

- (void)setFrame:(CGRect)frame
{
    frame.size.height -= HYMargin;
    
    [super setFrame:frame];
}

@end
