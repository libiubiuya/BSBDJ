//
//  HYSubTagController.m
//  百思不得姐
//
//  Created by 李好一 on 16/2/23.
//  Copyright © 2016年 李好一. All rights reserved.
//

#import "HYSubTagController.h"

#import "HYSubTagItem.h"

#import "HYSubTagCell.h"

#import <AFNetworking/AFNetworking.h>

#import <MJExtension/MJExtension.h>

@interface HYSubTagController ()

/** 订阅标签模型 */
@property (nonatomic, strong) NSMutableArray *subTagItem;

@end

@implementation HYSubTagController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"订阅标签";
    
    // 加载网络数据
    [self loadData];
}

- (void)loadData
{
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"a"] = @"tag_recommend";
    parameters[@"action"] = @"sub";
    parameters[@"c"] = @"topic";
    
    [mgr GET:@"http://api.budejie.com/api/api_open.php" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSArray * _Nullable responseObject) {
        
//        [responseObject writeToFile:@"/Users/lihaoyi/Desktop/BSBDJ/百思/百思不得姐/百思不得姐/Classes/New(新帖)/subTag.plist" atomically:YES];
        
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
