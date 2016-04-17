//
//  MJTgCell.m
//  01-团购
//
//  Created by apple on 14-4-1.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJTgCell.h"
#import "MJTg.h"

@interface MJTgCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleView;
@property (weak, nonatomic) IBOutlet UILabel *priceView;
@property (weak, nonatomic) IBOutlet UILabel *buyCountView;

@end

@implementation MJTgCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
     //由于此方法调用十分频繁，cell的标示声明成静态变量有利于性能优化
    // static修饰局部变量:可以保证局部变量只分配一次存储空间(只初始化一次)
    static NSString *ID = @"tg";
    
    // 1.通过一个标识去缓存池中寻找可循环利用的cell
    // dequeue : 出列 (查找)
    MJTgCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    // 2.如果没有可循环利用的cell
    if (cell == nil) {
        // 从xib中加载cell
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MJTgCell" owner:nil options:nil] lastObject];
        // cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    // 3.给cell设置新的数据
    cell.titleView.text = cell.nameText;
    return cell;
}

- (void)setTg:(MJTg *)tg
{
    _tg = tg;
    
    // 1.图片
    self.iconView.image = [UIImage imageNamed:tg.icon];
    
    // 2.标题
    self.titleView.text = tg.title;
    
    // 3.价格
    self.priceView.text = [NSString stringWithFormat:@"￥%@", tg.price];
    
    // 4.购买数
    self.buyCountView.text = [NSString stringWithFormat:@"%@人已购买", tg.buyCount];
}

- (void) setNameText:(NSString *)nameText{
    _nameText = nameText;
    self.titleView.text = nameText;
}

- (void)setTitleView:(UILabel *)titleView{
    _titleView = titleView;
    self.titleView.text = self.nameText;
}





@end
