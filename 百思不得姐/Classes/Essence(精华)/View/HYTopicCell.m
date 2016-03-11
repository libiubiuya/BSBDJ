//
//  HYTopicCell.m
//  百思不得姐
//
//  Created by 李好一 on 16/3/4.
//  Copyright © 2016年 李好一. All rights reserved.
//

#import "HYTopicCell.h"
#import "HYTopicItem.h"
#import "HYTopicPictureView.h"
#import "HYTopicVideoView.h"
#import "HYTopicVoiceView.h"

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
/** 图片 */
@property (weak, nonatomic) HYTopicPictureView *pictureView;
/** 视频 */
@property (weak, nonatomic) HYTopicVideoView *videoView;
/** 声音 */
@property (weak, nonatomic) HYTopicVoiceView *voiceView;

@end

@implementation HYTopicCell

#pragma mark - 懒加载
- (HYTopicPictureView *)pictureView
{
    if (_pictureView == nil) {
        HYTopicPictureView *pictureView = [HYTopicPictureView HY_awakeFromNib];
        [self.contentView addSubview:pictureView];
        _pictureView = pictureView;
    }
    return _pictureView;
}

- (HYTopicVoiceView *)voiceView
{
    if (_voiceView == nil) {
        HYTopicVoiceView *voiceView = [HYTopicVoiceView HY_awakeFromNib];
        [self.contentView addSubview:voiceView];
        _voiceView = voiceView;
    }
    return _voiceView;
}

- (HYTopicVideoView *)videoView
{
    if (_videoView == nil) {
        HYTopicVideoView *videoView = [HYTopicVideoView HY_awakeFromNib];
        [self.contentView addSubview:videoView];
        _videoView = videoView;
    }
    return _videoView;
}

#pragma mark - 展示TopicItem内容

/**
 *  展示TopicItem内容
 *
 *  @param topicItem 帖子内容
 */
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
    [self.dingButton setTitle:topicItem.ding forState:UIControlStateNormal];
    [self.caiButton setTitle:topicItem.cai forState:UIControlStateNormal];
    [self.repostButton setTitle:topicItem.repost forState:UIControlStateNormal];
    [self.commentButton setTitle:topicItem.comment forState:UIControlStateNormal];
    
    // 中间
    if (topicItem.type == HYTopicTypeWord) { // 文字
        self.pictureView.hidden = YES;
        self.videoView.hidden = YES;
        self.voiceView.hidden = YES;
    } else if (topicItem.type == HYTopicTypeVideo) { // 视频
        self.pictureView.hidden = YES;
        self.videoView.hidden = NO;
        self.voiceView.hidden = YES;
    } else if (topicItem.type == HYTopicTypeVoice) { // 声音
        self.pictureView.hidden = YES;
        self.videoView.hidden = YES;
        self.voiceView.hidden = NO;
        self.voiceView.topicItem = topicItem;
    } else if (topicItem.type == HYTopicTypePicture) { // 图片
        self.pictureView.hidden = NO;
        self.videoView.hidden = YES;
        self.voiceView.hidden = YES;
    }
    
    // 最热评论
    if (topicItem.top_cmt.count) {
        self.topCmtView.hidden = NO;
        
        NSDictionary *cmt = topicItem.top_cmt.firstObject;
        NSString *username = cmt[@"user"][@"username"];
        NSString *content = cmt[@"content"];
        if (content.length == 0) { // 语音评论
            content = @"[语音评论]";
        }
        self.topCmtLabel.text = [NSString stringWithFormat:@"%@ : %@", username, content];
    } else {
        self.topCmtView.hidden = YES;
    }
}

- (void)setFrame:(CGRect)frame
{
    frame.size.height -= HYMargin;
    
    [super setFrame:frame];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (self.topicItem.type == HYTopicTypePicture) {
        self.pictureView.frame = self.topicItem.centerFrame;
    } else if (self.topicItem.type == HYTopicTypeVoice) {
        self.voiceView.frame = self.topicItem.centerFrame;
    } else if (self.topicItem.type == HYTopicTypeVideo) {
        self.videoView.frame = self.topicItem.centerFrame;
    }
}

@end
