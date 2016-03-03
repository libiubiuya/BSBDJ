//
//  HYAllViewController.m
//  百思不得姐
//
//  Created by 李好一 on 16/2/28.
//  Copyright © 2016年 李好一. All rights reserved.
//

#import "HYAllViewController.h"
#import "HYTopicItem.h"
#import <AFHTTPSessionManager.h>
#import <MJExtension/MJExtension.h>

@interface HYAllViewController ()

/** 下拉刷新控件 */
@property (weak, nonatomic) UIRefreshControl *downRefresh;
/** 会话管理者 */
@property (weak, nonatomic) AFHTTPSessionManager *mgr;
/** 帖子模型 */
@property (nonatomic, strong) NSMutableArray *topicItems;
/** 上拉刷新控件里的文字 */
@property (weak, nonatomic) UILabel *footerLabel;
/** 是否正在加载更多数据 */
@property(nonatomic, assign, getter=isLoadingMoreData) BOOL loadingMoreData;

@end

@implementation HYAllViewController

#pragma mark - init
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 设置tableView
    [self setUpTableView];
    
    // 设置刷新控件
    [self setUpRefresh];
}

#pragma mark - 自定义func
/**
 *  设置tableView
 */
- (void)setUpTableView
{
    self.tableView.contentInset = UIEdgeInsetsMake(HYNavMaxY + HYTitlesViewH, 0, HYTabBarH, 0);
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
}

/**
 *  设置刷新控件
 */
- (void)setUpRefresh
{
    // 下拉刷新
    UIRefreshControl *downRefresh = [[UIRefreshControl alloc] init];
    [downRefresh addTarget:self action:@selector(loadNewTopics) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:downRefresh];
    self.downRefresh = downRefresh;
    
    // 上拉刷新
    UIView *footer = [[UIView alloc] init];
    footer.backgroundColor = [UIColor orangeColor];
    footer.height = HYTitlesViewH;
    footer.hidden = YES;
    self.tableView.tableFooterView = footer;
    
    // 上拉刷新的文字
    UILabel *footerLabel = [[UILabel alloc] init];
    footerLabel.text = @"上拉可以加载更多";
    footerLabel.width = self.tableView.width;
    footerLabel.height = footer.height;
    footerLabel.textAlignment = NSTextAlignmentCenter;
    [footer addSubview:footerLabel];
    self.footerLabel = footerLabel;
}

/**
 *  加载最新数据
 */
- (void)loadNewTopics
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"a"] = @"list";
    parameters[@"c"] = @"data";
    parameters[@"type"] = @"1";
    
    [self.mgr GET:baseUrl parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        self.topicItems = [HYTopicItem mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        [self.tableView reloadData];
        
        [self.downRefresh endRefreshing];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self.downRefresh endRefreshing];
    }];
}

/**
 *  加载更多数据
 */
- (void)loadMoreTopics
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.topicItems addObject:[[HYTopicItem alloc] init]];
        [self.tableView reloadData];
        self.footerLabel.text = @"上拉可以加载更多";
        self.loadingMoreData = NO;
    });
}

#pragma mark - 懒加载
- (AFHTTPSessionManager *)mgr
{
    if (_mgr == nil) {
        _mgr = [AFHTTPSessionManager manager];
    }
    return _mgr;
}

#pragma mark - 代理方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (self.topicItems.count == 0 || self.loadingMoreData) return;
    
    // 上拉刷新加载数据
    CGFloat offsetY = scrollView.contentSize.height + scrollView.contentInset.bottom - scrollView.height;
    if (scrollView.contentOffset.y >= offsetY) {
        self.loadingMoreData = YES;
        
        self.footerLabel.text = @"正在加载更多的数据...";
        
        [self loadMoreTopics];
    }
}

#pragma mark - tableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.topicItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    HYTopicItem *topicItem = self.topicItems[indexPath.row];
    cell.textLabel.text = topicItem.name;
    cell.detailTextLabel.text = topicItem.text;
    
    return cell;
}

@end
