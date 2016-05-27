//
//  JDLeftRecommendContentModel.h
//  百思不得姐
//
//  Created by Chiang on 16/4/24.
//  Copyright © 2016年 Google. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JDLeftRecommendContentModel : NSObject

/**
 *  用户id：
 */
@property (nonatomic, assign) NSInteger id;
/**
 *  昵称：
 */
@property (nonatomic, copy) NSString *name;
/**
 *
 */
@property (nonatomic, assign) NSInteger count;
/**
 *  对应右边的数据：
 */
@property (nonatomic, strong) NSMutableArray *rightContentsArray;
/**
 *  总页数：
 */
@property (nonatomic, assign) NSInteger total_page;
/**
 *  总用户数：
 */
@property (nonatomic, assign) NSInteger total;
/**
 *  当前页面：
 */
@property (nonatomic, assign) NSInteger current_page;

@end
