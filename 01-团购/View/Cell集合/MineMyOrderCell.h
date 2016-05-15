//
//  MineMyOrderCell.h
//  01-团购
//
//  Created by apple on 14-4-1.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MineMyOrderModel;

@interface MineMyOrderCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *goodTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *goodNumLabel;

@property (weak, nonatomic) IBOutlet UILabel *orderPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *tradeStateLabel;

@property (weak, nonatomic) IBOutlet UIButton *buyButton;

@property (weak, nonatomic) IBOutlet UIButton *afterSaleButton;

/**
 *  通过一个tableView来创建一个cell
 */
+ (instancetype)cellWithTableView:(UITableView *)tableView;

//要传入cell的属性，用这些去修改.m文件中的属性

/**
 *  团购模型
 */
@property (nonatomic, strong) MineMyOrderModel *mineMyOrderModel;

@property (nonatomic, strong) NSString *nameText;
@end
