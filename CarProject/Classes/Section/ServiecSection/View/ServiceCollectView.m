//
//  ServiceCollectView.m
//  CarProject
//
//  Created by 董诗磊 on 2017/4/20.
//  Copyright © 2017年 董诗磊. All rights reserved.
//

#import "ServiceCollectView.h"

@interface ServiceCollectView ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic ,strong) UICollectionView *pageView;

@property (nonatomic ,strong) NSMutableArray * tableHeadViewDataSource;

@end

@implementation ServiceCollectView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (NSMutableArray *)tableHeadViewDataSource
{
    
    
    if (_tableHeadViewDataSource == nil) {
        
        _tableHeadViewDataSource = [[NSMutableArray alloc]init];
        
        ServiceCollectModel * breakRulesModel = [ServiceCollectModel initWithImageName:@"item_1_38x37_" TitleStr:@"违章查询"];
        
        [_tableHeadViewDataSource addObject:breakRulesModel];
        
        ServiceCollectModel * handInModel = [ServiceCollectModel initWithImageName:@"item_2_44x50_" TitleStr:@"违章代缴"];

         [_tableHeadViewDataSource addObject:handInModel];
        
         ServiceCollectModel * oilModel = [ServiceCollectModel initWithImageName:@"item_3_42x46_" TitleStr:@"油卡充值"];
        
         [_tableHeadViewDataSource addObject:oilModel];
        
         ServiceCollectModel * driviingLiceseModel = [ServiceCollectModel initWithImageName:@"item_4_50x33_" TitleStr:@"驾照查分"];
        
         [_tableHeadViewDataSource addObject:driviingLiceseModel];
        
         ServiceCollectModel * newsModel = [ServiceCollectModel initWithImageName:@"item_5_31x31_" TitleStr:@"新闻头条"];
        
         [_tableHeadViewDataSource addObject:newsModel];
        
        ServiceCollectModel * carModel = [ServiceCollectModel initWithImageName:@"item_9_40x40_" TitleStr:@"汽车估价"];
        
         [_tableHeadViewDataSource addObject:carModel];
        
         ServiceCollectModel * usedcarModel = [ServiceCollectModel initWithImageName:@"item_10_37x39_" TitleStr:@"二手车"];
        
         [_tableHeadViewDataSource addObject:usedcarModel];
        
          ServiceCollectModel * freeCarModel = [ServiceCollectModel initWithImageName:@"item_14_34x40_" TitleStr:@"免费车检"];
        
         [_tableHeadViewDataSource addObject:freeCarModel];
        }
    
    return _tableHeadViewDataSource;
    
}


- (UICollectionView *)pageView
{
    
    if (_pageView == nil) {
        
        
        UICollectionViewFlowLayout * flowlayout = [[UICollectionViewFlowLayout alloc] init];
        
        flowlayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowlayout];
        
        collectionView.backgroundColor = [UIColor whiteColor];
        
        collectionView.showsHorizontalScrollIndicator = NO;
        collectionView.dataSource = self;
        collectionView.delegate = self;
        [collectionView registerClass:[ServiceCollectViewCell class] forCellWithReuseIdentifier:@"cell"];
        
        
        //itemSize = CGSizeMake(SCREEN_WIDTH - 120, 100);
        collectionView.pagingEnabled = YES;
        
        _pageView = collectionView;
        
    }
    
    return _pageView;
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.tableHeadViewDataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ServiceCollectViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.layer.borderColor=[UIColor darkGrayColor].CGColor;
    cell.layer.borderWidth=0.3;
    
    cell.model = self.tableHeadViewDataSource[indexPath.row];
    
    return cell;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    
    return UIEdgeInsetsZero;
    
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section

{

    return 0;

}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{

    return 0;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(SCREEN_WIDTH / 4, SCREEN_WIDTH / 4);
    
    
}


- (instancetype)initWithFrame:(CGRect)frame
{
    
    if (self = [super initWithFrame:frame]) {
        
        [self setupView];
    }
    
    return self;
}

- (void)setupView
{
    
    
    [self addSubview:self.pageView];
    
    self.pageView.sd_layout
    .spaceToSuperView(UIEdgeInsetsZero);
    
}
@end
