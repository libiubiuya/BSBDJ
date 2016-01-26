//
//  HYNewController.m
//  百思不得姐
//
//  Created by 李好一 on 16/1/12.
//  Copyright © 2016年 李好一. All rights reserved.
//

#import "HYNewController.h"

@interface HYNewController ()

@end

@implementation HYNewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置导航栏内容
    [self setUpNavigationContent];
}

- (void)setUpNavigationContent
{
    UIBarButtonItem *leftItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"MainTagSubIcon"] selImage:[UIImage imageNamed:@"MainTagSubIconClick"] target:self action:@selector(btnClick)];
    self.navigationItem.leftBarButtonItem = leftItem;
}

- (void)btnClick
{
    NSLog(@"%s", __func__);
}

@end










