//
//  HYEssenceController.m
//  百思不得姐
//
//  Created by 李好一 on 16/1/12.
//  Copyright © 2016年 李好一. All rights reserved.
//

#import "HYEssenceController.h"

@interface HYEssenceController ()

@end

@implementation HYEssenceController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置导航栏内容
    [self setUpNavigationContent];
}

- (void)setUpNavigationContent
{
    // 左边的barButtonItem
    UIBarButtonItem *leftBtnItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"nav_item_game_icon"] highImage:[UIImage imageNamed:@"nav_item_game_click_icon"] target:self action:@selector(btnClick)];
    self.navigationItem.leftBarButtonItem = leftBtnItem;
    
    // 右边的barButtonItem
    UIBarButtonItem *rightBtnItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"navigationButtonRandom"] highImage:[UIImage imageNamed:@"navigationButtonRandomClick"] target:self action:@selector(btnClick)];
    self.navigationItem.rightBarButtonItem = rightBtnItem;
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    self.navigationItem.titleView = imageView;
}

- (void)btnClick
{
    NSLog(@"%s", __func__);
}

@end












