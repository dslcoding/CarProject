//
//  ServiceCollectViewCell.m
//  CarProject
//
//  Created by 董诗磊 on 2017/4/20.
//  Copyright © 2017年 董诗磊. All rights reserved.
//

#import "ServiceCollectViewCell.h"

@implementation ServiceCollectViewCell

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
        [self setupViews];
    }
    return self;
}

- (UILabel * )titleLable
{

    if (_titleLable == nil) {
        
        _titleLable = [[UILabel alloc]init];
        
        _titleLable.textColor = [UIColor colorWithRed:196/255.0 green:196/255.0 blue:196/255.0 alpha:196/255.0];
        
        _titleLable.font = [UIFont systemFontOfSize:16];
        
    
    }

    return _titleLable;
}

- (void)setModel:(ServiceCollectModel *)model
{

    self.faceImage.image = [UIImage imageNamed:model.imageName];
    
    self.titleLable.text = model.titleStr;

}

- (void)setupViews{
    
    [self.contentView addSubview:self.faceImage];
    
    self.faceImage.sd_resetLayout
    .centerXEqualToView(self.contentView)
    .centerYEqualToView(self.contentView)
    .heightIs((SCREEN_WIDTH /4)/2.4)
    .widthIs((SCREEN_WIDTH /4)/2.4);
    
    [self.contentView addSubview:self.titleLable];
    
    self.titleLable.sd_layout
    .centerXEqualToView(self.contentView)
    .topSpaceToView(self.faceImage, 0)
    .bottomSpaceToView(self.contentView, 0);
    
    [self.titleLable setSingleLineAutoResizeWithMaxWidth:SCREEN_WIDTH /4];
    
    
    
}



@end
