//
//  ServiceCollectModel.m
//  CarProject
//
//  Created by 董诗磊 on 2017/4/20.
//  Copyright © 2017年 董诗磊. All rights reserved.
//

#import "ServiceCollectModel.h"

@implementation ServiceCollectModel

+(instancetype)initWithImageName:(NSString *)imagename TitleStr:(NSString *)titlestr
{

    ServiceCollectModel * model = [[self alloc]init];
    
    model.imageName = imagename;
    
    model.titleStr = titlestr;
    
    return model;

}

@end
