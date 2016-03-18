//
//  MJTgFooterView.m
//  01-团购
//
//  Created by apple on 14-4-1.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJTgFooterView.h"

@interface MJTgFooterView()
- (IBAction)loadBtnClick;
@property (weak, nonatomic) IBOutlet UIButton *loadBtn;
@property (weak, nonatomic) IBOutlet UIView *loadingView;
@end

@implementation MJTgFooterView

+ (instancetype)footerView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"MJTgFooterView" owner:nil options:nil] lastObject];
}

/**
 *  点击"加载"按钮
 */
- (IBAction)loadBtnClick {
    // 1.隐藏加载按钮
    self.loadBtn.hidden = YES;
    
    // 2.显示"正在加载"
    self.loadingView.hidden = NO;
    
    // 3.显示更多的数据
    // GCD
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{ // 3.0s后执行block里面的代码
        // 通知代理
        if ([self.delegate respondsToSelector:@selector(tgFooterViewDidClickedLoadBtn:)]) {
            [self.delegate tgFooterViewDidClickedLoadBtn:self];
        }
        
        // 4.显示加载按钮
        self.loadBtn.hidden = NO;
        
        // 5.隐藏"正在加载"
        self.loadingView.hidden = YES;
    });
}
@end
