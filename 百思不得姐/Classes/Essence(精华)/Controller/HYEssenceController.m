//
//  HYEssenceController.m
//  百思不得姐
//
//  Created by 李好一 on 16/1/12.
//  Copyright © 2016年 李好一. All rights reserved.
//

#import "HYEssenceController.h"
#import "HYTitleButton.h"

@interface HYEssenceController ()

/** 标题栏 */
@property (weak, nonatomic) UIView *titlesView;

/** 被选中的按钮 */
@property (weak, nonatomic) HYTitleButton *clickTitleButton;

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
    
    // 添加标题按钮
    [self setUpTitleButtons];
}

/**
 *  添加标题按钮
 */
- (void)setUpTitleButtons
{
    // 按钮文字
    NSArray *titles = @[@"全部", @"视频", @"声音", @"图片", @"段子"];
    NSUInteger count = titles.count;
    
    // 标题宽高
    CGFloat titleButtonW = self.titlesView.width / count;
    CGFloat titleButtonH = self.titlesView.height;
    
    for (NSUInteger i = 0; i < count; i++) {
        // 创建添加
        HYTitleButton *titleButton = [HYTitleButton buttonWithType:UIButtonTypeCustom];
        [titleButton addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.titlesView addSubview:titleButton];
        
        // 设置属性
        [titleButton setTitle:titles[i] forState:UIControlStateNormal];
        
        // 设置frame
        titleButton.frame = CGRectMake(i * titleButtonW, 0, titleButtonW, titleButtonH);
    }
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


#pragma mark - 监听
- (void)titleClick:(HYTitleButton *)titleButton
{
    self.clickTitleButton.selected = NO;
    titleButton.selected = YES;
    self.clickTitleButton = titleButton;
}

- (void)btnClick
{
    NSLog(@"%s", __func__);
}

@end












