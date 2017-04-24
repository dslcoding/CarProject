//
//  DrivinglicenseTableModel.h
//  CarProject
//
//  Created by 董诗磊 on 2017/4/19.
//  Copyright © 2017年 董诗磊. All rights reserved.
//

#import "CarTableCellModel.h"

@interface DrivinglicenseTableModel : CarTableCellModel

//这个是行驶证照model
+ (instancetype)initWithCarDriverLience:(NSString *)carEnginenumber TFPlaceholder:(NSString *)placeholder;

@end
