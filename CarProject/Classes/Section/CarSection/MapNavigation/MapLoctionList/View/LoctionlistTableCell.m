//
//  LoctionlistTableCell.m
//  CarProject
//
//  Created by 董诗磊 on 2017/4/18.
//  Copyright © 2017年 董诗磊. All rights reserved.
//

#import "LoctionlistTableCell.h"

@implementation LoctionlistTableCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.xibloctionDistanceStr.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
    
    self.xibloctionNameStr.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(MapNavigationModel *)model
{

    self.xibloctionNameStr.text = model.locationNameStr;
    
    self.xibloctionAddressStr.text = model.addressStr;
    
    self.xibloctionDistanceStr.text = model.distanceStr;


}

@end
