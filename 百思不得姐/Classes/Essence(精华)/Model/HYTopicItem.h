//
//  HYTopicItem.h
//  百思不得姐
//
//  Created by 李好一 on 16/3/2.
//  Copyright © 2016年 李好一. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, HYTopicType) {
    /** 全部 */
    HYTopicTypeAll = 1,
    /** 图片 */
    HYTopicTypePicture = 10,
    /** 段子 */
    HYTopicTypeWord = 29,
    /** 声音 */
    HYTopicTypeVoice = 31,
    /** 视频 */
    HYTopicTypeVideo = 41
};

@interface HYTopicItem : NSObject

/** 用户的名字 */
@property (nonatomic, copy) NSString *name;
/** 用户的头像 */
@property (nonatomic, copy) NSString *profile_image;
/** 帖子的文字内容 */
@property (nonatomic, copy) NSString *text;
/** 帖子审核通过的时间 */
@property (nonatomic, copy) NSString *created_at;
/** 顶数量 */
@property (nonatomic, copy) NSString *ding;
/** 踩数量 */
@property (nonatomic, copy) NSString *cai;
/** 转发\分享数量 */
@property (nonatomic, copy) NSString *repost;
/** 评论数量 */
@property (nonatomic, copy) NSString *comment;
/** 帖子类型 */
@property (nonatomic, assign) HYTopicType type;
/** 最热评论(数组里面存放着最热评论数据) */
@property (nonatomic, strong) NSArray *top_cmt;
/** 中间图片的宽度 */
@property (nonatomic, assign) NSInteger width;
/** 中间图片的高度 */
@property (nonatomic, assign) NSInteger height;

// 辅助属性
/** cell的高度 */
@property (nonatomic, assign) CGFloat cellHeight;

@end
