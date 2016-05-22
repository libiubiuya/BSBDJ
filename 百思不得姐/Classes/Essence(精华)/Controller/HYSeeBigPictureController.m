//
//  HYSeeBigPictureController.m
//  百思不得姐
//
//  Created by 李好一 on 16/5/22.
//  Copyright © 2016年 李好一. All rights reserved.
//

#import "HYSeeBigPictureController.h"
#import "HYTopicItem.h"

#import <UIImageView+WebCache.h>

@interface HYSeeBigPictureController ()<UIScrollViewDelegate>

/** scrollView */
@property (weak, nonatomic) UIScrollView *scrollView;
/** imageView */
@property (weak, nonatomic) UIImageView *imageView;

@end

@implementation HYSeeBigPictureController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置scrollView
    [self setUpScrollView];
    
    // 设置imageView
    [self setUpImageView];
}

- (void)setUpScrollView
{
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = self.view.bounds;
    scrollView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    [scrollView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(back)]];
    [self.view insertSubview:scrollView atIndex:0];
    self.scrollView = scrollView;
}

- (void)setUpImageView
{
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.width = HYScreenW;
    imageView.height = self.topicItem.height * imageView.width / self.topicItem.width;
    imageView.x = 0;
    if (imageView.height > HYScreenH) { // 图片高度 > 屏幕高度
        imageView.y = 0;
        self.scrollView.contentSize = CGSizeMake(0, imageView.height);
    } else {
        imageView.centerY = HYScreenH * 0.5;
    }
    
    // 下载大图片
    [imageView sd_setImageWithURL:[NSURL URLWithString:self.topicItem.image1] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
    }];
    
    [self.scrollView addSubview:imageView];
    self.imageView = imageView;
    
    // 设置最大缩放比例
    CGFloat scale = self.topicItem.width / imageView.width;
    if (scale > 1.0) {
        self.scrollView.maximumZoomScale = scale;
        self.scrollView.delegate = self;
    }
}

- (IBAction)back
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - <UIScrollViewDelegate>
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}

@end
