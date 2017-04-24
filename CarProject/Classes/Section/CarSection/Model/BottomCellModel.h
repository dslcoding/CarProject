//
//  BottomCellModel.h
//  CarProject
//
//  Created by 董诗磊 on 2017/4/17.
//  Copyright © 2017年 董诗磊. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BottomCellModel : NSObject

@property (nonatomic, copy) NSString * Bottomtitle;

@property (nonatomic, copy) NSString * BottomimageName;

+(BottomCellModel *)initWithBottomTitle:(NSString *)bottomtitle
                        BottomImageName:(NSString *)bottomimagename;
@end
