//
//  HYAdController.m
//  百思不得姐
//
//  Created by 李好一 on 16/2/22.
//  Copyright © 2016年 李好一. All rights reserved.
//

#import "HYAdController.h"

@interface HYAdController ()


@property (weak, nonatomic) IBOutlet UIImageView *launchImageView;

@end

@implementation HYAdController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 启动图片适配
    [self setUpLaunchImage];
}

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
