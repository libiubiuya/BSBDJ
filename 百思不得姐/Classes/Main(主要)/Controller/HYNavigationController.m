//
//  HYNavigationController.m
//  百思不得姐
//
//  Created by 李好一 on 16/2/1.
//  Copyright © 2016年 李好一. All rights reserved.
//

#import "HYNavigationController.h"

@interface HYNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation HYNavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.interactivePopGestureRecognizer.delegate = self;
}

#pragma mark - 重写系统方法
// 设置导航条
+ (void)load
{
    // 获取全局导航条
    UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    
    NSMutableDictionary *attr = [NSMutableDictionary dictionary];
    attr[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20];
    [navBar setTitleTextAttributes:attr];
    
    [navBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
}

// 设置全局返回按钮
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count > 0) {
        UIBarButtonItem *backItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"navigationButtonReturn"] highImage:[UIImage imageNamed:@"navigationButtonReturnClick"] target:self action:@selector(back) norColor:[UIColor blackColor] highColor:[UIColor redColor] title:@"返回"];
        
        viewController.navigationItem.leftBarButtonItem = backItem;
    }
    
    [super pushViewController:viewController animated:animated];
}

// 返回
- (void)back
{
    [self popViewControllerAnimated:YES];
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    return self.childViewControllers.count > 1;
}

@end
