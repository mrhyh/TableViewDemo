//
//  MJTableViewThreeVC.m
//  TableView
//
//  Created by ylgwhyh on 16/3/18.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "MJTableViewThreeVC.h"

@implementation MJTableViewThreeVC


#pragma mark TableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.row == 0){
        _labelOne.text = @"测试";
    }
}
@end
