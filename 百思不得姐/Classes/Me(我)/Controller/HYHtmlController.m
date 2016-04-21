//
//  HYHtmlController.m
//  百思不得姐
//
//  Created by 李好一 on 16/4/16.
//  Copyright © 2016年 李好一. All rights reserved.
//

#import "HYHtmlController.h"
#import "HYSquareItem.h"

#import <WebKit/WebKit.h>

@interface HYHtmlController ()

/** 网页 */
@property (weak, nonatomic) WKWebView *webView;
/** 进度条 */
@property (weak, nonatomic) UIProgressView *progressView;
/** 网页内容 */
@property (weak, nonatomic) IBOutlet UIView *contentView;
/** 返回按钮 */
@property (weak, nonatomic) IBOutlet UIBarButtonItem *backButton;
/** 前进按钮 */
@property (weak, nonatomic) IBOutlet UIBarButtonItem *goButton;

@end

@implementation HYHtmlController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 加载网页
    [self setUpLoadData];
    
    // 添加进度条
    [self setUpProgressView];
    
    // 添加监听
    [self setUpObserver];
}

/**
 *  重新布局
 */
- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    _webView.frame = self.contentView.bounds;
}

/**
 *  加载网页
 */
- (void)setUpLoadData
{
    WKWebView *webView = [[WKWebView alloc] init];
    _webView = webView;
    webView.scrollView.contentInset = UIEdgeInsetsMake(0, 0, HYTabBarH, 0);
    [self.contentView addSubview:webView];
    
    NSURL *url = [NSURL URLWithString:_squareItem.url];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

/**
 *  添加进度条
 */
- (void)setUpProgressView
{
    UIProgressView *progressView = [[UIProgressView alloc] init];
    progressView.frame = CGRectMake(0, HYNavMaxY, HYScreenW, 1);
    progressView.progressTintColor = [UIColor orangeColor];
    _progressView = progressView;
    [self.contentView addSubview:progressView];
}

/**
 *  添加监听
 */
- (void)setUpObserver
{
    // 返回
    [self.webView addObserver:self forKeyPath:@"canGoBack" options:NSKeyValueObservingOptionNew context:nil];
    // 前进
    [self.webView addObserver:self forKeyPath:@"canGoForward" options:NSKeyValueObservingOptionNew context:nil];
    // 进度条
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    // 标题
    [self.webView addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:nil];
}

/**
 *  监听
 */
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    // 返回
    _backButton.enabled = self.webView.canGoBack;
    
    // 前进
    _goButton.enabled = self.webView.canGoForward;
    
    // 进度条
    self.progressView.progress = self.webView.estimatedProgress;
    if (self.progressView.progress == 1.0) {
        self.progressView.hidden = YES;
    }
    
    // 标题
    self.title = self.webView.title;
}

/**
 *  移除监听
 */
- (void)dealloc
{
    [self.webView removeObserver:self forKeyPath:@"canGoBack"];
    [self.webView removeObserver:self forKeyPath:@"canGoForward"];
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
    [self.webView removeObserver:self forKeyPath:@"title"];
}

#pragma mark - 按钮点击
- (IBAction)back:(id)sender
{
    [self.webView goBack];
}

- (IBAction)go:(id)sender
{
    [self.webView goForward];
}

- (IBAction)refresh:(id)sender
{
    [self.webView reload];
}
@end
