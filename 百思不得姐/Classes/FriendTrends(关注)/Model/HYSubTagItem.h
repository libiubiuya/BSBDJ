//
//  HYSubTagItem.h
//  百思不得姐
//
//  Created by 李好一 on 16/2/23.
//  Copyright © 2016年 李好一. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HYSubTagItem : NSObject

/** 图片 */
@property (nonatomic, strong) NSString *image_list;

/** 订阅数 */
@property (nonatomic, strong) NSString *sub_number;

/** 订阅名称 */
@property (nonatomic, strong) NSString *theme_name;

@end
