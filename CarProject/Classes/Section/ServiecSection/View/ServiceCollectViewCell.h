//
//  ServiceCollectViewCell.h
//  CarProject
//
//  Created by 董诗磊 on 2017/4/20.
//  Copyright © 2017年 董诗磊. All rights reserved.
//

#import "DSLCollectionViewCell.h"

#import "ServiceCollectModel.h"

@interface ServiceCollectViewCell : DSLCollectionViewCell

@property (nonatomic ,strong) UILabel * titleLable;

@property (nonatomic ,strong) ServiceCollectModel * model;


@end
