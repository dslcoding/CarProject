//
//  CarTableCellModel.h
//  CarProject
//
//  Created by 董诗磊 on 2017/4/19.
//  Copyright © 2017年 董诗磊. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CarTableCellModel : NSObject

//车牌号
@property (nonatomic ,copy) NSString *addCarStr;

@property (nonatomic ,copy) NSString * placeholderStr;


//其实这里传一个参数就够了
//车牌号码，车型，备注
+ ( instancetype)initWithCarMdoelWihtCarRemark:(NSString *)addcarstr TFPlaceholder:(NSString *)placeholder;
@end
