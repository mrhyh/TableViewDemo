//
//  MJTgFooterView.h
//  01-团购
//
//  Created by apple on 14-4-1.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MJTgFooterView;

/**
 1.协议名称:  控件类名 + Delegate
 2.代理方法普遍都是@optional
 3.
 */

@protocol MJTgFooterViewDelegate <NSObject>
@optional
- (void)tgFooterViewDidClickedLoadBtn:(MJTgFooterView *)tgFooterView;
@end

@interface MJTgFooterView : UIView

/**
 *  快速创建一个footerView对象
 */
+ (instancetype)footerView;

@property (nonatomic, weak) id<MJTgFooterViewDelegate> delegate;

@end
