//
//  PersonalcarInfoCollectionCell.m
//  CarProject
//
//  Created by 董诗磊 on 2017/4/21.
//  Copyright © 2017年 董诗磊. All rights reserved.
//

#import "PersonalcarInfoCollectionCell.h"

@implementation PersonalcarInfoCollectionCell

- (instancetype)initWithFrame:(CGRect)frame
{
    
    if (self = [super initWithFrame:frame]) {
        
        [self setupView];
        
        
    }
    
    return self;
    
}

- (UILabel *)titleLable
{

    if (_titleLable == nil) {
        
        _titleLable = [[UILabel alloc]init];
        
        _titleLable.textAlignment = NSTextAlignmentCenter;
        
        _titleLable.font = [UIFont systemFontOfSize:10];
        
    }
    
    return _titleLable;

}

- (UILabel *)contentLable
{
    
    if (_contentLable == nil) {
        
        _contentLable = [[UILabel alloc]init];
        
        _contentLable.textAlignment = NSTextAlignmentCenter;
        
        _contentLable.font = [UIFont systemFontOfSize:10];
        
    }
    
    return _contentLable;
    
}


- (void)setModel:(PersonalCarInfoModel *)model
{
    
    
    self.titleLable.text = model.titleLableStr;

    self.contentLable.text = model.contentStr;
    
    
    
}

- (void)setupView{
    
    
    [self.contentView addSubview:self.titleLable];
    
    [self.contentView addSubview:self.contentLable];
    
    self.contentLable.sd_layout
    .centerXEqualToView(self.contentView)
    .topSpaceToView(self.contentView, 20)
    .heightIs(20);
    
    [self.contentLable setSingleLineAutoResizeWithMaxWidth:SCREEN_WIDTH / 3];
    
    

    
    self.titleLable.font = [UIFont systemFontOfSize:16];
    self.titleLable.sd_resetLayout
    .topSpaceToView(self.contentLable,0)
    .centerXEqualToView(self.contentView)
    .widthIs(50)
    .heightIs(20);
    
    
    
    
}

@end
