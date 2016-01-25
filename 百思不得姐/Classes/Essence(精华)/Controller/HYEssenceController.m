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
    self.navigationItem.title = @"百思不得姐";
    
    // 左边的barButtonItem
    UIBarButtonItem *leftBtnItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"comment-bar-keyboard"] highImage:[UIImage imageNamed:@"comment-bar-keyboard-click"] target:self action:@selector(btnClick)];
    self.navigationItem.leftBarButtonItem = leftBtnItem;
    
    // 右边的barButtonItem
    UIBarButtonItem *rightBtnItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"comment_bar_at_icon"] highImage:[UIImage imageNamed:@"comment_bar_at_icon_click"] target:self action:@selector(btnClick)];
    self.navigationItem.rightBarButtonItem = rightBtnItem;
}

- (void)btnClick
{
    NSLog(@"%s", __func__);
}

@end












