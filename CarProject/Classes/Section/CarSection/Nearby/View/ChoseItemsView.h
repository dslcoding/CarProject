//
//  ChoseItemsView.h
//  CarProject
//
//  Created by 董诗磊 on 2017/4/17.
//  Copyright © 2017年 董诗磊. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ChoseItemsViewDelegate <NSObject>


- (void)trffictatusBtnAction:(BOOL )isShowTraffic;

- (void)addOilStationBtnAction;

- (void)storesBtnAction;

@end

@interface ChoseItemsView : UIView

@property (nonatomic ,weak) id<ChoseItemsViewDelegate>delegate;

@end
