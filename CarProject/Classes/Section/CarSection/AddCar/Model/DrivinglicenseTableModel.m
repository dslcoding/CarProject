//
//  DrivinglicenseTableModel.m
//  CarProject
//
//  Created by 董诗磊 on 2017/4/19.
//  Copyright © 2017年 董诗磊. All rights reserved.
//

#import "DrivinglicenseTableModel.h"

@implementation DrivinglicenseTableModel

+ (instancetype)initWithCarDriverLience:(NSString *)cardriverlience TFPlaceholder:(NSString *)placeholder{
    
    DrivinglicenseTableModel * model = [super initWithCarMdoelWihtCarRemark:cardriverlience TFPlaceholder:placeholder];
    
    return model;

}

@end
