//
//  CarMusicVCNavigationView.h
//  CarProject
//
//  Created by 董诗磊 on 2017/4/19.
//  Copyright © 2017年 董诗磊. All rights reserved.
//

#import "NavigationView.h"

typedef void(^rightBtnOptin)();

@interface CarMusicVCNavigationView : NavigationView

@property (nonatomic ,copy) rightBtnOptin rightOption;

@end
