//
//  AddCarTableCell.m
//  CarProject
//
//  Created by 董诗磊 on 2017/4/20.
//  Copyright © 2017年 董诗磊. All rights reserved.
//

#import "AddCarTableCell.h"

@interface AddCarTableCell ()

@property (nonatomic ,strong) UIImageView * arrorwImage;

@property (nonatomic ,strong) UIImageView * alermImage;

@end

@implementation AddCarTableCell


- (UIImageView * )arrorwImage
{

    if (_arrorwImage == nil) {
        
        _arrorwImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"right_arrow_9x13_"]];
        
        _arrorwImage.bounds = CGRectMake(0, 0, 15, 15);
    }
    
    return _arrorwImage;

}

- (UIImageView * )alermImage
{
    
    if (_alermImage == nil) {
        
        _alermImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"info_10x10_"]];
        
        _alermImage.bounds = CGRectMake(0, 0, 15, 15);
    }
    
    return _alermImage;
    
}


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
        
        [self setupView ];
        
    }
    
    return self;
}
- (void)setModel:(CarTableCellModel *)model
{
    
    if ([model isKindOfClass:[CarLicenseNumberModel class]]) {
        
        self.textTF.text = @"浙A";
    }else{
    
        self.textTF.placeholder = model.placeholderStr;
    
    }
    
    if ([model isKindOfClass:[DrivinglicenseTableModel class]]) {
        
        self.accessoryView = self.arrorwImage;
    }
    
    if ([model isKindOfClass:[AlertCarTableCellModel class]] ) {
        
        self.accessoryView = self.alermImage;
    }
    
    
    self.titleLable.text = model.addCarStr;
    
}

- (UILabel *)titleLable
{

    if (_titleLable == nil) {
        
        _titleLable  = [[UILabel alloc]init];
        
        _titleLable.font = [UIFont systemFontOfSize:16];
        
        _titleLable.textColor = [UIColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0 alpha:1];
        
    }
    
    return _titleLable;

}

- (UITextField *)textTF
{

    if (_textTF == nil) {
        
        _textTF = [[UITextField alloc]init];
        
        _textTF.font = [UIFont systemFontOfSize:16];
        
    }
    
    return _textTF;

}

- (void)setupView{
    
    
    [self.contentView addSubview:self.titleLable];
    
    self.titleLable.sd_layout
    .leftSpaceToView(self.contentView, 15)
    .centerYEqualToView(self.contentView)
    .widthIs(70)
    .heightIs(30);
    
    [self.contentView addSubview:self.textTF];
    
    self.textTF.sd_layout
    .leftSpaceToView(self.titleLable, 15)
    .centerYEqualToView(self.contentView)
    .heightIs(30)
    .widthIs(150);
    
    
    
    
}

@end
