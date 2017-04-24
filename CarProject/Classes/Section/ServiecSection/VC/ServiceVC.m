//
//  ServiceVC.m
//  CarProject
//
//  Created by 董诗磊 on 2017/4/17.
//  Copyright © 2017年 董诗磊. All rights reserved.
//

#import "ServiceVC.h"

@interface ServiceVC ()

@property (nonatomic ,strong) ServiceScrowView * scrowView;

@property (nonatomic ,strong) ServiceCollectView *collectView;

@end

@implementation ServiceVC

- (ServiceScrowView *)scrowView
{

    
    if (_scrowView == nil) {
        
        _scrowView = [[ServiceScrowView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 160)];
        
        
    }
    
    return _scrowView;

}

- (ServiceCollectView *)collectView
{
    
    
    if (_collectView == nil) {
        
        _collectView = [[ServiceCollectView alloc]initWithFrame:CGRectMake(0, 64 + 164, self.view.frame.size.width, (self.view.frame.size.width/4)*2)];
        
        
    }
    
    return _collectView;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"服务";
    
    [self.view addSubview:self.scrowView];
    
    [self.view addSubview:self.collectView];
    // Do any additional setup after loading the view.
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
