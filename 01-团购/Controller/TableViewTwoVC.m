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
#import "MineMyOrderModel.h"
#import "UIImageView+WebCache.h"

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
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    _tableView.backgroundColor = RGB(214, 215, 215);
    [self.view addSubview:_tableView];
}


#pragma mark UITableView数据源代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 15;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //对于cell比较少，有复选功能时选择
    // 1.创建cell
    MineMyOrderCell *cell = [MineMyOrderCell cellWithTableView:tableView];
    
//    MineMyOrderModel *mineMyOrderModel;
//    mineMyOrderModel.goodTitle = @"商品标题";
//    mineMyOrderModel.goodNum = @"商品数量";
//    mineMyOrderModel.iconImageUrlString = @"http://m.360buyimg.com/mobilecms/s220x220_jfs/t1951/214/2703708839/200248/f76aa544/571603bbNf072b22e.jpg!q70.jpg";
//    mineMyOrderModel.tradeState = @"预定中";
//    mineMyOrderModel.orderPrice = @"124元";
//    // 2.给cell传递模型数据
//    cell.mineMyOrderModel = mineMyOrderModel;

    [cell.iconView sd_setImageWithURL:[NSURL URLWithString:@"http://m.360buyimg.com/mobilecms/s220x220_jfs/t1951/214/2703708839/200248/f76aa544/571603bbNf072b22e.jpg!q70.jpg"] placeholderImage:nil];
    cell.goodTitleLabel.text = @"商品标题";
    cell.goodNumLabel.text = @"商品数量";
    cell.goodTitleLabel.text = @"商品价格";
    cell.goodTitleLabel.text = @"商品状态";
    cell.tradeStateLabel.text = @"商品状态";
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 140;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if(section==0){ //第一个cell上面不需要分割线
        return 0.01;
    }else{
        return 15;
    }
    
}

#pragma mark ScrollViewDelegate（UITabbleView继承至它）

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    //这里让Header或Footer随cell滚动或不滚动（TableView有这个属性），系统默认分组的时候每组的Header会停留在tableview的顶部
    if (scrollView == self.tableView)
    {
        CGFloat sectionHeaderHeight = 10; //sectionHeaderHeight
        if (scrollView.contentOffset.y <= sectionHeaderHeight && scrollView.contentOffset.y >= 0) {
            
            scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
            
        } else if (scrollView.contentOffset.y >= sectionHeaderHeight) {
            
            scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
            
        }
    }
}

@end
