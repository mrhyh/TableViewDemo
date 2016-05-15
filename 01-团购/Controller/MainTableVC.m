//
//  MainTableVC.m
//  TableView
//
//  Created by ylgwhyh on 16/3/10.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "MainTableVC.h"
#import "TableViewTwoVC.h"

typedef NS_ENUM(NSInteger, MainTableViewCell){
    MainTableViewCellOne = 0,
    MainTableViewCellTwo = 1,
    MainTableViewCellThree = 2,
    MainTableViewCellFour = 3,
};

@interface MainTableVC()

@end

@implementation MainTableVC

#ifdef DEBUG
- (void)injected
{
    [self viewDidLoad];
}
#endif

- (void)viewDidLoad{
    
}

#pragma mark UITableViewDelegate 

- (NSInteger)tableView:(UITableView *)tableView{
    return 10;
}

//storyBoard和代码中都可以有跳转，代码中在如下写
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row == MainTableViewCellThree){
        TableViewTwoVC *next = [[TableViewTwoVC alloc] init];
        [self.navigationController pushViewController:next animated:YES];
    }
}


@end
