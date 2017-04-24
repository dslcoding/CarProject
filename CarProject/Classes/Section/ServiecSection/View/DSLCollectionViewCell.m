//
//  DSLCollectionViewCell.m
//  ExpressionBaby
//
//  Created by 董诗磊 on 2017/4/12.
//  Copyright © 2017年 董诗磊. All rights reserved.
//

#import "DSLCollectionViewCell.h"

@implementation DSLCollectionViewCell
- (UIImageView *)faceImage
{
    if (_faceImage == nil) {
        _faceImage = [[UIImageView alloc]init];
        
       
        
    }
    
    return _faceImage;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupViews];
    }
    return self;
}
- (void)setupViews{
    
    [self.contentView addSubview:self.faceImage];
    
    self.faceImage.sd_layout.spaceToSuperView(UIEdgeInsetsZero);
    
    
    
}

@end
