//
//  HYEssenceController.m
//  百思不得姐
//
//  Created by 李好一 on 16/1/12.
//  Copyright © 2016年 李好一. All rights reserved.
//

#import "HYEssenceController.h"
#import "HYTitleButton.h"
#import "HYAllViewController.h"
#import "HYVideoViewController.h"
#import "HYVoiceViewController.h"
#import "HYPictureViewController.h"
#import "HYWordViewController.h"

@interface HYEssenceController () <UIScrollViewDelegate>

/** 标题栏 */
@property (weak, nonatomic) UIView *titlesView;

/** 被选中的按钮 */
@property (weak, nonatomic) HYTitleButton *clickTitleButton;

/** 标题栏底部下划线 */
@property (weak, nonatomic) UIView *underlineView;

/** 用来显示所有子控制器的scrollView */
@property (weak, nonatomic) UIScrollView *scrollView;

@end

@implementation HYEssenceController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    // 设置导航栏内容
    [self setUpNavigationContent];
    
    // 添加子控制器
    [self setUpChildController];
    
    // 添加scrollView
    [self setUpScrollView];
    
    // 添加标题栏
    [self setUpTitlesView];
    
    // 懒加载子控制器
    [self addChildVcIntoScrollView];
}

/**
 *  添加子控制器
 */
- (void)setUpChildController
{
    [self addChildViewController:[[HYAllViewController alloc] init]];
    [self addChildViewController:[[HYVideoViewController alloc] init]];
    [self addChildViewController:[[HYVoiceViewController alloc] init]];
    [self addChildViewController:[[HYPictureViewController alloc] init]];
    [self addChildViewController:[[HYWordViewController alloc] init]];
}

/**
 *  添加scrollView
 */
- (void)setUpScrollView
{
    // 不要自动调整scrollView的contentInset
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = self.view.bounds;
    scrollView.pagingEnabled = YES;
    scrollView.delegate = self;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
    
    // 添加子控制器的view到scrollView中
    NSUInteger count = self.childViewControllers.count;
    
    scrollView.contentSize = CGSizeMake(count * scrollView.width, 0);
    
}

/**
 *  添加标题栏
 */
- (void)setUpTitlesView
{
    UIView *titlesView = [[UIView alloc] init];
    titlesView.frame = CGRectMake(0, HYNavMaxY, self.view.width, HYTitlesViewH);
    titlesView.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.8];
    [self.view addSubview:titlesView];
    self.titlesView = titlesView;
    
    // 添加标题按钮
    [self setUpTitleButtons];
    
    // 添加标题栏底部下划线
    [self setUpTitlesViewUnderLine];
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
        titleButton.tag = i;
        [titleButton addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.titlesView addSubview:titleButton];
        
        // 设置属性
        [titleButton setTitle:titles[i] forState:UIControlStateNormal];
        
        // 设置frame
        titleButton.frame = CGRectMake(i * titleButtonW, 0, titleButtonW, titleButtonH);
    }
}
/**
 *  添加标题栏底部下划线
 */
- (void)setUpTitlesViewUnderLine
{
    // 取出第一个标题按钮
    HYTitleButton *firstTitleButton = self.titlesView.subviews.firstObject;
    
    // 标题栏
    UIView *underlineView = [[UIView alloc] init];
    underlineView.backgroundColor = [firstTitleButton titleColorForState:UIControlStateSelected];
    underlineView.height = 2;
    underlineView.y = self.titlesView.height - underlineView.height;
    [self.titlesView addSubview:underlineView];
    
    // 默认选中第一个按钮
    // 切换按钮状态
    firstTitleButton.selected = YES;
    self.clickTitleButton = firstTitleButton;
    // 下划线的宽度 == 按钮文字的宽度
    [firstTitleButton.titleLabel sizeToFit];
    underlineView.width = firstTitleButton.titleLabel.width + HYMargin;
    underlineView.centerX = firstTitleButton.centerX;
    
    self.underlineView = underlineView;
}

/**
 *  设置导航条
 */
- (void)setUpNavigationContent
{
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    self.navigationItem.titleView = imageView;
}


#pragma mark - 监听
- (void)titleClick:(HYTitleButton *)titleButton
{
    self.clickTitleButton.selected = NO;
    titleButton.selected = YES;
    self.clickTitleButton = titleButton;
    
    // 移动下划线
    [UIView animateWithDuration:0.25 animations:^{
        self.underlineView.width = titleButton.titleLabel.width + HYMargin;
        self.underlineView.centerX = titleButton.centerX;
        
        // 让scrollView滚动到对应位置
        NSUInteger index = titleButton.tag;
        CGPoint offset = self.scrollView.contentOffset;
        offset.x = index * self.scrollView.width;
        self.scrollView.contentOffset = offset;
    } completion:^(BOOL finished) {
        [self addChildVcIntoScrollView];
    }];
}

#pragma mark - 懒加载

/**
 *  添加子控制器view到scrollView
 */
- (void)addChildVcIntoScrollView
{
    NSUInteger index = self.scrollView.contentOffset.x / self.scrollView.width;
    UIViewController *childVc = self.childViewControllers[index];
    childVc.view.frame = self.scrollView.bounds;
    [self.scrollView addSubview:childVc.view];
}

#pragma mark - UIScrollViewDelegate

/**
 *  scrollView滚动完毕\静止的时候调用
 *
 *  @param scrollView scrollView
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSUInteger index = self.scrollView.contentOffset.x / self.scrollView.width;
    HYTitleButton *titleButton = self.titlesView.subviews[index];
    [self titleClick:titleButton];
    
}

@end












