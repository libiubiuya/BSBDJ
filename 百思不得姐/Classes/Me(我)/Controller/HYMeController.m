//
//  HYMeController.m
//  百思不得姐
//
//  Created by 李好一 on 16/1/12.
//  Copyright © 2016年 李好一. All rights reserved.
//

#import "HYMeController.h"
#import "HYSettingController.h"

@interface HYMeController ()

@end

@implementation HYMeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blueColor];
    
    // 设置导航条
    [self setUpNavigationContent];
}

- (void)setUpNavigationContent
{
    UIBarButtonItem *settingItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"mine-setting-icon"] highImage:[UIImage imageNamed:@"mine-setting-icon-click"] target:self action:@selector(setting)];
    UIBarButtonItem *moonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"mine-moon-icon"] selImage:[UIImage imageNamed:@"mine-moon-icon-click"] target:self action:@selector(moon:)];
    self.navigationItem.rightBarButtonItems = @[settingItem, moonItem];
    
    self.navigationItem.title = @"我的";
}

// 设置界面
- (void)setting
{
    HYSettingController *setting = [[HYSettingController alloc] init];
    
    // 隐藏tabBar
    setting.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:setting animated:YES];
}

- (void)moon:(UIButton *)button
{
    button.selected = !button.selected;
}

@end
