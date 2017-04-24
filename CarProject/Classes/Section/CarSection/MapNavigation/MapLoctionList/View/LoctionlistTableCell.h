//
//  LoctionlistTableCell.h
//  CarProject
//
//  Created by 董诗磊 on 2017/4/18.
//  Copyright © 2017年 董诗磊. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoctionlistTableCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *xibloctionNameStr;
@property (weak, nonatomic) IBOutlet UILabel *xibloctionDistanceStr;
@property (weak, nonatomic) IBOutlet UILabel *xibloctionAddressStr;

@property (nonatomic ,strong) MapNavigationModel * model;

@end
