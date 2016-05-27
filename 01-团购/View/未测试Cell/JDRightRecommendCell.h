//
//  JDRightRecommendCell.h
//  百思不得姐
//
//  Created by Chiang on 16/4/25.
//  Copyright © 2016年 Google. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JDRightRecommendContentModel;

@interface JDRightRecommendCell : UITableViewCell

/**
 *  右侧的contentModel：
 */
@property (nonatomic, strong) JDRightRecommendContentModel *rightContent;

/**
 *  加载xib：
 *
 *  @return
 */
+(instancetype)getRightRecommendCellFromXib;

@end
