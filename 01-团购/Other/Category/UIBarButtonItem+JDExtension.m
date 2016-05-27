//
//  UIBarButtonItem+JDExtension.m
//  百思不得姐
//
//  Created by Chiang on 16/4/23.
//  Copyright © 2016年 Google. All rights reserved.
//

#import "UIBarButtonItem+JDExtension.h"

@implementation UIBarButtonItem (JDExtension)

+(UIBarButtonItem *)createBarButtonItemWithNormalImageName:(NSString *)norImageName andHighlightedImageName:(NSString *)highImageName andTarget:(id)target andSelector:(SEL)selector {
    UIButton *btn = [[UIButton alloc] init];
    [btn setBackgroundImage:[UIImage imageNamed:norImageName] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:highImageName] forState:UIControlStateHighlighted];
    [btn sizeToFit];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    return item;
}

@end
