//
//  ChoseItemsView.m
//  CarProject
//
//  Created by 董诗磊 on 2017/4/17.
//  Copyright © 2017年 董诗磊. All rights reserved.
//

#import "ChoseItemsView.h"

#define SelectColor [UIColor colorWithRed:247/255.0 green:146/255.0 blue:0 alpha:1]

@interface ChoseItemsView ()

@property (nonatomic ,strong) UIButton * trffictatus;

@property (nonatomic ,strong) UIButton * addOilStation;

//4s店
@property (nonatomic ,strong) UIButton *  stores;

@property (nonatomic ,assign) BOOL isChangeColor;
@end

@implementation ChoseItemsView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (UIButton *)trffictatus
{

    if (_trffictatus == nil) {
        
        _trffictatus = [UIButton buttonWithType:UIButtonTypeCustom];
        
        _trffictatus.sd_cornerRadius = [NSNumber numberWithInteger:15];
        
        _trffictatus.titleLabel.font = [UIFont systemFontOfSize:16];

        
        [_trffictatus setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [_trffictatus setTitle:@"实时路况" forState:UIControlStateNormal];
        
        [_trffictatus addTarget:self action:@selector(trffictatusAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _trffictatus;

}

- (void)trffictatusAction:(UIButton *)btn{
 
    self.isChangeColor = !self.isChangeColor;
    
    if (self.isChangeColor) {
        
        [btn setBackgroundColor:SelectColor];
        
        if ([self.delegate respondsToSelector:@selector(trffictatusBtnAction:)]) {
            
            [self.delegate trffictatusBtnAction:self.isChangeColor];
            
        }


        
    }else{
    
        [btn setBackgroundColor:[UIColor whiteColor]];
        
        if ([self.delegate respondsToSelector:@selector(trffictatusBtnAction:)]) {
            
            [self.delegate trffictatusBtnAction:self.isChangeColor];
            
        }
    
    }
    
    


}

- (UIButton *)addOilStation
{
    
    if (_addOilStation == nil) {
        
        _addOilStation = [UIButton buttonWithType:UIButtonTypeCustom];
        
        _addOilStation.sd_cornerRadius = [NSNumber numberWithInteger:15];
        
        _addOilStation.titleLabel.font = [UIFont systemFontOfSize:16];
        
         [_addOilStation setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [_addOilStation setTitle:@"加油站" forState:UIControlStateNormal];
        
        [_addOilStation addTarget:self action:@selector(addOilStationAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _addOilStation;
    
}
- (void)addOilStationAction:(UIButton *)btn
{


    [btn setBackgroundColor:SelectColor];
    
    [self.stores setBackgroundColor:[UIColor whiteColor]];

    if ([self.delegate respondsToSelector:@selector(addOilStationBtnAction)]) {
        
        [self.delegate addOilStationBtnAction];
        
    }


}

- (UIButton *)stores
{
    
    if (_stores == nil) {
        
        _stores = [UIButton buttonWithType:UIButtonTypeCustom];
        
         [_stores setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        _stores.sd_cornerRadius = [NSNumber numberWithInteger:15];
        
        _stores.titleLabel.font = [UIFont systemFontOfSize:16];

        
        [_stores setTitle:@"4s店" forState:UIControlStateNormal];
        
        [_stores addTarget:self action:@selector(storesAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _stores;
    
}

- (void)storesAction:(UIButton *)btn
{
    [btn setBackgroundColor:SelectColor];
    
    [self.addOilStation setBackgroundColor:[UIColor whiteColor]];
    
    if ([self.delegate respondsToSelector:@selector(storesBtnAction)]) {
        
        [self.delegate storesBtnAction];
        
    }


}


- (instancetype)initWithFrame:(CGRect)frame
{

    if (self = [super initWithFrame:frame]) {
        
        [self setupView];
        
    }

    return self;
}

- (void)setupView{

    self.addOilStation.backgroundColor = SelectColor;

    [self sd_addSubviews:@[self.trffictatus,self.addOilStation,self.stores]];
    
    self.addOilStation.sd_layout
    .centerXEqualToView(self)
    .centerYEqualToView(self)
    .heightIs(35)
    .widthIs(80);

    self.trffictatus.sd_layout
    .leftSpaceToView(self, 20)
    .centerYEqualToView(self)
    .heightIs(35)
    .widthIs(80);
    
    self.stores.sd_layout
    .rightSpaceToView(self, 20)
    .centerYEqualToView(self)
    .heightIs(35)
    .widthIs(80);



}
@end
