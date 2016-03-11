//
//  BaseTableViewController.h
//  qzc
//
//  Created by jxm apple on 16/3/1.
//  Copyright © 2016年 xinggenji. All rights reserved.
//

#import "ReturnCallBackDelegate.h"
#import <UIKit/UIKit.h>

typedef void (^ReturnCallBack)(UIViewController* vc, id result, NSString* identifier);

@interface BaseTableViewController : UITableViewController <ReturnCallBackDelegate>
@property (nonatomic, copy) ReturnCallBack returnCallBack;
@property (nonatomic, weak) id<ReturnCallBackDelegate> returnCallBackDelegate;
@end
