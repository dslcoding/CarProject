//
//  NavigationView.h
//  CarProject
//
//  Created by 董诗磊 on 2017/4/17.
//  Copyright © 2017年 董诗磊. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^BackOption)();

@interface NavigationView : UIView

@property (nonatomic ,strong) UILabel * titleLable;

@property (nonatomic, copy) BackOption option;
@end
