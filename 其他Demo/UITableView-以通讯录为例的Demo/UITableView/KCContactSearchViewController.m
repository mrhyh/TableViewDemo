//
//  KCContactViewController.m
//  UITableView
//
//  Created by Kenshin Cui on 14-3-1.
//  Copyright (c) 2014年 Kenshin Cui. All rights reserved.
//

#import "KCContactSearchViewController.h"
#import "KCContact.h"
#import "KCContactGroup.h"
#define kSearchbarHeight 44

@interface KCContactSearchViewController ()<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>{
    UITableView *_tableView;
    UISearchBar *_searchBar;
    UISearchDisplayController *_searchDisplayController;
    NSMutableArray *_contacts;//联系人模型
}

@end

@implementation KCContactSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化数据
    [self initData];
    
    //创建一个分组样式的UITableView
    _tableView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [self.view addSubview:_tableView];

    //添加搜索框
    [self addSearchBar];
    
    //设置数据源，注意必须实现对应的UITableViewDataSource协议
    _tableView.dataSource=self;
    //设置代理
    _tableView.delegate=self;
    
    
}

#pragma mark 加载数据
-(void)initData{
    _contacts=[[NSMutableArray alloc]init];
    
    KCContact *contact1=[KCContact initWithFirstName:@"Cui" andLastName:@"Kenshin" andPhoneNumber:@"18500131234"];
    KCContact *contact2=[KCContact initWithFirstName:@"Cui" andLastName:@"Tom" andPhoneNumber:@"18500131237"];
    KCContactGroup *group1=[KCContactGroup initWithName:@"C" andDetail:@"With names beginning with C" andContacts:[NSMutableArray arrayWithObjects:contact1,contact2, nil]];
    [_contacts addObject:group1];
    
    
    
    KCContact *contact3=[KCContact initWithFirstName:@"Lee" andLastName:@"Terry" andPhoneNumber:@"18500131238"];
    KCContact *contact4=[KCContact initWithFirstName:@"Lee" andLastName:@"Jack" andPhoneNumber:@"18500131239"];
    KCContact *contact5=[KCContact initWithFirstName:@"Lee" andLastName:@"Rose" andPhoneNumber:@"18500131240"];
    KCContactGroup *group2=[KCContactGroup initWithName:@"L" andDetail:@"With names beginning with L" andContacts:[NSMutableArray arrayWithObjects:contact3,contact4,contact5, nil]];
    [_contacts addObject:group2];
    
    
    
    KCContact *contact6=[KCContact initWithFirstName:@"Sun" andLastName:@"Kaoru" andPhoneNumber:@"18500131235"];
    KCContact *contact7=[KCContact initWithFirstName:@"Sun" andLastName:@"Rosa" andPhoneNumber:@"18500131236"];
    
    KCContactGroup *group3=[KCContactGroup initWithName:@"S" andDetail:@"With names beginning with S" andContacts:[NSMutableArray arrayWithObjects:contact6,contact7, nil]];
    [_contacts addObject:group3];
    
    
    KCContact *contact8=[KCContact initWithFirstName:@"Wang" andLastName:@"Stephone" andPhoneNumber:@"18500131241"];
    KCContact *contact9=[KCContact initWithFirstName:@"Wang" andLastName:@"Lucy" andPhoneNumber:@"18500131242"];
    KCContact *contact10=[KCContact initWithFirstName:@"Wang" andLastName:@"Lily" andPhoneNumber:@"18500131243"];
    KCContact *contact11=[KCContact initWithFirstName:@"Wang" andLastName:@"Emily" andPhoneNumber:@"18500131244"];
    KCContact *contact12=[KCContact initWithFirstName:@"Wang" andLastName:@"Andy" andPhoneNumber:@"18500131245"];
    KCContactGroup *group4=[KCContactGroup initWithName:@"W" andDetail:@"With names beginning with W" andContacts:[NSMutableArray arrayWithObjects:contact8,contact9,contact10,contact11,contact12, nil]];
    [_contacts addObject:group4];
    
    
    KCContact *contact13=[KCContact initWithFirstName:@"Zhang" andLastName:@"Joy" andPhoneNumber:@"18500131246"];
    KCContact *contact14=[KCContact initWithFirstName:@"Zhang" andLastName:@"Vivan" andPhoneNumber:@"18500131247"];
    KCContact *contact15=[KCContact initWithFirstName:@"Zhang" andLastName:@"Joyse" andPhoneNumber:@"18500131248"];
    KCContactGroup *group5=[KCContactGroup initWithName:@"Z" andDetail:@"With names beginning with Z" andContacts:[NSMutableArray arrayWithObjects:contact13,contact14,contact15, nil]];
    [_contacts addObject:group5];
    
}

#pragma mark 添加搜索栏
-(void)addSearchBar{
    CGRect searchBarRect=CGRectMake(0, 0, self.view.frame.size.width, kSearchbarHeight);
    _searchBar=[[UISearchBar alloc]initWithFrame:searchBarRect];
    _searchBar.placeholder=@"Please input key word...";
//    _searchBar.keyboardType=UIKeyboardTypeAlphabet;
//    _searchBar.autocorrectionType=UITextAutocorrectionTypeNo;
//    _searchBar.autocapitalizationType=UITextAutocapitalizationTypeNone;
    _tableView.tableHeaderView=_searchBar;

}

#pragma mark - 数据源方法
#pragma mark 返回分组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _contacts.count;
}

#pragma mark 返回每组行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    KCContactGroup *group1=_contacts[section];
    return group1.contacts.count;
}

#pragma mark返回每行的单元格
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //NSIndexPath是一个对象，记录了组和行信息
    KCContactGroup *group=_contacts[indexPath.section];
    KCContact *contact=group.contacts[indexPath.row];

    static NSString *cellIdentifier=@"UITableViewCellIdentifierKey1";

    //首先根据标示去缓存池取
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    //如果缓存池没有取到则重新创建并放到缓存池中
    if(!cell){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text=[contact getName];
    cell.detailTextLabel.text=contact.phoneNumber;
    
    return cell;
}
//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    CGRect searchBarRect=CGRectMake(0, 0, self.view.frame.size.width, kSearchbarHeight);
//    _searchBar=[[UISearchBar alloc]initWithFrame:searchBarRect];
//    _searchBar.placeholder=@"Please input key word...";
//    //    _searchBar.keyboardType=UIKeyboardTypeAlphabet;
//    //    _searchBar.autocorrectionType=UITextAutocorrectionTypeNo;
//    //    _searchBar.autocapitalizationType=UITextAutocapitalizationTypeNone;
//    return _searchBar;
//
//}

#pragma mark - 代理方法
#pragma mark 设置分组标题
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    KCContactGroup *group=_contacts[section];
    return group.name;
}

#pragma mark 重写状态样式方法
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

@end
