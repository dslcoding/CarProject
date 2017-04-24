//
//  TopCellModel.h
//  CarProject
//
//  Created by 董诗磊 on 2017/4/17.
//  Copyright © 2017年 董诗磊. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TopCellModel : NSObject

//定位
@property (nonatomic, copy) NSString * locationStr;

//天气
@property (nonatomic, copy) NSString * weatherStr;

//违章
@property (nonatomic, copy) NSString * breakrulesStr;

// 罚款
@property (nonatomic, copy) NSString * fineStr;

//扣分
@property (nonatomic, copy) NSString * deductmarksStr;

@end
