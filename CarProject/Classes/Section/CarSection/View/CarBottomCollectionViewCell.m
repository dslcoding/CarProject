//
//  CarBottomCollectionViewCell.m
//  CarProject
//
//  Created by 董诗磊 on 2017/4/17.
//  Copyright © 2017年 董诗磊. All rights reserved.
//

#import "CarBottomCollectionViewCell.h"

@interface CarBottomTableViewCell ()


@end

@implementation CarBottomCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{

    if (self = [super initWithFrame:frame]) {
        
        [self setupView];
        
    }
    
    return self;

}

- (void)setModel:(BottomCellModel *)model
{

    self.titleLable.text = model.Bottomtitle;
    
    self.cellImage.image = [UIImage imageNamed:model.BottomimageName];

}

- (void)setupView{
    
    
        

    [self.contentView addSubview:self.titleLable];
    
    [self.contentView addSubview:self.cellImage];
    
    self.cellImage.sd_layout
    .centerYEqualToView(self.contentView)
    .leftSpaceToView(self.contentView, 10)
    .heightIs(60)
    .widthIs(60);
    
    self.titleLable.sd_layout
    .centerYEqualToView(self.contentView)
    .leftSpaceToView(self.cellImage,20)
    .heightIs(30)
    .widthIs(60);
    
    


}

- (UILabel *)titleLable
{

    if (_titleLable == nil) {
        
        _titleLable = [[UILabel alloc]init];
        
        _titleLable.textColor = [UIColor colorWithRed:173/255.0 green:173/255.0 blue:173/255.0 alpha:1];
        
        
        
    }

    return _titleLable;

}

- (UIImageView *)cellImage
{
    
    if (_cellImage == nil) {
        
        _cellImage = [[UIImageView alloc]init];
        
        
        
    }
    
    return _cellImage;
    
}

@end
