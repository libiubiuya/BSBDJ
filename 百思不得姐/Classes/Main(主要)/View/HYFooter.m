//
//  HYFooter.m
//  百思不得姐
//
//  Created by 李好一 on 16/3/3.
//  Copyright © 2016年 李好一. All rights reserved.
//

#import "HYFooter.h"

@interface HYFooter ()

/** logo */
@property (weak, nonatomic) UIImageView *logo;

@end

@implementation HYFooter

// 初始化
- (void)prepare
{
    [super prepare];
    
    self.stateLabel.textColor = [UIColor yellowColor];
    
    UIImageView *logo = [[UIImageView alloc] init];
    logo.contentMode = UIViewContentModeCenter;
    logo.image = [UIImage imageNamed:@"MainTitle"];
    [self addSubview:logo];
    self.logo = logo;

//    self.automaticallyHidden = NO;
}

// 摆放子控件
- (void)placeSubviews
{
    [super placeSubviews];
    
    self.logo.frame = CGRectMake(0, self.height, self.width, 60);
}

@end
