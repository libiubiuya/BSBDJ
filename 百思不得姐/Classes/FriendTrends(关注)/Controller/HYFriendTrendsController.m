//
//  HYFriendTrendsController.m
//  百思不得姐
//
//  Created by 李好一 on 16/1/12.
//  Copyright © 2016年 李好一. All rights reserved.
//

#import "HYFriendTrendsController.h"

@interface HYFriendTrendsController ()

@end

@implementation HYFriendTrendsController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置导航条
    [self setUpNavigationContent];
}

- (void)setUpNavigationContent
{
    UIBarButtonItem *leftItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"friendsRecommentIcon"] highImage:[UIImage imageNamed:@"friendsRecommentIcon-click"] target:self action:@selector(btnClick)];
    self.navigationItem.leftBarButtonItem = leftItem;
}

- (void)btnClick
{
    NSLog(@"%s" ,__func__);
}

@end
