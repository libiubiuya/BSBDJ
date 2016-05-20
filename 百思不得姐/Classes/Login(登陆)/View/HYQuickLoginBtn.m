//
//  HYQuickLoginBtn.m
//  百思不得姐
//
//  Created by 李好一 on 16/5/20.
//  Copyright © 2016年 李好一. All rights reserved.
//

#import "HYQuickLoginBtn.h"

@implementation HYQuickLoginBtn

- (void)awakeFromNib
{
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 设置图片位置
    self.imageView.y = 0;
    self.imageView.centerX = self.width * 0.5;
    
    // 设置文字位置
    self.titleLabel.x = 0;
    self.titleLabel.y = self.imageView.height;
    self.titleLabel.width = self.width;
    self.titleLabel.height = self.height - self.titleLabel.y;
}

@end
