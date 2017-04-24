//
//  CarTableCellModel.m
//  CarProject
//
//  Created by 董诗磊 on 2017/4/19.
//  Copyright © 2017年 董诗磊. All rights reserved.
//

#import "CarTableCellModel.h"

@implementation CarTableCellModel

+ (instancetype)initWithCarMdoelWihtCarRemark:(NSString *)addcarstr TFPlaceholder:(NSString *)placeholder{

    CarTableCellModel *model = [[self alloc]init];
  
    model.addCarStr = addcarstr;
    
    model.placeholderStr = placeholder;
    
    return model;

}

@end
