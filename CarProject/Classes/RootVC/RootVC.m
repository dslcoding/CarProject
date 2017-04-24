//
//  RootVC.m
//  CardProject
//
//  Created by 董诗磊 on 2017/4/11.
//  Copyright © 2017年 董诗磊. All rights reserved.
//

#import "RootVC.h"

@interface RootVC ()

@end

@implementation RootVC
- (instancetype)init
{

    if (self = [super init]) {
        
        CarVC * carVC = [[CarVC alloc]init];
    
        
        [self addChildViewController:carVC tabbarTitle:nil tabbarSelectImage:[UIImage imageNamed:@"nearby_selected_30x30_"] tabbarNormalImage:[UIImage imageNamed:@"nearby_unselected_30x30_"]];
        
        ServiceVC * serviceVC  = [[ServiceVC alloc]init];
        
        [self addChildViewController:serviceVC tabbarTitle:nil tabbarSelectImage:[UIImage imageNamed:@"car_selected_27x31_"] tabbarNormalImage:[UIImage imageNamed:@"car_unselected_27x31_"]];

        
        MineVC * mineVC = [[MineVC alloc]init];
        
        [self addChildViewController:mineVC tabbarTitle:nil tabbarSelectImage:[UIImage imageNamed:@"user_selected_28x28_"] tabbarNormalImage:[UIImage imageNamed:@"user_unselected_28x28_"]];


    }

    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[PlayTools shareTools] songDataSource];
    
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}

- (void)addChildViewController:(UIViewController *)childController
                   tabbarTitle:(NSString *)title
             tabbarSelectImage:(UIImage *)selectimage
             tabbarNormalImage:(UIImage *)normaliamge{

       
    childController.tabBarItem.selectedImage = [selectimage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    childController.tabBarItem.image = [normaliamge imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    [childController.tabBarItem setImageInsets :UIEdgeInsetsMake(6, 0, -6, 0) ];
    
    DSLNav * nav = [[DSLNav alloc]initWithRootViewController:childController];
    
  
    
    [self addChildViewController:nav];
    



}

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
