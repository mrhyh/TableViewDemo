//
//  TableViewTwo.m
//  TableView
//
//  Created by ylgwhyh on 16/5/14.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "TableViewTwoVC.h"
#import "Common.h"
#import "MineMyOrderCell.h"

@interface TableViewTwoVC()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation TableViewTwoVC

#ifdef DEBUG
- (void)injected
{
    [self viewDidLoad];
}
#endif


- (void)viewDidLoad{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}


#pragma mark UITableView数据源代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 15;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //对于cell比较少，有复选功能时选择
    //NSString *cellIdentifier = [NSString stringWithFormat:@"Cell%ld%ld", (long)[indexPath section], (long)[indexPath row]];
    // 1.创建cell
    MineMyOrderCell *cell = [MineMyOrderCell cellWithTableView:tableView];
    
    // 2.给cell传递模型数据
    //cell.tg = self.tgs[indexPath.row]; //这种有数据显示
//    @property (weak, nonatomic) IBOutlet UIImageView *iconView;
//    @property (weak, nonatomic) IBOutlet UILabel *goodTitleLabel;
//    @property (weak, nonatomic) IBOutlet UILabel *goodNumLabel;
//    
//    @property (weak, nonatomic) IBOutlet UILabel *orderPriceLabel;
//    @property (weak, nonatomic) IBOutlet UILabel *tradeStateLabel;
//    
//    @property (weak, nonatomic) IBOutlet UIButton *buyButton;
//    
//    @property (weak, nonatomic) IBOutlet UIButton *afterSaleButton;
    cell.iconView.image = [UIImage imageNamed:@"me.jpg"];
    cell.goodTitleLabel.text = @"商品标题";
    cell.goodNumLabel.text = @"商品数量";
    cell.goodTitleLabel.text = @"商品价格";
    cell.goodTitleLabel.text = @"商品状态";
    cell.tradeStateLabel.text = @"商品状态";
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 155;
}
@end
