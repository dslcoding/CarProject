//
//  CarTopTableViewCell.m
//  CarProject
//
//  Created by 董诗磊 on 2017/4/17.
//  Copyright © 2017年 董诗磊. All rights reserved.
//

#import "CarTopTableViewCell.h"

#define KFontSize  15

@interface CarTopTableViewCell ()

@property (nonatomic, strong) UILabel * loctionLable;

@property (nonatomic, strong) UILabel * airQualityLable;

@property (nonatomic, strong) UIButton * addCarBtn;



@end



@implementation CarTopTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{

    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setupView];
        
    }
    
    return self;

}

- (UIButton *)addCarBtn
{

    if (_addCarBtn == nil) {
        
        _addCarBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [_addCarBtn setBackgroundImage:[UIImage imageNamed:@"add_22x22_"] forState:UIControlStateNormal];
        
        [_addCarBtn addTarget:self action:@selector(addCarAction) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    return _addCarBtn;

}

- (void)addCarAction{


    if ([self.delegate respondsToSelector:@selector(CarTopTableViewCelladdCarAction)]) {
        
        [self.delegate CarTopTableViewCelladdCarAction];
    }



}

- (UILabel *)airQualityLable
{

    if (_airQualityLable == nil) {
        
          _airQualityLable = [[UILabel alloc]init];
        //天气需要接口，暂时不添加,写死啦
        
        _airQualityLable.font = [UIFont systemFontOfSize:KFontSize];
        
        _airQualityLable.text = @"小雨 31.6℃ PM2.5:30";

        
    }
    
    return _airQualityLable;

}

- (UILabel *)loctionLable
{

    
    if (_loctionLable == nil) {
        
        _loctionLable = [[UILabel alloc]init];
        
        _loctionLable.font = [UIFont systemFontOfSize:KFontSize];
        
       _loctionLable.text = @"杭州市";

        
    }
    
    return _loctionLable;

}

- (void)setupView
{

    //背景图片
    UIImageView * backImage = [[UIImageView alloc]init];
    
    backImage.image = [UIImage imageNamed:@"homebackground_375x264_"];
    
    [self.contentView addSubview:backImage];
    
    backImage.sd_layout.spaceToSuperView(UIEdgeInsetsZero);
    
    //定位图片
    UIImageView * loctionImage = [[UIImageView alloc]init];
    
    loctionImage.image = [UIImage imageNamed:@"location_19x25_"];
    
    [self.contentView addSubview:loctionImage];
    
    loctionImage.sd_layout.leftSpaceToView(self.contentView, 15).topSpaceToView(self.contentView, 30).heightIs(30).widthIs(20);
    
    //定位lable
    [self.contentView addSubview:self.loctionLable];
    
    self.loctionLable.sd_layout
    .leftSpaceToView(loctionImage, 3)
    .topEqualToView(loctionImage)
    .heightIs(30);
    
    [self.loctionLable setSingleLineAutoResizeWithMaxWidth:60];
    
    //增加车辆按btn
    [self.contentView addSubview:self.addCarBtn];
    
    self.addCarBtn.sd_layout
    .topSpaceToView(self.contentView, 30)
    .rightSpaceToView(self.contentView,15)
    .heightIs(25)
    .widthIs(25);

    //天气Lable
    [self.contentView addSubview:self.airQualityLable];

    self.airQualityLable.sd_layout
    .leftSpaceToView(self.loctionLable, 5)
    .rightSpaceToView(self.addCarBtn, 5)
    .topEqualToView(loctionImage)
    .heightIs(30);
    

    


}

@end
