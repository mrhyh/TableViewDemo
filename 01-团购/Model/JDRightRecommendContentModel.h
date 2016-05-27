//
//  JDRightRecommendContentModel.h
//  百思不得姐
//
//  Created by Chiang on 16/4/24.
//  Copyright © 2016年 Google. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JDRightRecommendContentModel : NSObject

/**
 introduction : ,
	uid : 9017486,
	header : http://wimg.spriteapp.cn/profile/large/2015/09/30/560b557be210a_mini.jpg,
	gender : 2,
	is_vip : 0,
	fans_count : 4570,
	tiezi_count : 258,
	is_follow : 0,
	screen_name : 孙逊 等1227人

 */

/**
*  头像图片名：
*/
@property (nonatomic, copy) NSString *header;
/**
 *  粉丝数量：
 */
@property (nonatomic, assign) NSInteger fans_count;
/**
 *  昵称：
 */
@property (nonatomic, copy) NSString *screen_name;

@end
