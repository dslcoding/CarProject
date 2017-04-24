//
//  AddCarTableHeadCollectCell.m
//  CarProject
//
//  Created by 董诗磊 on 2017/4/17.
//  Copyright © 2017年 董诗磊. All rights reserved.
//

#import "AddCarTableHeadCollectCell.h"

@implementation AddCarTableHeadCollectCell

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

- (void)setModel:(BottomCellModel *)model
{
    
    [super setModel:model];
    
    self.titleLable.text = model.Bottomtitle;
    
    self.cellImage.image = [UIImage imageNamed:model.BottomimageName];
    
    
    
}

- (void)setupView{
    
    
    [self.contentView addSubview:self.cellImage];
    
    [self.contentView addSubview:self.titleLable];
    
    
    self.cellImage.sd_layout
    .centerXEqualToView(self.contentView)
    .topSpaceToView(self.contentView, 10)
    .heightIs(40)
    .widthIs(40)
    ;
    
    self.titleLable.font = [UIFont systemFontOfSize:16];
    self.titleLable.sd_resetLayout
    .centerXEqualToView(self.contentView)
    .bottomSpaceToView(self.contentView, 10)
    .heightIs(20);
    
    [self.titleLable setSingleLineAutoResizeWithMaxWidth:100];
    
    
   

}

@end
