//
//  JDLeftRecommendCell.m
//  百思不得姐
//
//  Created by Chiang on 16/4/24.
//  Copyright © 2016年 Google. All rights reserved.
//

#import "JDLeftRecommendCell.h"
#import "JDLeftRecommendContentModel.h"
#import "Common.h"

@interface JDLeftRecommendCell ()

/**
 *  cell被选中时才会显示的view：
 */
@property (weak, nonatomic) IBOutlet UIView *selectedView;

@end

@implementation JDLeftRecommendCell

-(void)awakeFromNib {
    [self setBackgroundColor:JDColor2(244, 244, 244)];
    // 设置文字颜色：
    self.textLabel.textColor = JDColor2(78, 78, 78);
    // 设置选中view的颜色：
    [self.selectedView setBackgroundColor:JDColor2(219, 21, 26)];
}

+(instancetype)getLeftRecommendCellFromXib {
    return [[[NSBundle mainBundle] loadNibNamed:@"JDLeftRecommendCell" owner:nil options:nil] lastObject];
}

/**
 *  重写setter方法，用模型对label进行赋值：
 *
 *  @param leftContent
 */
-(void)setLeftContent:(JDLeftRecommendContentModel *)leftContent {
    _leftContent = leftContent;
    self.textLabel.text = leftContent.name;
}

-(void)layoutSubviews {
    [super layoutSubviews];
    
    // 调整cell中label的高度：
    self.textLabel.y = 2;
    self.textLabel.height = self.contentView.height - 2 * self.textLabel.y;
}

/**
 *  重写selected方法，拦截选中操作，设置一些属性：
 *
 *  @param selected
 *  @param animated
 */
-(void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // 如果选中，则显示view：
    self.selectedView.hidden = !selected;
    // 设置选中时的字体颜色：
    self.textLabel.textColor = selected ? JDColor2(219, 21, 26) : JDColor2(78, 78, 78);
}

@end
