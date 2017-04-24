//
//  AddCarTableHeadView.m
//  CarProject
//
//  Created by 董诗磊 on 2017/4/17.
//  Copyright © 2017年 董诗磊. All rights reserved.
//

#import "AddCarTableHeadView.h"

@interface AddCarTableHeadView ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView * collectview;

@property (nonatomic, strong) NSMutableArray * dataSource;


@end

@implementation AddCarTableHeadView

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
        
        BottomCellModel * dataModel = [BottomCellModel initWithBottomTitle:@"数据实时" BottomImageName:@"data_36x36_"];
        
        BottomCellModel *securityModel = [BottomCellModel initWithBottomTitle:@"数据安全" BottomImageName:@"safe_30x34_"];
        
        BottomCellModel * freeModel = [BottomCellModel initWithBottomTitle:@"查询免费" BottomImageName:@"free_40x39_"];
        
        
        [_dataSource addObject:dataModel];
        
        [_dataSource addObject:securityModel];
        
        [_dataSource addObject:freeModel];
        
        
        
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
        
        [_collectview registerClass:[AddCarTableHeadCollectCell class] forCellWithReuseIdentifier:@"cell"];
        
        
    }
    
    return _collectview;
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return self.dataSource.count;
    
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    AddCarTableHeadCollectCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    //cell.backgroundColor = [UIColor whiteColor];
    
    
    BottomCellModel * model = self.dataSource[indexPath.row];
    
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
