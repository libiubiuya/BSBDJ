//
//  HYTabBarController.m
//  百思不得姐
//
//  Created by 李好一 on 16/1/12.
//  Copyright © 2016年 李好一. All rights reserved.
//

#import "HYTabBarController.h"
#import "HYNavigationController.h"
#import "HYEssenceController.h"
#import "HYFriendTrendsController.h"
#import "HYNewController.h"
#import "HYMeController.h"
#import "HYTabBar.h"

@interface HYTabBarController ()

@end

@implementation HYTabBarController

+ (void)load
{
    // 设置tabBar的字体属性
    UITabBarItem *item = [UITabBarItem appearance];
    
    // 正常状态
    NSMutableDictionary *itemNor = [NSMutableDictionary dictionary];
    itemNor[NSFontAttributeName] = HYTabBarItemFontSize
    itemNor[NSForegroundColorAttributeName] = [UIColor grayColor];
    [item setTitleTextAttributes:itemNor forState:UIControlStateNormal];
    
    // 选中状态
    NSMutableDictionary *itemSel = [NSMutableDictionary dictionary];
    itemSel[NSFontAttributeName] = HYTabBarItemFontSize
    itemSel[NSForegroundColorAttributeName] = HYTabBarItemFontColor
    [item setTitleTextAttributes:itemSel forState:UIControlStateSelected];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 添加对应的控制器
    [self addAllChildViewController];
    
    // tabBar的内容
    [self addTabBarButtonContent];
    
    // 添加tabBar
    HYTabBar *tabBar = [[HYTabBar alloc] init];
    [self setValue:tabBar forKeyPath:@"tabBar"];
    
}

/**
 *  添加对应的控制器
 */
- (void)addAllChildViewController
{
    // 精华
    HYEssenceController *essence = [[HYEssenceController alloc] init];
    [self addChildViewController:essence];
    
    // 新帖
    HYNewController *new = [[HYNewController alloc] init];
    [self addChildViewController:new];
    
    // 关注
    HYFriendTrendsController *friendTrends = [[HYFriendTrendsController alloc] init];
    [self addChildViewController:friendTrends];
    
    // 我
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:NSStringFromClass([HYMeController class]) bundle:nil];
    HYMeController *me = [storyboard instantiateInitialViewController];
    [self addChildViewController:me];
}

- (void)addChildViewController:(UIViewController *)childController
{
    HYNavigationController *navCon = [[HYNavigationController alloc] initWithRootViewController:childController];
    [super addChildViewController:navCon];
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
    essence.tabBarItem.selectedImage = [UIImage imageNamedWithOriginalImage:@"tabBar_essence_click_icon"];
    
    // 新帖
    UIViewController *new = self.childViewControllers[1];
    new.tabBarItem.title = @"新帖";
    new.tabBarItem.image = [UIImage imageNamed:@"tabBar_new_icon"];
    new.tabBarItem.selectedImage = [UIImage imageNamedWithOriginalImage:@"tabBar_new_click_icon"];
    
    // 关注
    UITableViewController *friendTrends = self.childViewControllers[2];
    friendTrends.tabBarItem.title = @"关注";
    friendTrends.tabBarItem.image = [UIImage imageNamed:@"tabBar_friendTrends_icon"];
    friendTrends.tabBarItem.selectedImage = [UIImage imageNamedWithOriginalImage:@"tabBar_friendTrends_click_icon"];
    
    // 我
    UIViewController *me = self.childViewControllers[3];
    me.tabBarItem.title = @"我";
    me.tabBarItem.image = [UIImage imageNamed:@"tabBar_me_icon"];
    me.tabBarItem.selectedImage = [UIImage imageNamedWithOriginalImage:@"tabBar_me_click_icon"];
}


@end
