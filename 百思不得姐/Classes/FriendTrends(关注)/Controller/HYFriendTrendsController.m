//
//  HYFriendTrendsController.m
//  百思不得姐
//
//  Created by 李好一 on 16/1/12.
//  Copyright © 2016年 李好一. All rights reserved.
//

#import "HYFriendTrendsController.h"
#import "HYSubTagItem.h"
#import "HYSubTagCell.h"

#import <AFNetworking/AFNetworking.h>
#import <MJExtension/MJExtension.h>

@interface HYFriendTrendsController ()

/** 订阅标签模型 */
@property (nonatomic, strong) NSMutableArray *subTagItem;

@end

@implementation HYFriendTrendsController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    // 设置导航条
    [self setUpNavContent];
    
    // 加载数据
    [self loadData];
}

- (void)setUpNavContent
{
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    self.navigationItem.titleView = imageView;
}

- (void)loadData
{
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"a"] = @"tag_recommend";
    parameters[@"action"] = @"sub";
    parameters[@"c"] = @"topic";
    
    [mgr GET:baseUrl parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSArray * _Nullable responseObject) {
        
        _subTagItem = [HYSubTagItem mj_objectArrayWithKeyValuesArray:responseObject];
        
        // 刷新tableview
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _subTagItem.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    HYSubTagCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [HYSubTagCell subTagCell];
    }
    
    HYSubTagItem *item = _subTagItem[indexPath.row];
    cell.item = item;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
@end
