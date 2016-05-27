//
//  JDLeftRecommendCell.h
//  百思不得姐
//
//  Created by Chiang on 16/4/24.
//  Copyright © 2016年 Google. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JDLeftRecommendContentModel;

@interface JDLeftRecommendCell : UITableViewCell

/**
 *  左边view内容的模型：
 */
@property (nonatomic, strong) JDLeftRecommendContentModel *leftContent;

/**
 *  加载xib：
 *
 *  @return 
 */
+(instancetype)getLeftRecommendCellFromXib;

@end
