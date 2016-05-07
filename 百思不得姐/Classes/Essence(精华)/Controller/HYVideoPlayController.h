//
//  HYVideoPlayController.h
//  百思不得姐
//
//  Created by 李好一 on 16/5/1.
//  Copyright © 2016年 李好一. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@class HYTopicItem;
@interface HYVideoPlayController : UIViewController

/** 视频播放器 */
@property (nonatomic, strong) MPMoviePlayerViewController *videoPlayer;

/** 帖子模型 */
@property (nonatomic, strong) HYTopicItem *topicItem;

@end
