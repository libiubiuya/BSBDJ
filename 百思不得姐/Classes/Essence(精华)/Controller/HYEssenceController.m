//
//  HYEssenceController.m
//  百思不得姐
//
//  Created by 李好一 on 16/1/12.
//  Copyright © 2016年 李好一. All rights reserved.
//

#import "HYEssenceController.h"

@interface HYEssenceController ()

/** 标题栏 */
@property (weak, nonatomic) UIView *titlesView;

@end

@implementation HYEssenceController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
    // 设置导航栏内容
    [self setUpNavigationContent];
    
    // 添加scrollView
    [self setUpScrollView];
    
    // 添加标题栏
    [self setUpTitlesView];
}

/**
 *  添加scrollView
 */
- (void)setUpScrollView
{
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = self.view.bounds;
    scrollView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:scrollView];
}

/**
 *  添加标题栏
 */
- (void)setUpTitlesView
{
    UIView *titlesView = [[UIView alloc] init];
    titlesView.frame = CGRectMake(0, HYNavMaxY, self.view.width, HYTitlesViewH);
    titlesView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
    [self.view addSubview:titlesView];
    self.titlesView = titlesView;
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












