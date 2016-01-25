//
//  UIBarButtonItem+HYItem.m
//  百思不得姐
//
//  Created by 李好一 on 16/1/25.
//  Copyright © 2016年 李好一. All rights reserved.
//

#import "UIBarButtonItem+HYItem.h"

@implementation UIBarButtonItem (HYItem)

+ (UIBarButtonItem *)itemWithImage:(UIImage *)image highImage:(UIImage *)highImage target:(nullable id)target action:(nonnull SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:image forState:UIControlStateNormal];
    [button setImage:highImage forState:UIControlStateHighlighted];
    [button sizeToFit];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

@end
