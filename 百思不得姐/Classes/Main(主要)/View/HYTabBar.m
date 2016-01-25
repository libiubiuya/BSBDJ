//
//  HYTabBar.m
//  百思不得姐
//
//  Created by 李好一 on 16/1/25.
//  Copyright © 2016年 李好一. All rights reserved.
//

#import "HYTabBar.h"

@interface HYTabBar ()

/** 发布按钮 */
@property (weak, nonatomic) UIButton *publishBtn;

@end

@implementation HYTabBar

- (UIButton *)publishBtn
{
    if (_publishBtn == nil) {
        UIButton *publishBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [publishBtn setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [publishBtn setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        
        _publishBtn = publishBtn;
        [self addSubview:publishBtn];
    }
    return _publishBtn;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    NSInteger count = self.items.count + 1;
    
    CGFloat btnW = self.bounds.size.width / count;
    CGFloat btnH = self.bounds.size.height;
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    
    int i = 0;
    for (UIView *tabButton in self.subviews) {
        if ([tabButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            if (i == 2) {
                i += 1;
            }
            
            btnX = i * btnW;
            tabButton.frame = CGRectMake(btnX, btnY, btnW, btnH);
            i++;
        }
    }
    
    // 设置发布按钮的位置
    self.publishBtn.frame = CGRectMake(2 * btnW, btnY, btnW, btnH);
}

@end
