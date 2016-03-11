//
//  ReturnCallBackDelegate.h
//  qzc
//
//  Created by jxm apple on 16/3/6.
//  Copyright © 2016年 xinggenji. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@protocol ReturnCallBackDelegate <NSObject>

@required
- (void)returnCallBack:(UIViewController*)vc result:(id)result identifier:(NSString*)ID;

@end
