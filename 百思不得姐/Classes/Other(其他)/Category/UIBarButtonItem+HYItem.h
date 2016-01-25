//
//  UIBarButtonItem+HYItem.h
//  百思不得姐
//
//  Created by 李好一 on 16/1/25.
//  Copyright © 2016年 李好一. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (HYItem)

+ (UIBarButtonItem *)itemWithImage:(UIImage *)image highImage:(UIImage *)highImage target:(nullable id)target action:(nonnull SEL)action;

@end
