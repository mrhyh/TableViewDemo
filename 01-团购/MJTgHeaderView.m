//
//  MJTgHeaderView.m
//  01-团购
//
//  Created by apple on 14-4-1.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJTgHeaderView.h"


@interface MJTgHeaderView()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation MJTgHeaderView

+ (instancetype)headerView
{
     return [[[NSBundle mainBundle] loadNibNamed:@"MJTgHeaderView" owner:nil options:nil] lastObject];
//    headerView.scrollView
}

/**
 *  通过代码创建初始化一个对象的时候,才会调用这个方法
 */
//- init
//{
//    
//}

/**
 *  当一个对象从xib中创建初始化完毕的时候就会调用一次
 */
- (void)awakeFromNib
{
    // 在这里面添加图片轮播器
    
    
}

//- (id)initWithCoder:(NSCoder *)aDecoder
//{
//    
//}

@end
