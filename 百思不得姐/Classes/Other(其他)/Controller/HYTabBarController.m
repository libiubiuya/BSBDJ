//
//  HYTabBarController.m
//  百思不得姐
//
//  Created by 李好一 on 16/1/12.
//  Copyright © 2016年 李好一. All rights reserved.
//

#import "HYTabBarController.h"
#import "HYEssenceController.h"
#import "HYFriendTrendsController.h"
#import "HYNewController.h"
#import "HYMeController.h"


@interface HYTabBarController ()

@end

@implementation HYTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 添加对应的控制器
    [self addAllChildViewController];
    
    // tabBar的内容
    [self addTabBarButtonContent];
    
}

/**
 *  添加对应的控制器
 */
- (void)addAllChildViewController
{
    // 精华
    HYEssenceController *essence = [[HYEssenceController alloc] init];
    UINavigationController *navEssence = [[UINavigationController alloc] initWithRootViewController:essence];
    [self addChildViewController:navEssence];
    
    // 新帖
    HYNewController *new = [[HYNewController alloc] init];
    UINavigationController *navNew = [[UINavigationController alloc] initWithRootViewController:new];
    [self addChildViewController:navNew];
    
    // 关注
    HYFriendTrendsController *friendTrends = [[HYFriendTrendsController alloc] init];
    UINavigationController *navFriendTrends = [[UINavigationController alloc] initWithRootViewController:friendTrends];
    [self addChildViewController:navFriendTrends];
    
    // 我
    HYMeController *me = [[HYMeController alloc] init];
    UINavigationController *navMe = [[UINavigationController alloc] initWithRootViewController:me];
    [self addChildViewController:navMe];
    
}

/**
 *  tabBar的内容
 */
- (void)addTabBarButtonContent
{
    // 精华
    UIViewController *essence = self.childViewControllers[0];
    essence.tabBarItem.title = @"精华";
    essence.tabBarItem.image = [UIImage imageNamed:@"tabBar_essence_icon"];
    essence.tabBarItem.selectedImage = [UIImage imageNamed:@"tabBar_essence_click_icon"];
    
    // 新帖
    UIViewController *new = self.childViewControllers[1];
    new.tabBarItem.title = @"新帖";
    new.tabBarItem.image = [UIImage imageNamed:@"tabBar_new_icon"];
    new.tabBarItem.selectedImage = [UIImage imageNamed:@"tabBar_essence_click_icon"];
    
    // 关注
    UIViewController *friendTrends = self.childViewControllers[2];
    friendTrends.tabBarItem.title = @"关注";
    friendTrends.tabBarItem.image = [UIImage imageNamed:@"tabBar_friendTrends_icon"];
    friendTrends.tabBarItem.selectedImage = [UIImage imageNamed:@"tabBar_friendTrends_click_icon"];
    
    // 我
    UIViewController *me = self.childViewControllers[3];
    me.tabBarItem.title = @"我";
    me.tabBarItem.image = [UIImage imageNamed:@"tabBar_me_icon"];
    me.tabBarItem.selectedImage = [UIImage imageNamed:@"tabBar_me_click_icon"];
}


@end
