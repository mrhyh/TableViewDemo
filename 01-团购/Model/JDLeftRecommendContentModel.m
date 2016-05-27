//
//  JDLeftRecommendContentModel.m
//  百思不得姐
//
//  Created by Chiang on 16/4/24.
//  Copyright © 2016年 Google. All rights reserved.
//

#import "JDLeftRecommendContentModel.h"

@implementation JDLeftRecommendContentModel

-(NSMutableArray *)rightContentsArray {
    if (!_rightContentsArray) {
        _rightContentsArray = [NSMutableArray array];
    }
    return _rightContentsArray;
}

@end
