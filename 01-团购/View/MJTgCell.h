//
//  MJTgCell.h
//  01-团购
//
//  Created by apple on 14-4-1.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MJTg;

@interface MJTgCell : UITableViewCell

/**
 *  通过一个tableView来创建一个cell
 */
+ (instancetype)cellWithTableView:(UITableView *)tableView;

//要传入cell的属性，用这些去修改.m文件中的属性

/**
 *  团购模型
 */
@property (nonatomic, strong) MJTg *tg;

@property (nonatomic, strong) NSString *nameText;
@end
