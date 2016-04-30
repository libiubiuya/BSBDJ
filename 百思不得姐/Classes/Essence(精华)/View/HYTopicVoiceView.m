//
//  HYTopicVoiceView.m
//  百思不得姐
//
//  Created by 李好一 on 16/3/9.
//  Copyright © 2016年 李好一. All rights reserved.
//

#import "HYTopicVoiceView.h"

#import "HYTopicItem.h"

#import <UIImageView+WebCache.h>

#import <AVFoundation/AVFoundation.h>

@interface HYTopicVoiceView ()

/** 声音背景图片 */
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
/** 播放次数 */
@property (weak, nonatomic) IBOutlet UILabel *playCountLabel;
/** 播放时长 */
@property (weak, nonatomic) IBOutlet UILabel *voiceTimeLabel;
/** 音频播放器 */
@property (nonatomic, strong) AVPlayer *player;
/** 音乐播放器item */
@property (nonatomic, strong) AVPlayerItem *item;

@end

@implementation HYTopicVoiceView

- (void)setTopicItem:(HYTopicItem *)topicItem
{
    _topicItem = topicItem;
    
    // 播放的背景图
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:topicItem.image1]];
    
    // 播放数量
    if (topicItem.playcount >= 10000) {
        self.playCountLabel.text = [NSString stringWithFormat:@"%.1f万播放", topicItem.playcount / 10000.0];
    } else {
        self.playCountLabel.text = [NSString stringWithFormat:@"%zd播放", topicItem.playcount];
    }
    
    // 播放时长
    NSInteger minute = topicItem.voicetime / 60;
    NSInteger second = topicItem.voicetime % 60;
    self.voiceTimeLabel.text = [NSString stringWithFormat:@"%02zd : %02zd", minute, second];
    
    // 播放音频
    if (topicItem.voiceuri != nil) {
        NSURL *url = [NSURL URLWithString:topicItem.voiceuri];
        AVPlayerItem *item = [AVPlayerItem playerItemWithURL:url];
        self.player = [[AVPlayer alloc] initWithPlayerItem:item];
        _item = item;
    }
    
}

/**
 *  播放和暂停
 *
 *  @param sender 播放和暂停的按钮
 */
- (IBAction)playOrPause:(UIButton *)sender
{
    sender.selected = !sender.selected;
    if (sender.selected) {
        [self.player play];
    }else{
        [self.player pause];
    }
}

@end
