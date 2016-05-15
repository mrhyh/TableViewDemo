//
//  MJTgCell.m
//  01-团购
//
//  Created by apple on 14-4-1.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MineMyOrderCell.h"
#import "MineMyOrderModel.h"
#import "UIImageView+WebCache.h"

@interface MineMyOrderCell()


@end

@implementation MineMyOrderCell

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *ID = @"tg";
    MineMyOrderCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        // 从xib中加载cell
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MineMyOrderCell" owner:nil options:nil] lastObject];
    }
    // 3.给cell设置新的数据
    cell.goodTitleLabel.text = @"天章(TANGO) 乐活A4";
    
    UIColor *mainColor = [UIColor redColor];
    
    cell.buyButton.layer.cornerRadius = 5;
    cell.buyButton.layer.borderColor = mainColor.CGColor;
    cell.buyButton.layer.borderWidth = 1;
    
    cell.afterSaleButton.layer.cornerRadius = 5;
    cell.afterSaleButton.layer.borderColor = mainColor.CGColor;
    cell.afterSaleButton.layer.borderWidth = 1;
    
    

    return cell;
}


- (void)setMineMyOrderModel:(MineMyOrderModel *)mineMyOrderModel
{
    _mineMyOrderModel = mineMyOrderModel;
    
    // 1.图片
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:mineMyOrderModel.iconImageUrlString] placeholderImage:[UIImage imageNamed:@"me.jpg"]];
    
    // 2.标题
    self.goodTitleLabel.text = mineMyOrderModel.goodTitle;
    
    // 3.价格
    self.orderPriceLabel.text = [NSString stringWithFormat:@"￥%@", mineMyOrderModel.orderPrice];
    
    // 4.购买数
    self.goodNumLabel.text = [NSString stringWithFormat:@"%@人已购买", mineMyOrderModel.goodNum];
    
    // 5.购买状态
    self.tradeStateLabel.text = mineMyOrderModel.tradeState;
}

- (void) setNameText:(NSString *)nameText{
    _nameText = nameText;
    self.goodNumLabel.text = nameText;
}

//- (void)setTitleView:(UILabel *)titleView{
//    _titleView = titleView;
//    self.titleView.text = self.nameText;
//}


@end
