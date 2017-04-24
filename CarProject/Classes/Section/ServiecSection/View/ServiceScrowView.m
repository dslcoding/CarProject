//
//  ServicescrowView.m
//  CarProject
//
//  Created by 董诗磊 on 2017/4/20.
//  Copyright © 2017年 董诗磊. All rights reserved.
//

#import "ServiceScrowView.h"

@interface ServiceScrowView ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic ,strong) UICollectionView *pageView;

@property (nonatomic ,strong) NSMutableArray * tableHeadViewDataSource;

@property (nonatomic ,strong) UIPageControl * pageControl;

@property (nonatomic ,strong) NSTimer * timer;


@end

@implementation ServiceScrowView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (UIPageControl *)pageControl
{

    if (_pageControl == nil) {
        
        _pageControl = [[UIPageControl alloc]init];
        
        _pageControl.numberOfPages = 3;
        
        _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    }
    
    return _pageControl;


}

- (NSMutableArray *)tableHeadViewDataSource
{
    
    
    if (_tableHeadViewDataSource == nil) {
        
        _tableHeadViewDataSource = [[NSMutableArray alloc]init];
        
        [_tableHeadViewDataSource addObject:@"https://bmob-cdn-7365.b0.upaiyun.com/2017/04/12/d4e0ac9168504c829c3d7675d8128f41.jpg"];
        
        [_tableHeadViewDataSource addObject:@"https://bmob-cdn-7365.b0.upaiyun.com/2017/04/12/2955c69d3e8943f5b1b0547295b9108e.jpg"];
        
        [_tableHeadViewDataSource addObject:@"https://bmob-cdn-7365.b0.upaiyun.com/2017/04/12/9c3dc2135acc44f0949c6482a96bc173.jpg"];
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
        [collectionView registerClass:[DSLCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        

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
    DSLCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
      [cell.faceImage sd_setImageWithURL:[NSURL URLWithString:self.tableHeadViewDataSource[indexPath.row]] placeholderImage:[UIImage imageNamed:@"logo"]];
    
    return cell;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    
    return UIEdgeInsetsMake(5, 5, 5, 5);
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(SCREEN_WIDTH - 10 , 140);
    
    
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
    
    [self addSubview:self.pageControl];
    
    self.pageControl.sd_layout
    .centerXEqualToView(self)
    .heightIs(30)
    .widthIs(100)
    .bottomSpaceToView(self,10);
    
    [self addPageControlTimer];


}

- (void)addPageControlTimer
{

    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(nextPageAction) userInfo:nil repeats:YES];
    
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];


}

- (void)nextPageAction{

    
    NSIndexPath * currentIndexPath = [[self.pageView indexPathsForVisibleItems]lastObject];
    
    NSIndexPath *ResetCurrentIndexPath = [NSIndexPath indexPathForItem:currentIndexPath.item inSection:0];
    
    [self.pageView scrollToItemAtIndexPath:ResetCurrentIndexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    
    NSInteger nextIndepath = ResetCurrentIndexPath.item +1;
    
    if (nextIndepath==self.tableHeadViewDataSource.count) {
        
        nextIndepath=0;
    }
    NSIndexPath *nextIndexPath = [NSIndexPath indexPathForItem:nextIndepath inSection:0];
    [self.pageView scrollToItemAtIndexPath:nextIndexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    


}

- (void)removeTimer{
    [self.timer invalidate];
    self.timer = nil;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{

    [self removeTimer];

}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{

    [self addPageControlTimer];

}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int page = (int)scrollView.contentOffset.x /self.frame.size.width;
    
    self.pageControl.currentPage = page;



}

@end
