//
//  MJViewController.m
//  01-团购
//
//  Created by apple on 14-4-1.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "TableViewVC.h"

#import "MJModel.h"
#import "MJTgCell.h"

#import "MJTgFooterView.h"
#import "MJTgHeaderView.h"

@interface TableViewVC ()  <UITableViewDataSource, MJTgFooterViewDelegate>

@property (weak,  nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *tgs;
@property (nonatomic, weak)  NSIndexPath *selectedIndexPath;//当前选中的组和行
@property (nonatomic, assign) BOOL *isInsert;

@end


@implementation TableViewVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 设置每一行cell的高度
    self.tableView.rowHeight = 80;
    //设定cell分行线的样式，默认为UITableViewCellSeparatorStyleSingleLine
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    //self.tableView.allowsSelection = NO;
    //设定cell分行线颜色
    [self.tableView setSeparatorColor:[UIColor redColor]];
    self.tableView.separatorInset = UIEdgeInsetsMake(0,80, 0, 80);        // 设置cell端距，这里表示separator离左边和右边均80像素
    //编辑tableView
    self.tableView.editing = NO;
    self.tableView.allowsSelection = YES;
    //跳到指的row or section
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]
                        atScrollPosition:UITableViewScrollPositionBottom animated:NO];
    
    // 设置footerView
    MJTgFooterView *footer = [MJTgFooterView footerView];
    footer.delegate = self;
    self.tableView.tableFooterView = footer;
#pragma mark 去掉tableView滚动到底部时的空白，对于某些时候tableView底部有空白的情况
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
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
    
#warning mark 从Xib加载View
    // 创建nib对象
//    UINib *nib = [UINib nibWithNibName:@"MJTgFooterView" bundle:nil];
//    // 加载xib\nib
//    UIView *footerView = [[nib instantiateWithOwner:nil options:nil] lastObject];
//    self.tableView.tableFooterView = footerView;
    
#pragma mark 注册Cell
    //如果是纯代码写的cell，就要如此注册
    //[self.tableView registerClass:[seatPointCell class] forCellReuseIdentifier:@"seatPointCell12"];
    //如果是xib就像下面这种注册
    //[self.tableView registerNib:[UINib nibWithNibName:@"HYSelectedSeatNextCell" bundle:nil] forCellReuseIdentifier:@"cell1"];
}

#pragma mark - MJTgFooterViewDelegate方法
#pragma mark 加载更多的数据
- (void)tgFooterViewDidClickedLoadBtn:(MJTgFooterView *)tgFooterView
{
    //TODO 正常开发:发送网络请求给远程的服务器
    // 1.添加更多的模型数据
    MJModel *tg = [[MJModel alloc] init];
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
            MJModel *tg = [MJModel tgWithDict:dict];
            // 3.2.添加模型对象到数组中
            [tgArray addObject:tg];
        }
        
        // 4.赋值
        _tgs = tgArray;
    }
    return _tgs;
}


#pragma mark - UITableView数据源方法

#pragma mark 每个分区中有多少行,默认为1
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSLog(@"%lu",(unsigned long)self.tgs.count); //用于出发tgs的初始化方法
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

#pragma mark TableView 优化的关键代码

// 离开屏幕的cell会怎样

/**
 *  每当有一个cell进入视野范围内,就会调用
 */

//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)方法调用很频繁，无论是初始化、上下滚动、刷新都会调用此方法，所有在这里执行的操作一定要注意性能；
//可重用标识可以有多个，如果在UITableView中有多类结构不同的Cell，可以通过这个标识进行缓存和重新；

#pragma mark 每一行显示怎样的cell
//一个很基础但你没弄明白的一个问题：1)自定义cell中的所有属性都要写set方法，否则可能就无法赋值。如果是传的模型，就要写模型的set方法。2)同时，自定义cell也必须有它自己的创建方法
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //对于cell比较少，有复选功能时选择给每个cell不同的Identifier，当然最好添加一个辅助属性
    //NSString *cellIdentifier = [NSString stringWithFormat:@"Cell%ld%ld", (long)[indexPath section], (long)[indexPath row]];
#warning mark 自定义Cell
    // 1.创建cell
    MJTgCell *cell = [MJTgCell cellWithTableView:tableView];
    
    //设置cell的选中属性为如下就没有点击效果了
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    // 2.给cell传递模型数据
    cell.tg = self.tgs[indexPath.row]; //这种有数据显示

#pragma mark 让某一个cell处于选中状态
//    if(indexPath.section == 3){
//        NSIndexPath *path = [NSIndexPath indexPathForItem:0 inSection:3];
//        [self.tableView selectRowAtIndexPath:path animated:NO  scrollPosition:UITableViewScrollPositionTop];
//    }
    

    return cell;
#pragma mark  创建系统Cell
    /*
    //NSIndexPath是一个对象，记录了组和行信息
    NSLog(@"生成单元格(组：%li,行%li)",(long)indexPath.section,(long)indexPath.row);
    
    //由于此方法调用十分频繁，cell的标示声明成静态变量有利于性能优化
    static NSString *cellIdentifier=@"UITableViewCellIdentifierKey1";
    //首先根据标识去缓存池取
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    //如果缓存池没有到则重新创建并放到缓存池中
    if(!cell){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text=[contact getName];
    cell.detailTextLabel.text=contact.phoneNumber;
    NSLog(@"cell:%@",cell);
    return cell;
     */
}

#pragma mark 每个section显示的标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    switch (section) {
        case 0:
            return @"section1";
        case 1:
            return @"section2";
        default:
            return [NSString stringWithFormat:@"Unknown%ld",(long)section];
    }
}

#pragma mark 返回每组尾部说明
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    
    return @"每组尾部说明";
}

#pragma mark 用以定制自定义的section头部视图－Header
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
/**
 *  返回右边索引条显示的字符串数据
 */
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    NSLog(@"生成组索引");
    
//    NSArray *indexs=[[NSArray alloc]init];
//    indexs = @[@"A",@"B",@"C"];
//    return indexs;
    
    return [_tgs valueForKeyPath:@"title"];
    
    /*
     //    MJCarGroup *group = self.groups[0];
     //    [self.groups valueForKey:@"title"]; //只能取第一级目录，不能找"groups"的次级目录,不要用这个
     return [self.groups valueForKeyPath:@"title"]; // 可以间接取值，如果"groups"中没有"title"，它会找"groups"的子目录
     */
}

#pragma mark 用以定制自定义的section底部视图－Footer
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    UIImageView *imageView_=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 20)];
    imageView_.image=[UIImage imageNamed:@"1000.png"];
    return imageView_;
}

#pragma mark 指定有多少个分区(Section)，默认为1
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 15;//返回标题数组中元素的个数来确定分区的个数
}

#pragma mark 每个section底部标题高度
//（实现这个代理方法后前面 通过sectionHeaderHeight属性 设定的高度无效）
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if(section == 0){
        return 100;
    }else{
        return 20;
        //return 0.0001; //设置为极小值，不能设置为0，否者tableView会认为你没有设高度就会采取默认高度
    }
}

#pragma mark 每个section头部标题高度
//（实现这个代理方法后前面 通过sectionFooterHeight属性 设定的高度无效）
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 20;
}

#pragma mark 改变行的高度（实现主个代理方法后 rowHeight 设定的高度无效）（每行高度可以不一样）
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

#pragma mark 移动row时执行
-(NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath
{
    NSLog(@"targetIndexPathForMoveFromRowAtIndexPath");
    //用于限制只在当前section下面才可以移动
    if(sourceIndexPath.section != proposedDestinationIndexPath.section){
        return sourceIndexPath;
    }
    return proposedDestinationIndexPath;
}

#pragma mark 将取消选中时执行, 也就是上次先中的行
-(NSIndexPath *)tableView:(UITableView *)tableView willDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"上次选中的行是  \n indexpath=%@",indexPath);
    return indexPath;
}

#pragma mark 左滑删除
//实现了此方法向左滑动就会显示删除按钮
- (void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle==UITableViewCellEditingStyleDelete) {
       
        //考虑到性能这里不建议使用reloadData
        //[_tableView reloadData];
        
        //使用下面的方法既可以局部刷新又有动画效果
        //使用这个方法可以在删除之后刷新对应的单元格
#pragma mark 左滑删除 一定要先移除数据源中要删除的数据
        [self.tgs removeObjectAtIndex:indexPath.row];
        [_tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationBottom];
        
        #pragma mark 左滑删除,如果section中只有一项，要删除section， 一定要先移除数据源中保存这个section的数据。
        /*
        weakSelf.dataArray 是一个二维数据，做一个Demo
        NSArray *array = weakSelf.dataArray[indexPath.section];
        if(array.count == 1) {
            //在UITableView中同时删除row和section
            [weakSelf.dataArray removeObjectAtIndex:indexPath.section];
            [weakSelf.tableView deleteSections: [NSIndexSet indexSetWithIndex: indexPath.section] withRowAnimation:UITableViewRowAnimationAutomatic];
        }else {
            //删除row
            [weakSelf.dataArray[indexPath.section] removeObjectAtIndex:indexPath.row];
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        }
         */
        
        //如果当前组中没有数据则移除组刷新整个表格(以联系人举例)
//        if (group.contacts.count==0) {
//            [_contacts removeObject:group];
//            [tableView reloadData];
//        }
        NSLog(@"table 删除...");
    }
    
    //插入数据并刷新，仅仅参考，代码从别处复制
//    else if(editingStyle==UITableViewCellEditingStyleInsert){
//        KCContact *newContact=[[KCContact alloc]init];
//        newContact.firstName=@"first";
//        newContact.lastName=@"last";
//        newContact.phoneNumber=@"12345678901";
//        [group.contacts insertObject:newContact atIndex:indexPath.row];
//        [tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationBottom];//注意这里没有使用reladData刷新
//    }
   
}

#pragma mark 取得当前操作状态，根据不同的状态左侧出现不同的操作按钮
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (_isInsert) {
        return UITableViewCellEditingStyleInsert;
    }
    return UITableViewCellEditingStyleDelete;
}

#pragma mark 删除左滑时显示的文字
- (NSString *) tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"删除";
}

#pragma mark 选中cell时的操作
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"选中了%ld",(long)indexPath.row);
    _selectedIndexPath = indexPath; //记录选中的组和行
    // 不加此句时，在二级栏目点击返回时，此行会由选中状态慢慢变成非选中状态。
    // 加上此句，返回时直接就是非选中状态。
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    MJModel *didSelectMJTg = self.tgs[indexPath.row];
    
    //创建弹出窗口
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"修改信息" message:nil  delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    
    alert.alertViewStyle=UIAlertViewStylePlainTextInput; //设置窗口内容样式
    UITextField *textField= [alert textFieldAtIndex:0]; //取得文本框
    textField.text= didSelectMJTg.title; //设置文本框内容
    alert.tag = indexPath.row;
    [alert show]; //显示窗口

}


//编辑
- (void)setEditing:(BOOL)editing animated:(BOOL)animated{
    
}

#pragma mark 让行可以移动
-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

#pragma mark 重写状态样式方法
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

#pragma mark 排序
-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    
    //代码仅仅参考
    //只要实现这个方法在编辑状态右侧就有排序图标
    //    KCContactGroup *sourceGroup =_contacts[sourceIndexPath.section];
    //    KCContact *sourceContact=sourceGroup.contacts[sourceIndexPath.row];
    //    KCContactGroup *destinationGroup =_contacts[destinationIndexPath.section];
    //
    //    [sourceGroup.contacts removeObject:sourceContact];
    //    if(sourceGroup.contacts.count==0){
    //        [_contacts removeObject:sourceGroup];
    //        [tableView reloadData];
    //    }
    //
    //    [destinationGroup.contacts insertObject:sourceContact atIndex:destinationIndexPath.row];
}

#pragma mark 设置cell颜色
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row % 2)
    {
        [cell setBackgroundColor:[UIColor colorWithRed:.8 green:.8 blue:1 alpha:1]];
    }else {
        [cell setBackgroundColor:[UIColor clearColor]];
    }
    cell.textLabel.backgroundColor = [UIColor clearColor];
    cell.detailTextLabel.backgroundColor = [UIColor clearColor];
}

#pragma mark TableView所有的刷新
//通过前面的演示这里简单总结一些UITableView的刷新方法：
//
//- (void)reloadData;刷新整个表格。
//
//- (void)reloadRowsAtIndexPaths:(NSArray *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation NS_AVAILABLE_IOS(3_0);刷新指定的分组和行。
//
//- (void)reloadSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation NS_AVAILABLE_IOS(3_0);刷新指定的分组。
//
//- (void)deleteRowsAtIndexPaths:(NSArray *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation;删除时刷新指定的行数据。
//
//- (void)insertRowsAtIndexPaths:(NSArray *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation;添加时刷新指定的行数据。


#pragma mark ScrollViewDelegate（UITabbleView继承至它）
#pragma mark 这里让Header或Footer随cell滚动或不滚动（TableView有这个属性）不过有点问题
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

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
}

#pragma mark TextFieldDelegate
#pragma mark 窗口的代理方法，用户保存数据
/**
 *  点击了alertView上面的按钮就会调用这个方法
 *
 *  @param buttonIndex 按钮的索引,从0开始
 */
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
     if (buttonIndex == 0) return;
    //当点击了第二个按钮（OK）
    if (buttonIndex==1) {
        
        // 1.取得文本框最后的文字
        NSString *title = [alertView textFieldAtIndex:0].text;
        
        // 2.修改模型数据
        int row = (int)alertView.tag;
        MJModel *mjTg = self.tgs[row];
        mjTg.title = title;
        
        
        // 3.告诉tableView重新加载模型数据
        // reloadData : tableView会向数据源重新请求数据
        // 重新调用数据源的相应方法取得数据
        // 重新调用数据源的tableView:numberOfRowsInSection:获得行数
        // 重新调用数据源的tableView:cellForRowAtIndexPath:得知每一行显示怎样的cell
        // 全部刷新,改动大时才用
        //    [self.tableView reloadData];

        //section刷新 (section的header、footer、row数据都会刷新)
        NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:2]; //2是section的值
        [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
        
        // 需要局部刷新的单元格的组、行(刷新指定的分组和行)
        NSIndexPath *path = [NSIndexPath indexPathForItem:row inSection:_selectedIndexPath.section];
        [self.tableView reloadRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationLeft] ; //后面的参数代码更新时的动画
    }
}


@end
