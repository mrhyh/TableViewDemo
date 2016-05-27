//
//  UIBarButtonItem+JDExtension.h
//  百思不得姐
//
//  Created by Chiang on 16/4/23.
//  Copyright © 2016年 Google. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (JDExtension)

/**
 *  通过自定义的button创建barButtonItem：
 *
 *  @param norImageName  普通状态图片：
 *  @param highImageName 高亮状态图片：
 *  @param target        目标：
 *  @param selector      执行的方法。
 *
 *  @return 
 */
+(UIBarButtonItem *)createBarButtonItemWithNormalImageName:(NSString *)norImageName andHighlightedImageName:(NSString *)highImageName andTarget:(id)target andSelector:(SEL)selector;

@end
