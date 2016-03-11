//
//  HYTopicItem.m
//  百思不得姐
//
//  Created by 李好一 on 16/3/2.
//  Copyright © 2016年 李好一. All rights reserved.
//

#import "HYTopicItem.h"

@implementation HYTopicItem

- (CGFloat)cellHeight
{
    // 头像
    _cellHeight = 45 + HYMargin;
    
    // 文字
    CGFloat textMaxW = HYScreenW - 2 * HYMargin;
    _cellHeight += [self.text boundingRectWithSize:CGSizeMake(textMaxW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:15]} context:nil].size.height + HYMargin;
    
    // 中间
    if (self.type != HYTopicTypeWord) {
        CGFloat cellW = textMaxW;
        CGFloat cellH = self.height * cellW / self.width;
        
        // 中间内容的frame
        self.centerFrame = CGRectMake(HYMargin, _cellHeight, cellW, cellH);
        _cellHeight += (cellH + HYMargin);
    }
    
    // 最热评论
    if (self.top_cmt.count) {
        
        // 最热评论
        _cellHeight += 20;
        
        // 评论内容
        NSDictionary *cmt = self.top_cmt.firstObject;
        NSString *username = cmt[@"user"][@"username"];
        NSString *content = cmt[@"content"];
        if (content.length == 0) {
            content = @"[语音评论]";
        }
        NSString *cmt_text = [NSString stringWithFormat:@"%@ : %@", username, content];
        
        _cellHeight += [cmt_text boundingRectWithSize:CGSizeMake(textMaxW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:15]} context:nil].size.height + HYMargin;
    }
    
    // 底部工具条
    _cellHeight += (HYMargin + 35);
    
    return _cellHeight;
}

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
