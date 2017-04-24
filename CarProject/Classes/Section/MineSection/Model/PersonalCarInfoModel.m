//
//  PersonalCarInfoModel.m
//  CarProject
//
//  Created by 董诗磊 on 2017/4/20.
//  Copyright © 2017年 董诗磊. All rights reserved.
//

#import "PersonalCarInfoModel.h"

@implementation PersonalCarInfoModel

+ (instancetype)initWithContentStr:(NSString *)contentstsr TitleStr:(NSString *)titlestr{

    PersonalCarInfoModel * model = [[self alloc]init];
    
    model.titleLableStr = titlestr;
    
    model.contentStr = contentstsr;

    return model;
}

@end
