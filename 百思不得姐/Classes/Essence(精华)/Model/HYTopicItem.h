//
//  HYTopicItem.h
//  百思不得姐
//
//  Created by 李好一 on 16/3/2.
//  Copyright © 2016年 李好一. All rights reserved.
//

#import <Foundation/Foundation.h>

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
@property (nonatomic, assign) NSInteger ding;
/** 踩数量 */
@property (nonatomic, assign) NSInteger cai;
/** 转发\分享数量 */
@property (nonatomic, assign) NSInteger repost;
/** 评论数量 */
@property (nonatomic, assign) NSInteger comment;
/** 帖子类型 */
@property (nonatomic, assign) NSInteger *type;

@end
