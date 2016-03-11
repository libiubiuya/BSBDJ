//
//  UIView+HYInit.m
//  百思不得姐
//
//  Created by 李好一 on 16/3/9.
//  Copyright © 2016年 李好一. All rights reserved.
//

#import "UIView+HYInit.h"

@implementation UIView (HYInit)

+ (instancetype)HY_awakeFromNib
{
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].firstObject;
}

@end
