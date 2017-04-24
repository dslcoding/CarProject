//
//  PersonalView.m
//  CarProject
//
//  Created by 董诗磊 on 2017/4/20.
//  Copyright © 2017年 董诗磊. All rights reserved.
//

#import "PersonalView.h"

@implementation PersonalView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (UIButton *)arrowBtn
{

    if (_arrowBtn == nil) {
        
        _arrowBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [_arrowBtn setImage:[UIImage imageNamed:@"right_arrow_9x13_"] forState:UIControlStateNormal];
        
        [_arrowBtn addTarget:self action:@selector(arrowBtnAction) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _arrowBtn;

}


- (void)arrowBtnAction{





}

- (UIImageView *)headImage
{

    if (_headImage == nil) {
        
        _headImage = [[UIImageView alloc]init];
        
        _headImage.sd_cornerRadius = [NSNumber numberWithInt:30];
        
        _headImage.image = [UIImage imageNamed:@"我的"];
    }
    
    return _headImage;

}

- (UILabel * )phoneNumberLable
{
    
    if (_phoneNumberLable == nil) {
        
        _phoneNumberLable = [[UILabel alloc]init];
        
        _phoneNumberLable.textColor = [UIColor whiteColor];
        
        _phoneNumberLable.font = [UIFont systemFontOfSize:16];
        
        _phoneNumberLable.text = @"18457175111";
        

        
    }
    
    return _phoneNumberLable;
}


- (instancetype)initWithFrame:(CGRect)frame
{

    if (self = [super initWithFrame:frame]) {
        
        
        [self setupView];
        
    }

    return self;
}

- (void)setupView{


    [self sd_addSubviews:@[self.headImage,self.phoneNumberLable,self.arrowBtn]];
    
    self.headImage.sd_layout
    .leftSpaceToView(self, 20)
    .centerYEqualToView(self)
    .heightIs(60)
    .widthIs(60);
    
    self.phoneNumberLable.sd_layout
    .leftSpaceToView(self.headImage, 10)
    .centerYEqualToView(self)
    .heightIs(20);
    
    [self.phoneNumberLable setSingleLineAutoResizeWithMaxWidth:200];
    
    self.arrowBtn.sd_layout
    .centerYEqualToView(self)
    .rightSpaceToView(self, 15)
    .heightIs(30)
    .widthIs(30);
    



}

@end
