//
//  NavigationView.m
//  CarProject
//
//  Created by 董诗磊 on 2017/4/17.
//  Copyright © 2017年 董诗磊. All rights reserved.
//

#import "NavigationView.h"

@implementation NavigationView

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

    self.backgroundColor = [UIColor whiteColor];
    
    //标题
    self.titleLable = [[UILabel alloc]init];
    
    self.titleLable.font = [UIFont systemFontOfSize:18];
    
    self.titleLable.textAlignment = NSTextAlignmentCenter;
    
    self.titleLable.text = @"添加车辆";
    
    [self addSubview:self.titleLable];
    
    self.titleLable.sd_layout
    .centerXEqualToView(self)
    .topSpaceToView(self, 30)
    .heightIs(30);
    
    [self.titleLable setSingleLineAutoResizeWithMaxWidth:100];
    
    
    //返回按钮
    UIButton * backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [backBtn setImage:[UIImage imageNamed:@"nav_backIcon_12x21_"] forState:UIControlStateNormal];
    
    [backBtn addTarget:self action:@selector(backBtnAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:backBtn];
    
    backBtn.sd_layout
    .leftSpaceToView(self, 5)
    .topSpaceToView(self, 30)
    .heightIs(20)
    .widthIs(15);



}

- (void)backBtnAction{

    if (self.option) {
        
        self.option();
    }


}

@end
