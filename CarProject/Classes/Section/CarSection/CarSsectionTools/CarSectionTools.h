//
//  CarSectionTools.h
//  CarProject
//
//  Created by 董诗磊 on 2017/4/17.
//  Copyright © 2017年 董诗磊. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef  void(^loctionOption)(NSString * loctionCity);

@interface CarSectionTools : NSObject

+(CarSectionTools *)sharetools;

- (void)loctionStr:(loctionOption)option;
@end
