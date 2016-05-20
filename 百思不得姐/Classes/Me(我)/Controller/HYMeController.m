//
//  HYMeController.m
//  百思不得姐
//
//  Created by 李好一 on 16/4/10.
//  Copyright © 2016年 李好一. All rights reserved.
//

#import "HYMeController.h"
#import "HYSettingController.h"
#import "HYSquareItem.h"
#import "HYSquareCell.h"
#import "HYHtmlController.h"
#import "HYLoginController.h"

#import <AFNetworking/AFNetworking.h>
#import <MJExtension/MJExtension.h>

@interface HYMeController ()<UICollectionViewDelegate, UICollectionViewDataSource>

/** collectionView */
@property (weak, nonatomic) UICollectionView *collectionView;

/** square模型 */
@property (nonatomic, strong) NSMutableArray *squareItems;

@end

@implementation HYMeController

static NSInteger const cols = 4;
static CGFloat const margin = 1;
static NSString *const ID = @"cell";

#define cellWH (HYScreenW - (cols - 1) * margin) / cols

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:206/255.0 green:206/255.0 blue:206/255.0 alpha:1];
    
    // 设置导航条
    [self setUpNavigationContent];
    
    // 设置footView
    [self setUpFootView];
    
    // 加载数据
    [self setUpLoadData];
    
    self.tableView.sectionHeaderHeight = 0;
    self.tableView.sectionFooterHeight = 10;
    self.tableView.contentInset = UIEdgeInsetsMake(HYMargin - HYTitlesViewH, 0, 0, 0);
}

/**
 *  设置导航条
 */
- (void)setUpNavigationContent
{
    UIBarButtonItem *settingItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"mine-setting-icon"] highImage:[UIImage imageNamed:@"mine-setting-icon-click"] target:self action:@selector(setting)];
    UIBarButtonItem *moonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"mine-moon-icon"] selImage:[UIImage imageNamed:@"mine-moon-icon-click"] target:self action:@selector(moon:)];
    self.navigationItem.rightBarButtonItems = @[settingItem, moonItem];
    
    self.navigationItem.title = @"我的";
}

/**
 *  设置界面
 */
- (void)setting
{
    HYSettingController *setting = [[HYSettingController alloc] init];
    
    // 隐藏tabBar
    setting.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:setting animated:YES];
}

/**
 *  夜间模式
 *
 *  @param button 点击的按钮
 */
- (void)moon:(UIButton *)button
{
    button.selected = !button.selected;
}

/**
 *  设置footView
 */
- (void)setUpFootView
{
    // 创建流水布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(cellWH, cellWH);
    layout.minimumInteritemSpacing = margin;
    layout.minimumLineSpacing = margin;
    
    // 创建collectionView
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, HYScreenW, 0) collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor clearColor];
    collectionView.scrollEnabled = NO;
    
    collectionView.dataSource = self;
    collectionView.delegate = self;
    
    // 注册cell
    [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([HYSquareCell class]) bundle:nil] forCellWithReuseIdentifier:ID];
    
    _collectionView = collectionView;
    self.tableView.tableFooterView = collectionView;
}

/**
 *  加载数据
 */
- (void)setUpLoadData
{
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"a"] = @"square";
    parameters[@"c"] = @"topic";
    
    [mgr GET:baseUrl parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSArray *dictArray = responseObject[@"square_list"];
        _squareItems = [HYSquareItem mj_objectArrayWithKeyValuesArray:dictArray];
        
        [self.collectionView reloadData];
        
        // 每个格子尺寸
        NSInteger count = _squareItems.count;
        CGFloat rows = (count - 1) / cols + 1;
        CGFloat collectionH = rows * cellWH;
        self.collectionView.height = collectionH;
        self.tableView.tableFooterView = self.collectionView;
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

#pragma mark - UITableViewDataSource
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row == 0) {
        HYLoginController *loginController = [[HYLoginController alloc] init];
        [self presentViewController:loginController animated:YES completion:nil];
    }
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.squareItems.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HYSquareCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
    HYSquareItem *squareItem = self.squareItems[indexPath.row];
    cell.squareItem = squareItem;
    
    return cell;
}


#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    HYSquareItem *squareItem = self.squareItems[indexPath.row];
    if ([squareItem.url hasPrefix:@"http"]) {
        HYHtmlController *html = [[HYHtmlController alloc] init];
        html.squareItem = squareItem;
        [self.navigationController pushViewController:html animated:YES];
    }
}

@end
