//
//  HYTitleButton.m
//  百思不得姐
//
//  Created by 李好一 on 16/2/27.
//  Copyright © 2016年 李好一. All rights reserved.
//

#import "HYTitleButton.h"

@implementation HYTitleButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.titleLabel.font = [UIFont systemFontOfSize:13];
        [self setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    }
    return self;
}

- (void)setHighlighted:(BOOL)highlighted
{
    
}

@end
