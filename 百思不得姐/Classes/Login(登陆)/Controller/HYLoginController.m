//
//  HYLoginController.m
//  百思不得姐
//
//  Created by 李好一 on 16/5/20.
//  Copyright © 2016年 李好一. All rights reserved.
//

#import "HYLoginController.h"

@interface HYLoginController ()

@end

@implementation HYLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)close
{
    [self dismissViewControllerAnimated:YES completion:nil];
}



// 设置状态栏颜色
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
