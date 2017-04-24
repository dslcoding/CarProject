//
//  CarFriendVC.m
//  CarProject
//
//  Created by 董诗磊 on 2017/4/18.
//  Copyright © 2017年 董诗磊. All rights reserved.
//

#import "CarFriendVC.h"



#import "POPopupOverlayer.h"




@interface CarFriendVC ()<POPopupOverlayerDelegate,POPopupOverlayerDataSource>

@property (nonatomic, strong) POPopupOverlayer *popupOverlayer;

@property (nonatomic, strong) NSMutableArray *dataSource;

@property (nonatomic ,strong) CarFriendNavigationView *navigntionView;

@property (nonatomic ,strong) UIButton * deleteBtn;

@property (nonatomic ,strong) UIButton * likeBtn;



@end

@implementation CarFriendVC

- (CarFriendNavigationView *)navigntionView
{
    
    if (_navigntionView == nil) {
        
        _navigntionView = [[CarFriendNavigationView alloc]init];
        
        __weak CarFriendVC *selfVC = self;
        
        _navigntionView.option = ^{
            
            [selfVC.navigationController popViewControllerAnimated:YES];
            
            
        };
    }
    
    return _navigntionView;
}

- (POPopupOverlayer *)popupOverlayer
{
    
    if (_popupOverlayer == nil) {
        
        _popupOverlayer = [[POPopupOverlayer alloc]initWithFrame:CGRectMake(10, 74, self.view.frame.size.width - 10, self.view.frame.size.height - 200)];
        
        
        
        _popupOverlayer.delegate = self;
        
       _popupOverlayer.dataSource = self;
        
        _popupOverlayer.maxTranslation = CGSizeMake(160, 160);
        
        _popupOverlayer.itemViewRotateAngle = 5/180.f * M_PI;
  
    }
    
    
    return _popupOverlayer;

}

- (UIButton *)deleteBtn
{

    if (_deleteBtn == nil) {
        
        _deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [_deleteBtn setImage:[UIImage imageNamed:@"close_66x66_"] forState:UIControlStateNormal];
        
        [_deleteBtn addTarget:self action:@selector(didClickDelete) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _deleteBtn;

}

- (void)didClickDelete{
    
    if (self.dataSource.count != 0) {
        
        [[self popupOverlayer] popOverTopItemViewOnDirection:POPopupOverlayerAnimationDirectionLeft animated:YES];
    }
    
}


- (UIButton *)likeBtn
{
    
    if (_likeBtn == nil) {
        
        _likeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [_likeBtn setImage:[UIImage imageNamed:@"heart_red_25x21_"] forState:UIControlStateNormal];
    }
    
    return _likeBtn;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = KGrayColor;
    
    [self.view addSubview:self.navigntionView];
    
    self.navigntionView.sd_layout
    .topSpaceToView(self.view, 0)
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .heightIs(64);
    
    self.dataSource = [NSMutableArray arrayWithObjects:@"75da573971ff01dbf2252e388cc6ee86", @"77f2d57d65808958050edbf789e0caab", @"89fa1e852e6add9be1cc2c6d031a7feb", @"887a0ceafa33b5ea190625009f300c8d", @"6489e2cb9db02071568f813585ef52c0", @"286317a91f788ae7eedef45fa2a6b5f5", @"cb9582a4de9bed2c3ace4a43fbe03002", nil];

    
    [self.view addSubview:self.popupOverlayer];
    
    [self.popupOverlayer reloadData];
    
    
    [self.view addSubview:self.deleteBtn];
    
    self.deleteBtn.sd_layout
    .leftSpaceToView(self.view, 100)
    .bottomSpaceToView(self.view, 30)
    .heightIs(45)
    .widthIs(45);
    
    [self.view addSubview:self.likeBtn];
    
    self.likeBtn.sd_layout
    .rightSpaceToView(self.view, 100)
    .bottomSpaceToView(self.view, 30)
    .heightIs(45)
    .widthIs(45);

}


#pragma mark - POPopupOverlayerDelegate, POPopupOverlayerDataSource

- (NSInteger)numberOfItemsInPopupOverlayerView:(POPopupOverlayer *)popupOverlayer;{
    return [[self dataSource] count];
}

- (NSInteger)numberOfVisibleItemsInPopupOverlayerView:(POPopupOverlayer *)popupOverlayer;{
    return 3;
}

- (CGSize)popupOverlayer:(POPopupOverlayer *)popupOverlayer sizeForItemAtIndex:(NSUInteger)nIndex;{
    return CGSizeMake(SCREEN_WIDTH - 20, SCREEN_HEIGHT - 200);
}

- (UIView *)popupOverlayer:(POPopupOverlayer *)popupOverlayer viewForItemAtIndex:(NSUInteger)nIndex reusingView:(UIView *)view{
   
    UIImageView * image = [[UIImageView alloc]init];
    
    image.image = [UIImage imageNamed:self.dataSource[nIndex]];
    
    image.layer.cornerRadius = 4;
    
    image.layer.borderWidth = 2;
    
    image.layer.masksToBounds = YES;
    
    image.layer.borderColor = [UIColor colorWithRed:(arc4random()%255)/255.f green:(arc4random()%255)/255.f blue:(arc4random()%255)/255.f alpha:1].CGColor;
    
    
    
    
    return image;
}

- (BOOL)popupOverlayer:(POPopupOverlayer *)popupOverlayer shouldPopupOverItemView:(UIView *)itemView direction:(POPopupOverlayerAnimationDirection)direction atIndex:(NSUInteger)nIndex;{
    return YES;
}

- (void)popupOverlayer:(POPopupOverlayer *)popupOverlayer movingItemViewWithTranslation:(CGPoint)translation atIndex:(NSUInteger)nIndex{
    POPopupOverlayerAnimationDirection direction = [popupOverlayer directionAtTranslation:translation];
//    self.closeButton.highlighted = direction & POPopupOverlayerAnimationDirectionLeft;
//    self.likeButton.highlighted = direction & POPopupOverlayerAnimationDirectionRight;
}

- (void)popupOverlayer:(POPopupOverlayer *)popupOverlayer didMoveItemViewWithTranslation:(CGPoint)translation atIndex:(NSUInteger)nIndex;{
//    self.closeButton.highlighted = NO;
//    self.likeButton.highlighted = NO;
}

- (void)popupOverlayer:(POPopupOverlayer *)popupOverlayer didPopupOverItemViewOnDirection:(POPopupOverlayerAnimationDirection)direction atIndex:(NSUInteger)nIndex;{
}


//#pragma mark - actions
//
//- (IBAction)didClickInsert:(id)sender{
//    [[self dataSource] insertObject:@"" atIndex:1];
//    [[self popupOverlayer] insertItemAtIndex:1 animated:YES];
//}
//
//- (IBAction)didClickDelete:(id)sender{
//
//    [[self dataSource] removeObjectAtIndex:1];
//    [[self popupOverlayer] removeItemAtIndex:1 onDirection:POPopupOverlayerAnimationDirectionBottom animated:YES];
//}
//
//- (IBAction)didClickClose:(id)sender{
//
//    [[self popupOverlayer] popOverTopItemViewOnDirection:POPopupOverlayerAnimationDirectionLeft animated:YES];
//}
//
//- (IBAction)didClickLike:(id)sender{
//
//    [[self popupOverlayer] popOverTopItemViewOnDirection:POPopupOverlayerAnimationDirectionRight animated:YES];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
