//
//  MJTgCell.m
//  01-团购
//
//  Created by apple on 14-4-1.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MineMyOrderCell.h"
#import "MineMyOrderModel.h"

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

- (void)setTg:(MineMyOrderModel *)tg
{
    _tg = tg;
    
    // 1.图片
    self.iconView.image = [UIImage imageNamed:tg.icon];
    
    // 2.标题
    self.goodTitleLabel.text = tg.title;
    
    // 3.价格
    self.orderPriceLabel.text = [NSString stringWithFormat:@"￥%@", tg.price];
    
    // 4.购买数
    self.goodNumLabel.text = [NSString stringWithFormat:@"%@人已购买", tg.buyCount];
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
