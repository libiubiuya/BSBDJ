//
//  HYTopicItem.m
//  百思不得姐
//
//  Created by 李好一 on 16/3/2.
//  Copyright © 2016年 李好一. All rights reserved.
//

#import "HYTopicItem.h"

@implementation HYTopicItem

- (NSString *)buttonTitle:(NSString *)numberStr placeholder:(NSString *)placeholder
{
    NSInteger number = numberStr.integerValue;
    if (number >= 10000) {
        return [NSString stringWithFormat:@"%.1f万", number / 10000.0];
    } else if (number == 0) {
        return placeholder;
    } else {
        return numberStr;
    }
}

- (void)setDing:(NSString *)ding
{
    _ding = [self buttonTitle:ding placeholder:@"顶"];
}

- (void)setCai:(NSString *)cai
{
    _cai = [self buttonTitle:cai placeholder:@"踩"];
}

- (void)setRepost:(NSString *)repost
{
    _repost = [self buttonTitle:repost placeholder:@"转发"];
}

- (void)setComment:(NSString *)comment
{
    _comment = [self buttonTitle:comment placeholder:@"评论"];
}

@end
