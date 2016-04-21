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
/** 网页内容 */
@property (weak, nonatomic) IBOutlet UIView *contentView;
/** 返回按钮 */
@property (weak, nonatomic) IBOutlet UIBarButtonItem *backButton;
/** 前进按钮 */
@property (weak, nonatomic) IBOutlet UIBarButtonItem *goButton;
/** 刷新按钮 */
@property (weak, nonatomic) IBOutlet UIBarButtonItem *refreshButton;
@end

@implementation HYHtmlController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blueColor];
    
    // 加载网页
    [self setUpLoadData];
}

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
