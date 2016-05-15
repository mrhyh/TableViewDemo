//
//  MJViewController.m
//  04-英雄展示
//
//  Created by apple on 14-3-30.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "SystemTableViewCellVC.h"
#import "MJHero.h"

@interface SystemTableViewCellVC () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) NSArray *heros;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation SystemTableViewCellVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 表格的头部控件(直接显示表格的最顶部)
    self.tableView.tableHeaderView = [UIButton buttonWithType:UIButtonTypeContactAdd];
    self.tableView.tableFooterView = [[UISwitch alloc] init];
}


- (NSArray *)heros
{
    if (_heros == nil) {
        // 初始化
        // 1.获得plist的全路径
        NSString *path = [[NSBundle mainBundle] pathForResource:@"heros.plist" ofType:nil];
        
        // 2.加载数组
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
        
        // 3.将dictArray里面的所有字典转成模型对象,放到新的数组中
        NSMutableArray *heroArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            // 3.1.创建模型对象
            MJHero *hero = [MJHero heroWithDict:dict];
            
            // 3.2.添加模型对象到数组中
            [heroArray addObject:hero];
        }
        
        // 4.赋值
        _heros = heroArray;
    }
    return _heros;
}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.heros.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:nil];

    // 取出模型
    MJHero *hero = self.heros[indexPath.row];
    
    
    if(indexPath.row % 2 == 0){
        // 设置cell的数据
        cell.textLabel.text = hero.name;
        cell.detailTextLabel.text = hero.intro;
        cell.imageView.image = [UIImage imageNamed:hero.icon];
    }else{
        cell.textLabel.text = @"textLabel";
        cell.detailTextLabel.text = @"detailTextLabel";
        //cell.imageView.image = [UIImage imageNamed:hero.icon];
    }
    
    
    
    
    // 设置cell右边指示器的类型
//    if (indexPath.row % 2 == 0) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//    }
    
//    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
//    cell.accessoryView = [[UISwitch alloc] init];
    
    // 设置背景(背景view不用设置尺寸, backgroundView的优先级 > backgroundColor,一般用backgroundView)
    UIImageView *bgView = [[UIImageView alloc] init];
    bgView.image = [UIImage imageNamed:@"buttondelete"];
//    bgView.backgroundColor = [UIColor redColor];
    cell.backgroundView = bgView;
    
    UIView *selectedbgView = [[UIView alloc] init];
    selectedbgView.backgroundColor = [UIColor greenColor];
    cell.selectedBackgroundView = selectedbgView;
    
    return cell;
}

#pragma mark - 代理方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

@end
