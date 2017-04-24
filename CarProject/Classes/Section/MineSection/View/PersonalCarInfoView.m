//
//  PersonalCarInfoView.m
//  CarProject
//
//  Created by 董诗磊 on 2017/4/20.
//  Copyright © 2017年 董诗磊. All rights reserved.
//

#import "PersonalCarInfoView.h"
@interface PersonalCarInfoView ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView * collectview;

@property (nonatomic, strong) NSMutableArray * dataSource;


@end

@implementation PersonalCarInfoView

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
    
    [self addSubview:self.collectview];
    
}

- ( NSMutableArray *)dataSource
{
    
    if (_dataSource == nil) {
        
        _dataSource = [[NSMutableArray alloc]init];
        
        PersonalCarInfoModel * integrationModel = [PersonalCarInfoModel initWithContentStr:@"250" TitleStr:@"积分"];
        
        
        PersonalCarInfoModel *dataModel = [PersonalCarInfoModel initWithContentStr:@"0" TitleStr:@"优惠卷"];
        
        PersonalCarInfoModel * searchModel = [PersonalCarInfoModel initWithContentStr:@"2"TitleStr:@"车辆"];
        
        
        [_dataSource addObject:integrationModel];
        
        [_dataSource addObject:dataModel];
        
        [_dataSource addObject:searchModel];
        
        
        
    }
    
    return _dataSource;
}

- (UICollectionView *)collectview
{
    
    if (_collectview == nil) {
        
        UICollectionViewFlowLayout * flowout = [[UICollectionViewFlowLayout alloc]init];
        
        flowout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        _collectview = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH,100) collectionViewLayout:flowout];
        
        _collectview.backgroundColor = [UIColor whiteColor];
        
        _collectview.delegate = self;
        
        _collectview.dataSource = self;
        
        [_collectview registerClass:[PersonalcarInfoCollectionCell class] forCellWithReuseIdentifier:@"cell"];
        
        
    }
    
    return _collectview;
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return self.dataSource.count;
    
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    PersonalcarInfoCollectionCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    //cell.backgroundColor = [UIColor whiteColor];
    
    
    PersonalCarInfoModel * model = self.dataSource[indexPath.row];
    
    cell.model = model;
    
    
    return cell;
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(SCREEN_WIDTH / 3, 100);
    
    
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    
    return 0;
    
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    
    return 0;
    
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    
    return UIEdgeInsetsZero;
}



@end
