//
//  HYHeader.m
//  百思不得姐
//
//  Created by 李好一 on 16/3/3.
//  Copyright © 2016年 李好一. All rights reserved.
//

#import "HYHeader.h"

@interface HYHeader ()

/** logo */
@property (weak, nonatomic) UIImageView *logo;

@end

@implementation HYHeader

// 初始化
- (void)prepare
{
    [super prepare];
    
    self.automaticallyChangeAlpha = YES;
    self.stateLabel.textColor = [UIColor blueColor];
    self.lastUpdatedTimeLabel.hidden = NO;
    
    UIImageView *logo = [[UIImageView alloc] init];
    logo.contentMode = UIViewContentModeCenter;
    logo.image = [UIImage imageNamed:@"MainTitle"];
    [self addSubview:logo];
    self.logo = logo;
}

// 重新布局
- (void)placeSubviews
{
    [super placeSubviews];
    
    self.logo.frame = CGRectMake(0, -60, self.width, 60);
}

@end
