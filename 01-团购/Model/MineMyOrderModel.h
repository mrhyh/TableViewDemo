//
//  MJTg.h
//  01-团购
//
//  Created by apple on 14-4-1.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MineMyOrderModel : NSObject

/***  图片链接*/
@property (nonatomic, copy) NSString *iconImageUrlString;

/**
 *  标题
 */
@property (nonatomic, copy) NSString *goodTitle;
/**
 *  价格
 */
@property (nonatomic, copy) NSString *goodNum;

/**
 *  购买人数
 */
@property (nonatomic, copy) NSString *orderPrice;
/***  状态*/
@property (nonatomic, copy) NSString *tradeState;



+ (instancetype)tgWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;
@end
