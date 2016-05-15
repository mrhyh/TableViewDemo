//
//  MJTVThreeOneVC.h
//  TableView
//
//  Created by ylgwhyh on 16/3/18.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MJTVThreeOneVC;

@protocol MJTVThreeOneVCDelegate <NSObject>

@optional

- (void)categoryVC:(MJTVThreeOneVC *)vc didSelectedCategoryLevelOne:(NSString *)levelOne levelTwo:(NSString *)levelTwo levelThree:(NSString *)levelThree levelTwoIDS:(NSString *)ids;
@end

@interface MJTVThreeOneVC : UIViewController

@property (weak ,nonatomic) id <MJTVThreeOneVCDelegate> delegate;

@end
