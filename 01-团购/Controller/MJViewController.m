//
//  MJViewController.m
//  01-团购
//
//  Created by apple on 14-4-1.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJViewController.h"
#import "MJTg.h"
#import "MJTgCell.h"
#import "MJTgFooterView.h"
#import "MJTgHeaderView.h"

@interface MJViewController () <UITableViewDataSource, MJTgFooterViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *tgs;
@end


@implementation MJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 设置每一行cell的高度
    self.tableView.rowHeight = 80;
    //设定cell分行线的样式，默认为UITableViewCellSeparatorStyleSingleLine
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    //设定cell分行线颜色
    [self.tableView setSeparatorColor:[UIColor redColor]];

    
    //编辑tableView
    self.tableView.editing = NO;

    //跳到指的row or section
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]
                        atScrollPosition:UITableViewScrollPositionBottom animated:NO];
    
    // 设置footerView
    MJTgFooterView *footer = [MJTgFooterView footerView];
    footer.delegate = self;
    self.tableView.tableFooterView = footer;
    
    // 设置headerView
    self.tableView.tableHeaderView = [MJTgHeaderView headerView];
    
    /*
    在ios7中使用group类型的tableview时，第一个section距离navigationbar的距离很大，不符合这边的设计图。使用 myTableView.sectionHeaderHeight = 8.0无效。需通过设置tableview的headerview高度来控制这个距离。使用的方法是：
    - ( CGFloat )tableView:( UITableView *)tableView heightForHeaderInSection:( NSInteger )section{
        return 8.0 ;
    }
    但对于第一个和第二个section之间的距离设置则不能使用- ( float )tableView:( UITableView *)tableView heightForFooterInSection:( NSInteger )section这个方法。需要使用
     myTableView.sectionFooterHeight = 1.0。 这个距离的计算是header的高度加上footer的高度。
     */
    self.tableView.sectionFooterHeight = 50;
    
    // 设置tableView尾部显示的控件(tableFooterView的宽度永远是tableView的宽度)
    // tableFooterView只需要设置高度
//    UIButton *footerBtn = [UIButton buttonWithType:UIButtonTypeSystem];
//    footerBtn.frame = CGRectMake(0, 0, 0, 35);
//    footerBtn.backgroundColor = [UIColor orangeColor];
//    [footerBtn setTitle:@"加载更多团购" forState:UIControlStateNormal];
    
//    UINib *nib = [UINib nibWithNibName:@"MJTgFooterView" bundle:[NSBundle mainBundle]];
    
    // 创建nib对象
//    UINib *nib = [UINib nibWithNibName:@"MJTgFooterView" bundle:nil];
//    
//    // 加载xib\nib
//    UIView *footerView = [[nib instantiateWithOwner:nil options:nil] lastObject];
//    self.tableView.tableFooterView = footerView;
    
    //如果是纯代码写的cell继承类，就要如此注册
    //[self.tableView registerClass:[seatPointCell class] forCellReuseIdentifier:@"seatPointCell12"];
    //如果是xib就像下面这种注册
    //[self.tableView registerNib:[UINib nibWithNibName:@"HYSelectedSeatNextCell" bundle:nil] forCellReuseIdentifier:@"cell1"];
}

#pragma mark - MJTgFooterViewDelegate方法
/**
 *  加载更多的数据
 */
- (void)tgFooterViewDidClickedLoadBtn:(MJTgFooterView *)tgFooterView
{
    //TODO 正常开发:发送网络请求给远程的服务器
    // 1.添加更多的模型数据
    MJTg *tg = [[MJTg alloc] init];
    tg.icon = @"ad_01";
    tg.title = @"新增加的团购数据..";
    tg.price = @"100";
    tg.buyCount = @"0";
    [self.tgs addObject:tg];
    
    // 2.刷新表格(告诉tableView重新加载模型数据, 调用tableView的reloadData)
    [self.tableView reloadData];
}

/**
 *  隐藏状态栏
 */
- (BOOL)prefersStatusBarHidden
{
    return NO;
}

/**
 *  数据的懒加载
 */
- (NSMutableArray *)tgs
{
    if (_tgs == nil) {
        // 初始化
        // 1.获得plist的全路径
        NSString *path = [[NSBundle mainBundle] pathForResource:@"tgs.plist" ofType:nil];
        
        // 2.加载数组
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
        
        // 3.将dictArray里面的所有字典转成模型对象,放到新的数组中
        NSMutableArray *tgArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            // 3.1.创建模型对象
            MJTg *tg = [MJTg tgWithDict:dict];
            
            // 3.2.添加模型对象到数组中
            [tgArray addObject:tg];
        }
        
        // 4.赋值
        _tgs = tgArray;
    }
    return _tgs;
}

#pragma mark - 数据源方法
/**
 *  一共有多少行数据
 */
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return self.tgs.count;
//}

//指定每个分区中有多少行，默认为1
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return 5; //每个分区通常对应不同的数组，返回其元素个数来确定分区的行数
            break;
            
        case 1:
            return  5;
            break;
            
        default:
            return 7;
            break;
    }
}

/**
 *  每一行显示怎样的cell
 */
//一个很基础但你没弄明白的一个问题：1)自定义cell中的所有属性都要写set方法，否则就无法赋值。如果是传的模型，就要写模型的set方法。2)同时，自定义cell也必须有它自己的创建方法
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1.创建cell
    MJTgCell *cell = [MJTgCell cellWithTableView:tableView];
    
    // 2.给cell传递模型数据
    cell.tg = self.tgs[indexPath.row]; //这种有数据显示
    
    //遇到多次的问题
    // 这样cell就没数据显示:因为MJTgCell中的属性是一个模型（暂时没弄清楚）
//    cell.tg.title = @"测试";
//    cell.tg.price = @"测试";
//    cell.tg.icon = @"测试";
//    cell.tg.buyCount = @"测试";
    //cell.nameText = @"测试NameText"; // 这样就OK了，因为写了它的set方法了！
    
    return cell;
}

//每个section显示的标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return @"section1";
        case 1:
            return @"section2";
        default:
            return [NSString stringWithFormat:@"Unknown%ld",(long)section];
    }

    //static NSString *CellIdentifier = @"Cell";
    
    /*
    //初始化cell并指定其类型，也可自定义cell
    UITableViewCell *cell = (UITableViewCell*)[tableView  dequeueReusableCellWithIdentifier:CellIdentifier];
    
    　　if(cell == nil)
        
        　　{
            
            　　cell = [[[UITableViewCellalloc]
                       
                       　　initWithFrame:CGRectZero
                       
                       　　reuseIdentifier:CellIdentifier] autorelease];
            
        }
    
    　　switch (indexPath.section) {
            
            　　case 0: //对应各自的分区
            
            　　　　[[cell textLabel]  setText:[dataArray1 objectAtIndex:indexPath.row]]; //给cell添加数据
            
            　　　　break;
            
            　　case 1:  
            
            　　　　[[cell textLabel]  setText:[dataArray2 objectAtIndex:indexPath.row]];  
            
            　　　　break;  
            
            　　default:  
            
            　　　　[[cell textLabel]  setText:@"Unknown"];  
            
    }
    　　return cell; //返回cell
     */
}

#pragma mark 返回每组尾部说明
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{

    return @"每组尾部说明";
}

//用以定制自定义的section头部视图－Header
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if(section == 1){
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectZero];
        headerView.backgroundColor = [UIColor blueColor];
        return headerView;
    }else {
        return nil;
    }
}

#pragma mark 侧边栏索引
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    NSLog(@"生成组索引");
    NSArray *indexs=[[NSArray alloc]init];
    indexs = @[@"A",@"B",@"C"];
    return indexs;
}

//用以定制自定义的section底部视图－Footer
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIImageView *imageView_=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 20)];
    imageView_.image=[UIImage imageNamed:@"1000.png"];
    return imageView_;
}



//指定有多少个分区(Section)，默认为1
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 15;//返回标题数组中元素的个数来确定分区的个数
}

//每个section底部标题高度（实现这个代理方法后前面 通过sectionHeaderHeight属性 设定的高度无效）
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if(section == 0){
        return 100;
    }else{
        return 20;
        //return 0.0001; //设置为极小值，不能设置为0，否者tableView会认为你没有设高度就会采取默认高度
    }
}

//每个section头部标题高度（实现这个代理方法后前面 通过sectionFooterHeight属性 设定的高度无效）
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 20;
}

//改变行的高度（实现主个代理方法后 rowHeight 设定的高度无效）（每行高度可以不一样）
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section  == 0){
        
        if(indexPath.row == 0){
            return 80;
        }else{
            return 80;
        }
    }else if (indexPath.section == 1) {
        return 80;
    }else if (indexPath.section == 2){
        return 80;
    }else{
        return 100;
    }
    
}

//移动row时执行
-(NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath
{
    NSLog(@"targetIndexPathForMoveFromRowAtIndexPath");
    //用于限制只在当前section下面才可以移动
    if(sourceIndexPath.section != proposedDestinationIndexPath.section){
        return sourceIndexPath;
    }
    return proposedDestinationIndexPath;
}

//将取消选中时执行, 也就是上次先中的行
-(NSIndexPath *)tableView:(UITableView *)tableView willDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"上次选中的行是  \n indexpath=%@",indexPath);
    return indexPath;
}

- (void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tgs removeObjectAtIndex:indexPath.row];
    [_tableView reloadData];
    NSLog(@"table 删除...");
}

- (NSString *) tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"删除";
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"选中了%ld",(long)indexPath.row);
     [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    // 不加此句时，在二级栏目点击返回时，此行会由选中状态慢慢变成非选中状态。
    // 加上此句，返回时直接就是非选中状态。

}


//编辑
- (void)setEditing:(BOOL)editing animated:(BOOL)animated{
    
}

//让行可以移动
-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

#pragma mark 重写状态样式方法
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

#pragma mark ScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    //这里让Header或Footer随cell滚动或不滚动（TableView有这个属性）
    
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
}

@end
