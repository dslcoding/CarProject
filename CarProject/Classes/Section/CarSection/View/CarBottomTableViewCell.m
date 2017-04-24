//
//  CarBottomTableViewCell.m
//  CarProject
//
//  Created by 董诗磊 on 2017/4/17.
//  Copyright © 2017年 董诗磊. All rights reserved.
//

#import "CarBottomTableViewCell.h"

@interface CarBottomTableViewCell ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView * collectview;

@property (nonatomic, strong) NSMutableArray * dataSource;



@end

@implementation CarBottomTableViewCell

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

- (void)setupView{

  
    [self.contentView addSubview:self.collectview];
}

- ( NSMutableArray *)dataSource
{

    if (_dataSource == nil) {
        
        _dataSource = [[NSMutableArray alloc]init];
        
        BottomCellModel * locationModel = [BottomCellModel initWithBottomTitle:@"导航" BottomImageName:@"nav_40x40_"];
        
        BottomCellModel *nearby = [BottomCellModel initWithBottomTitle:@"附近" BottomImageName:@"nearby_40x40_"];
        
        BottomCellModel * musicModel = [BottomCellModel initWithBottomTitle:@"音乐" BottomImageName:@"player_40x40_"];
        
        BottomCellModel *chatModel = [BottomCellModel initWithBottomTitle:@"车友" BottomImageName:@"friend_89x89_"];
        
        [_dataSource addObject:locationModel];
        
        [_dataSource addObject:nearby];
        
        [_dataSource addObject:musicModel];

        
        [_dataSource addObject:chatModel];
        
    }

    return _dataSource;
}

- (UICollectionView *)collectview
{

    if (_collectview == nil) {
        
        UICollectionViewFlowLayout * flowout = [[UICollectionViewFlowLayout alloc]init];
        
        flowout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        _collectview = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, (SCREEN_HEIGHT + 20)/2 ) collectionViewLayout:flowout];
        
        _collectview.backgroundColor = KGrayColor;
        
        _collectview.delegate = self;
        
        _collectview.dataSource = self;
        
        [_collectview registerClass:[CarBottomCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        
        
    }
    
    return _collectview;

}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{

    return self.dataSource.count;

}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    CarBottomCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor whiteColor];
    
    cell.layer.cornerRadius = 5;
    
    cell.layer.masksToBounds = YES;
    
    cell.layer.shadowColor = KGrayColor.CGColor;
    cell.layer.shadowOffset = CGSizeMake(1, 1);
    cell.layer.shadowRadius = 0.8f;
    cell.layer.shadowOpacity = 0.5f;
    cell.layer.masksToBounds = NO;
    cell.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:cell.bounds cornerRadius:cell.contentView.layer.cornerRadius].CGPath;
    
    BottomCellModel * model = self.dataSource[indexPath.row];
    
    cell.model = model;


    return cell;

}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath

{

    if ([self.delegate respondsToSelector:@selector(pushToVCWithIndex:)]) {
        
        [self.delegate pushToVCWithIndex:indexPath.row];
    }

}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((SCREEN_WIDTH - 45)/2, 100);
    
    
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    
    return 15;
    
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    
    return 15;
    
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    
    return UIEdgeInsetsMake(15, 15, 15, 15);
}


@end
