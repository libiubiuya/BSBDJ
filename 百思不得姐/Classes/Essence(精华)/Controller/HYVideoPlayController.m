//
//  HYVideoPlayController.m
//  百思不得姐
//
//  Created by 李好一 on 16/5/1.
//  Copyright © 2016年 李好一. All rights reserved.
//

#import "HYVideoPlayController.h"
#import "HYTopicItem.h"



@interface HYVideoPlayController ()



@end

@implementation HYVideoPlayController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    // 视频播放
    [self setUpVideoPlay];
}

- (void)setUpVideoPlay
{
    NSURL *url = [NSURL URLWithString:_topicItem.videouri];
    self.videoPlayer = [[MPMoviePlayerViewController alloc] initWithContentURL:url];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (self.presentedViewController) {
        return;
    }
    [self presentViewController:self.videoPlayer animated:YES completion:^{
        
        [self.videoPlayer.moviePlayer play];
    }];
}

@end
