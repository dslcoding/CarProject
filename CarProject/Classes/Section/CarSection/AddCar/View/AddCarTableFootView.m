//
//  AddCarTableFootView.m
//  CarProject
//
//  Created by 董诗磊 on 2017/4/20.
//  Copyright © 2017年 董诗磊. All rights reserved.
//

#import "AddCarTableFootView.h"

@implementation AddCarTableFootView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    
    if (self = [super initWithFrame:frame]) {
        
        
        [self setupView];
    }
    
    return self;
}

- (void)setupView{
    
    
    UIButton * commitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    commitBtn.backgroundColor = [UIColor colorWithRed:247/255.0 green:146/255.0 blue:0 alpha:1];
    
    [commitBtn setTitle:@"提交" forState:UIControlStateNormal];
    
    commitBtn.sd_cornerRadius = [NSNumber numberWithInt:10];
    
    [self addSubview:commitBtn];
    
    commitBtn.sd_layout
    .leftSpaceToView(self, 20)
    .rightSpaceToView(self,20)
    .heightIs(50)
    .centerYEqualToView(self);
   
    
}

@end
