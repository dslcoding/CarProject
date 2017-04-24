//
//  BottomCellModel.m
//  CarProject
//
//  Created by 董诗磊 on 2017/4/17.
//  Copyright © 2017年 董诗磊. All rights reserved.
//

#import "BottomCellModel.h"

@implementation BottomCellModel




+(BottomCellModel *)initWithBottomTitle:(NSString *)bottomtitle
                        BottomImageName:(NSString *)bottomimagename{

    BottomCellModel * model = [[BottomCellModel alloc]init];
    
    model.Bottomtitle = bottomtitle;
    
    model.BottomimageName = bottomimagename;
    
    
    return model;



}
@end
