//
//  CarBottomTableViewCell.h
//  CarProject
//
//  Created by 董诗磊 on 2017/4/17.
//  Copyright © 2017年 董诗磊. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CarBottomTableViewCellDelegate <NSObject>
@optional

- (void)pushToVCWithIndex:(NSInteger)index;

@end

@interface CarBottomTableViewCell : UITableViewCell

@property (nonatomic ,assign) id<CarBottomTableViewCellDelegate>delegate;

@end
