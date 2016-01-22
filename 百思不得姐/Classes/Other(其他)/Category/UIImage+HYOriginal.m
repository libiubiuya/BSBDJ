//
//  UIImage+HYOriginal.m
//  百思不得姐
//
//  Created by 李好一 on 16/1/23.
//  Copyright © 2016年 李好一. All rights reserved.
//

#import "UIImage+HYOriginal.h"

@implementation UIImage (HYOriginal)

+ (instancetype)imageNamedWithOriginalImage:(NSString *)imageName
{
    UIImage *image = [UIImage imageNamed:imageName];
    
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

@end
