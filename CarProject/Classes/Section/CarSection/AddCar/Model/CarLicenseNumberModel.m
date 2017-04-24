//
//  CarLicenseNumberModel.m
//  CarProject
//
//  Created by 董诗磊 on 2017/4/20.
//  Copyright © 2017年 董诗磊. All rights reserved.
//

#import "CarLicenseNumberModel.h"

@implementation CarLicenseNumberModel
+ (instancetype)initWithCarLicenseNumber:(NSString *)carLicenseNumber TFPlaceholder:(NSString *)placeholder{
    
    CarLicenseNumberModel * model = [super initWithCarMdoelWihtCarRemark:carLicenseNumber TFPlaceholder:placeholder];
    
    NSLog(@"===dddd====%@",model);
    
    return model;
    
}

@end
