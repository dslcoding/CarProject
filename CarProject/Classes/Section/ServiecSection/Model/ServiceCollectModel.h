//
//  ServiceCollectModel.h
//  CarProject
//
//  Created by 董诗磊 on 2017/4/20.
//  Copyright © 2017年 董诗磊. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ServiceCollectModel : NSObject

@property (nonatomic ,strong) NSString * imageName;

@property (nonatomic ,strong) NSString * titleStr;

+ (instancetype)initWithImageName:(NSString *)imagename TitleStr:(NSString *)titlestr;

@end
