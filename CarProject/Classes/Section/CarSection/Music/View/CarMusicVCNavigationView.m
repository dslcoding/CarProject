//
//  CarMusicVCNavigationView.m
//  CarProject
//
//  Created by 董诗磊 on 2017/4/19.
//  Copyright © 2017年 董诗磊. All rights reserved.
//

#import "CarMusicVCNavigationView.h"

@implementation CarMusicVCNavigationView

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
        
        self.backgroundColor = KGrayColor;
        
        self.titleLable.text = @"音乐";
        
        //返回按钮
        UIButton * backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [backBtn setImage:[UIImage imageNamed:@"showlist_57x43_"] forState:UIControlStateNormal];
        
        [backBtn addTarget:self action:@selector(rightBtnAction) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:backBtn];
        
        backBtn.sd_layout
        .rightSpaceToView(self, 10)
        .topSpaceToView(self, 30)
        .heightIs(30)
        .widthIs(35);

    }
    
    return self;
}

- (void)rightBtnAction{

    if (self.rightOption) {
        
        self.rightOption();
    }


}

@end
