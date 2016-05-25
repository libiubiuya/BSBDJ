//
//  MBProgressHUD+HYHUD.h
//  百思不得姐
//
//  Created by jntv on 16/5/25.
//  Copyright © 2016年 李好一. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (HYHUD)

+ (void)showSuccess:(NSString *)success toView:(UIView *)view;
+ (void)showError:(NSString *)error toView:(UIView *)view;

+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view;


+ (void)showSuccess:(NSString *)success;
+ (void)showError:(NSString *)error;

+ (MBProgressHUD *)showMessage:(NSString *)message;

+ (void)hideHUDForView:(UIView *)view;
+ (void)hideHUD;

@end
