//
//  HYAdController.m
//  百思不得姐
//
//  Created by 李好一 on 16/2/22.
//  Copyright © 2016年 李好一. All rights reserved.
//

#import "HYAdController.h"

#import "HYAdItem.h"

#import <AFNetworking/AFNetworking.h>

#import <MJExtension/MJExtension.h>

#import <UIImageView+WebCache.h>

#define HYcode2 @"phcqnauGuHYkFMRquANhmgN_IauBThfqmgKsUARhIWdGULPxnz3vndtkQW08nau_I1Y1P1Rhmhwz5Hb8nBuL5HDknWRhTA_qmvqVQhGGUhI_py4MQhF1TvChmgKY5H6hmyPW5RFRHzuET1dGULnhuAN85HchUy7s5HDhIywGujY3P1n3mWb1PvDLnvF-Pyf4mHR4nyRvmWPBmhwBPjcLPyfsPHT3uWm4FMPLpHYkFh7sTA-b5yRzPj6sPvRdFhPdTWYsFMKzuykEmyfqnauGuAu95Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiu9mLfqHbD_H70hTv6qnHn1PauVmynqnjclnj0lnj0lnj0lnj0lnj0hThYqniuVujYkFhkC5HRvnB3dFh7spyfqnW0srj64nBu9TjYsFMub5HDhTZFEujdzTLK_mgPCFMP85Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiuBnHfdnjD4rjnvPWYkFh7sTZu-TWY1QW68nBuWUHYdnHchIAYqPHDzFhqsmyPGIZbqniuYThuYTjd1uAVxnz3vnzu9IjYzFh6qP1RsFMws5y-fpAq8uHT_nBuYmycqnau1IjYkPjRsnHb3n1mvnHDkQWD4niuVmybqniu1uy3qwD-HQDFKHakHHNn_HR7fQ7uDQ7PcHzkHiR3_RYqNQD7jfzkPiRn_wdKHQDP5HikPfRb_fNc_NbwPQDdRHzkDiNchTvwW5HnvPj0zQWndnHRvnBsdPWb4ri3kPW0kPHmhmLnqPH6LP1ndm1-WPyDvnHKBrAw9nju9PHIhmH9WmH6zrjRhTv7_5iu85HDhTvd15HDhTLTqP1RsFh4ETjYYPW0sPzuVuyYqn1mYnjc8nWbvrjTdQjRvrHb4QWDvnjDdPBuk5yRzPj6sPvRdgvPsTBu_my4bTvP9TARqnam"

@interface HYAdController ()

/** 广告模型 */
@property (strong, nonatomic) HYAdItem *adItem;

/** 启动图片 */
@property (weak, nonatomic) IBOutlet UIImageView *launchImageView;

/** 广告视图 */
@property (weak, nonatomic) UIImageView *adView;

/** 广告按钮 */
@property (weak, nonatomic) IBOutlet UIButton *adButton;


@end

@implementation HYAdController

- (UIImageView *)adView
{
    if (_adView == nil) {
        UIImageView *imageV = [[UIImageView alloc] init];
        _adView = imageV;
        [self.view insertSubview:imageV belowSubview:self.adButton];
    }
    return _adView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 启动图片适配
    [self setUpLaunchImage];
    
    // 加载广告
    [self loadData];
}

- (void)loadData
{
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"code2"] = HYcode2;
    
    [mgr GET:@"http://mobads.baidu.com/cpro/ui/mads.php" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nullable responseObject) {
        
//        NSLog(@"%@", responseObject);
//        [responseObject writeToFile:@"/Users/lihaoyi/Desktop/BSBDJ/百思/百思不得姐/百思不得姐/Classes/AD(广告)/ad.plist" atomically:YES];
        
        NSDictionary *adDict = [responseObject[@"ad"] lastObject];
        
        _adItem = [HYAdItem mj_objectWithKeyValues:adDict];
        
        // 广告图片尺寸
        CGFloat w = HYScreenW;
        CGFloat h = HYScreenW / _adItem.w * _adItem.h;
        if (h > HYScreenH) {
            h = HYScreenH;
        }
        self.adView.frame = CGRectMake(0, 0, w, h);
        
        [self.adView sd_setImageWithURL:[NSURL URLWithString:_adItem.w_picurl]];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
//        NSLog(@"%@", error);
        
    }];
}

// 启动图片适配
- (void)setUpLaunchImage
{
    if (iPhone6P) {
        _launchImageView.image = [UIImage imageNamed:@"LaunchImage-800-Portrait-736h@3x"];
    }else if (iPhone6){
        _launchImageView.image = [UIImage imageNamed:@"LaunchImage-800-667h"];
    }else if (iPhone5){
        _launchImageView.image = [UIImage imageNamed:@"LaunchImage-568h"];
    }else if (iPhone4){
        _launchImageView.image = [UIImage imageNamed:@"LaunchImage-700"];
    }
}

@end
