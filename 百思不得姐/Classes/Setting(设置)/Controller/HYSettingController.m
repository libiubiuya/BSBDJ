//
//  HYSettingController.m
//  百思不得姐
//
//  Created by 李好一 on 16/2/1.
//  Copyright © 2016年 李好一. All rights reserved.
//

#import "HYSettingController.h"

@interface HYSettingController ()

@end

@implementation HYSettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"jump" style:0 target:self action:@selector(jump)];
}

- (void)jump
{
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor orangeColor];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
