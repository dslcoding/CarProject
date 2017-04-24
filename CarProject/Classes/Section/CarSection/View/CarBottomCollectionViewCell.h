//
//  CarBottomCollectionViewCell.h
//  CarProject
//
//  Created by 董诗磊 on 2017/4/17.
//  Copyright © 2017年 董诗磊. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BottomCellModel.h"

@interface CarBottomCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UIImageView * cellImage;

@property (nonatomic, strong) UILabel * titleLable;

@property (nonatomic, strong) BottomCellModel * model;

@end
