//
//  HYAdItem.h
//  百思不得姐
//
//  Created by 李好一 on 16/2/22.
//  Copyright © 2016年 李好一. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HYAdItem : NSObject

/** 广告图片 */
@property (nonatomic, strong) NSString *w_picurl;

/** 点击广告后跳转的界面 */
@property (nonatomic, strong) NSString *ori_curl;

/** 图片高度 */
@property (nonatomic, assign) CGFloat h;

/** 图片宽度 */
@property (nonatomic, assign) CGFloat w;

@end
