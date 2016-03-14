//
//  HYVideoViewController.m
//  百思不得姐
//
//  Created by 李好一 on 16/2/28.
//  Copyright © 2016年 李好一. All rights reserved.
//

#import "HYVideoViewController.h"
#import "HYTopicItem.h"
#import "HYHeader.h"
#import "HYFooter.h"
#import "HYTopicCell.h"

#import <AFHTTPSessionManager.h>
#import <MJExtension/MJExtension.h>

@interface HYVideoViewController ()

/** 会话管理者 */
@property (weak, nonatomic) AFHTTPSessionManager *mgr;
/** 帖子模型 */
@property (nonatomic, strong) NSMutableArray *topicItems;
/** 加载下一页数据  */
@property (nonatomic, copy) NSString *maxtime;

@end

@implementation HYVideoViewController

static NSString * const HYTopicCellId = @"topic";

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
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    // 注册cell
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([HYTopicCell class]) bundle:nil] forCellReuseIdentifier:HYTopicCellId];
    
    self.tableView.rowHeight = 300;
}

/**
 *  设置刷新控件
 */
- (void)setUpRefresh
{
    
    // 下拉刷新
    self.tableView.mj_header = [HYHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewTopics)];
    // 一进入界面就刷新
    [self.tableView.mj_header beginRefreshing];
    
    // 上拉刷新
    self.tableView.mj_footer = [HYFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreTopics)];
}

/**
 *  加载最新数据
 */
- (void)loadNewTopics
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"a"] = @"list";
    parameters[@"c"] = @"data";
    parameters[@"type"] = @(HYTopicTypeVideo);
    
    [self.mgr GET:baseUrl parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        self.maxtime = responseObject[@"info"][@"maxtime"];
        self.topicItems = [HYTopicItem mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        [self.tableView reloadData];
        
        [self.tableView.mj_header endRefreshing];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self.tableView.mj_header endRefreshing];
    }];
}

/**
 *  加载更多数据
 */
- (void)loadMoreTopics
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"a"] = @"list";
    parameters[@"c"] = @"data";
    parameters[@"type"] = @(HYTopicTypeVideo);
    parameters[@"maxtime"] = self.maxtime;
    
    [self.mgr GET:baseUrl parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        self.maxtime = responseObject[@"info"][@"maxtime"];
        NSArray *moreTopics = [HYTopicItem mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        [self.topicItems addObjectsFromArray:moreTopics];
        
        [self.tableView reloadData];
        
        [self.tableView.mj_footer endRefreshing];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self.tableView.mj_footer endRefreshing];
    }];
}

#pragma mark - 懒加载
- (AFHTTPSessionManager *)mgr
{
    if (_mgr == nil) {
        _mgr = [AFHTTPSessionManager manager];
    }
    return _mgr;
}

#pragma mark - tableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.topicItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    HYTopicCell *cell = [tableView dequeueReusableCellWithIdentifier:HYTopicCellId];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.topicItem = self.topicItems[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HYTopicItem *topicItem = self.topicItems[indexPath.row];
    
    return topicItem.cellHeight;
}

@end
