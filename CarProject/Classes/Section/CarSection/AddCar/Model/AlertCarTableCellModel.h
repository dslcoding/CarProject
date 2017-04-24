//
//  AlertCarTableCellModel.h
//  CarProject
//
//  Created by 董诗磊 on 2017/4/19.
//  Copyright © 2017年 董诗磊. All rights reserved.
//

#import "CarTableCellModel.h"

@interface AlertCarTableCellModel : CarTableCellModel

//这个类是发动机号，车架号的model
+ (instancetype)initWithCarEngineNumberWithCarFrameNumber:(NSString *)carEnginenumber TFPlaceholder:(NSString *)placeholder;
@end
