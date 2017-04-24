//
//  AlertCarTableCellModel.m
//  CarProject
//
//  Created by 董诗磊 on 2017/4/19.
//  Copyright © 2017年 董诗磊. All rights reserved.
//

#import "AlertCarTableCellModel.h"

@implementation AlertCarTableCellModel


+ (instancetype)initWithCarEngineNumberWithCarFrameNumber:(NSString *)carEnginenumber TFPlaceholder:(NSString *)placeholder{
    

  AlertCarTableCellModel * model =  [super initWithCarMdoelWihtCarRemark:carEnginenumber TFPlaceholder:placeholder];
    
    return model;

}
@end
