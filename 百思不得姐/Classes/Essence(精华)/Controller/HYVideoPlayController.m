//
//  HYVideoPlayController.m
//  百思不得姐
//
//  Created by 李好一 on 16/5/9.
//  Copyright © 2016年 李好一. All rights reserved.
//

#import "HYVideoPlayController.h"
#import "HYTopicItem.h"

#import <AVFoundation/AVFoundation.h>

@interface HYVideoPlayController ()

/** 播放器 */
@property (nonatomic ,strong) AVPlayer *player;
/** 图层 */
@property (nonatomic, weak) AVPlayerLayer *layer;
/** 关闭按钮 */
@property (weak, nonatomic) IBOutlet UIButton *closeBtn;
/** 播放或暂停按钮 */
@property (weak, nonatomic) IBOutlet UIButton *playOrPauseBtn;

@end

@implementation HYVideoPlayController

- (AVPlayerLayer *)layer
{
    if(!_layer)
    {
        NSURL *url = [NSURL URLWithString:_topicItem.videouri];
        self.player = [[AVPlayer alloc] initWithURL:url];
        _layer = [AVPlayerLayer playerLayerWithPlayer:self.player];
    }
    return _layer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    [self.view.layer addSublayer:self.layer];
}

/**
 *  开始播放
 *
 *  @param touches 点击
 *  @param event   开始播放视频
 */
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.player play];
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.closeBtn.frame = CGRectMake(HYBtnMarginX, HYBtnMarginX, HYBtnWH, HYBtnWH);
    self.playOrPauseBtn.frame = CGRectMake(HYBtnMarginX, HYScreenH - HYBtnMarginX - HYBtnWH, HYBtnWH, HYBtnWH);
    self.layer.frame = self.view.bounds;
}

- (IBAction)playOrPause
{
    self.playOrPauseBtn.selected = !self.playOrPauseBtn.selected;
    if (self.playOrPauseBtn.selected) {
        [self.player play];
    }else{
        [self.player pause];
    }
}

- (IBAction)back
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end