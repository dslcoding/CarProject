//
//  PersonalCarInfoModel.h
//  CarProject
//
//  Created by 董诗磊 on 2017/4/20.
//  Copyright © 2017年 董诗磊. All rights reserved.
//

#import "MineTableModel.h"

@interface PersonalCarInfoModel : NSObject

@property (nonatomic ,copy) NSString * titleLableStr;

@property (nonatomic ,copy) NSString * contentStr;

+ (instancetype)initWithContentStr:(NSString *)contentstsr TitleStr:(NSString *)titlestr;

@end
