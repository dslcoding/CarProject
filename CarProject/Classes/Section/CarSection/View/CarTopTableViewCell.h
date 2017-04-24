//
//  CarTopTableViewCell.h
//  CarProject
//
//  Created by 董诗磊 on 2017/4/17.
//  Copyright © 2017年 董诗磊. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CarTopTableViewCellDelegate <NSObject>
@optional

- (void) CarTopTableViewCelladdCarAction;

- (void) CarTopTableViewCellcarListAction;



@end

@interface CarTopTableViewCell : UITableViewCell

@property (nonatomic ,assign) id<CarTopTableViewCellDelegate >delegate;

@end
