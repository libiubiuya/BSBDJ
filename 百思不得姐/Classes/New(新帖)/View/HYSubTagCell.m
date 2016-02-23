//
//  HYSubTagCell.m
//  百思不得姐
//
//  Created by 李好一 on 16/2/23.
//  Copyright © 2016年 李好一. All rights reserved.
//

#import "HYSubTagCell.h"

#import "HYSubTagItem.h"

#import <UIImageView+WebCache.h>

@interface HYSubTagCell ()

/** 图片 */
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
/** 订阅名称 */
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
/** 订阅数 */
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;

@end

@implementation HYSubTagCell

+ (instancetype)subTagCell
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] firstObject];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setItem:(HYSubTagItem *)item
{
    _item = item;
    
    // 图片
    [_iconView sd_setImageWithURL:[NSURL URLWithString:item.image_list] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    
    // 订阅名
    _nameLabel.text = item.theme_name;
    
    // 订阅数
    _numberLabel.text = item.sub_number;
}
@end
