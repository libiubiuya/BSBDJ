//
//  UIBarButtonItem+HYItem.h
//  百思不得姐
//
//  Created by 李好一 on 16/1/25.
//  Copyright © 2016年 李好一. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (HYItem)

/**
 *  设置导航栏按钮高亮状态
 *
 *  @param image     原始图片
 *  @param highImage 高亮图片
 *  @param target    作用对象
 *  @param action    执行方法
 *
 *  @return UIBarButtonItem
 */
+ (UIBarButtonItem *)itemWithImage:(UIImage *)image highImage:(UIImage *)highImage target:(nullable id)target action:(nonnull SEL)action;

/**
 *  设置导航栏按钮选中状态
 *
 *  @param image     原始图片
 *  @param highImage 选中图片
 *  @param target    作用对象
 *  @param action    执行方法
 *
 *  @return UIBarButtonItem
 */
+ (UIBarButtonItem *)itemWithImage:(UIImage *)image selImage:(UIImage *)selImage target:(nullable id)target action:(nonnull SEL)action;

/**
 *  设置导航栏返回按钮
 *
 *  @param image     正常状态图片
 *  @param highImage 高亮状态图片
 *  @param target    作用对象
 *  @param action    执行方法
 *  @param norColor  正常状态标题颜色
 *  @param highColor 高亮状态标题颜色
 *  @param title     标题内容
 *
 *  @return UIBarButtonItem
 */
+ (UIBarButtonItem *)itemWithImage:(UIImage *)image highImage:(UIImage *)highImage target:(nullable id)target action:(nonnull SEL)action norColor:(UIColor *)norColor highColor:(UIColor *)highColor title:(NSString *)title;

@end
