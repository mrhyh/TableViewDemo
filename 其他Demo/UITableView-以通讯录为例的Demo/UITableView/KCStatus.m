//
//  KCStatus.m
//  UITableView
//
//  Created by Kenshin Cui on 14-3-1.
//  Copyright (c) 2014年 Kenshin Cui. All rights reserved.
//

#import "KCStatus.h"

@implementation KCStatus

#pragma mark 根据字典初始化微博对象
-(KCStatus *)initWithDictionary:(NSDictionary *)dic{
    if(self=[super init]){
        self.Id=[dic[@"Id"] longLongValue];
        self.profileImageUrl=dic[@"profileImageUrl"];
        self.userName=dic[@"userName"];
        self.mbtype=dic[@"mbtype"];
        self.createdAt=dic[@"createdAt"];
        self.source=dic[@"source"];
        self.text=dic[@"text"];
    }
    return self;
}

#pragma mark 初始化微博对象（静态方法）
+(KCStatus *)statusWithDictionary:(NSDictionary *)dic{
    KCStatus *status=[[KCStatus alloc]initWithDictionary:dic];
    return status;
}

-(NSString *)source{
    return [NSString stringWithFormat:@"来自 %@",_source];
}
@end
