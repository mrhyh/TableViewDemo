//
//  JDRightRecommendCell.m
//  百思不得姐
//
//  Created by Chiang on 16/4/25.
//  Copyright © 2016年 Google. All rights reserved.
//

#import "JDRightRecommendCell.h"
#import "JDRightRecommendContentModel.h"
#import "UIImageView+WebCache.h"

@interface JDRightRecommendCell ()

/**
 *  昵称：
 */
@property (weak, nonatomic) IBOutlet UILabel *screenNameLabel;
/**
 *  粉丝数：
 */
@property (weak, nonatomic) IBOutlet UILabel *fansCountLabel;
/**
 *  头像：
 */
@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;

@end

@implementation JDRightRecommendCell

+(instancetype)getRightRecommendCellFromXib {
    return [[[NSBundle mainBundle] loadNibNamed:@"JDRightRecommendCell" owner:nil options:nil] lastObject];
}

/**
 *  重写setter方法，设置cell属性：
 *
 *  @param rightContent
 */
-(void)setRightContent:(JDRightRecommendContentModel *)rightContent {
    _rightContent = rightContent;
    // 设置属性：
    self.screenNameLabel.text = rightContent.screen_name;
    self.fansCountLabel.text = [NSString stringWithFormat:@"%ld人关注", rightContent.fans_count];
    [self.headerImageView sd_setImageWithURL:[NSURL URLWithString:rightContent.header] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
}

@end
