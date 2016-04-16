//
//  HYSquareCell.m
//  百思不得姐
//
//  Created by 李好一 on 16/4/14.
//  Copyright © 2016年 李好一. All rights reserved.
//

#import "HYSquareCell.h"
#import "HYSquareItem.h"
#import <UIImageView+WebCache.h>

@interface HYSquareCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation HYSquareCell

- (void)setSquareItem:(HYSquareItem *)squareItem
{
    _squareItem = squareItem;
    
    _nameLabel.text = self.squareItem.name;
    [_iconView sd_setImageWithURL:[NSURL URLWithString:squareItem.icon]];
}

@end
