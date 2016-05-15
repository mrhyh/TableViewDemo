//
//  MainViewController.m
//  TableView
//
//  Created by ylgwhyh on 16/3/10.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "MainViewController.h"
#import "MJTableViewThreeVC.h"

@interface MainViewController ()

- (IBAction)btnThree:(id)sender;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)btnThree:(id)sender {
    
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Login" bundle:nil];
    MJTableViewThreeVC *next = [story instantiateViewControllerWithIdentifier:@"MJTableViewThreeVCID"];
    [self.navigationController pushViewController:next animated:YES];
}
@end
