//
//  MJTg.h
//  01-团购
//
//  Created by apple on 14-4-1.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MineMyOrderModel : NSObject
/**
 *  标题
 */
@property (nonatomic, copy) NSString *title;
/**
 *  价格
 */
@property (nonatomic, copy) NSString *price;
/**
 *  图片
 */
@property (nonatomic, copy) NSString *icon;
/**
 *  购买人数
 */
@property (nonatomic, copy) NSString *buyCount;

+ (instancetype)tgWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;
@end
