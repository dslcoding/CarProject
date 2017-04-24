//
//  CarVC.m
//  CarProject
//
//  Created by 董诗磊 on 2017/4/17.
//  Copyright © 2017年 董诗磊. All rights reserved.
//

#import "CarVC.h"

#import "CarTopTableViewCell.h"

#import "CarBottomTableViewCell.h"

@interface CarVC ()<UITableViewDelegate,UITableViewDataSource,CarTopTableViewCellDelegate,CarBottomTableViewCellDelegate>

@property (nonatomic, strong) UITableView * tableView;

@property (nonatomic, strong) NSMutableArray * dataSource;

@end

@implementation CarVC

- (UITableView *)tableView
{

    if (_tableView == nil) {
        
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, - 20, self.view.frame.size.width, self.view.frame.size.height + 20  ) style:UITableViewStylePlain];
        
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        _tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
        
        _tableView.delegate = self;
        
        _tableView.dataSource = self;
        
        _tableView.showsVerticalScrollIndicator = NO;
        
        [_tableView registerClass:[CarTopTableViewCell class] forCellReuseIdentifier:@"top"];
        
        [_tableView registerClass:[CarBottomTableViewCell class] forCellReuseIdentifier:@"bottom"];
        
        
        
    }
    
    return _tableView;

}

#pragma mark tableViewDataSorce&tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return 2;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (indexPath.row == 0) {
        
        CarTopTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"top" forIndexPath:indexPath];
        
        cell.delegate = self;
        
        
        return cell;
        
        
    }else{
    
       CarBottomTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"bottom" forIndexPath:indexPath];
        
        cell.delegate  = self;
    
        return cell;
    }



}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{


    return (self.view.frame.size.height + 20 ) /2 - 50;

}


#pragma mark CarTopTableViewCellDelegate
- (void) CarTopTableViewCelladdCarAction{

    AddCarVC * addVC = [[AddCarVC alloc]init];
    
    [self.navigationController pushViewController:addVC  animated:YES];


}

#pragma mark CarBottomTableViewCellDelegate

- (void)pushToVCWithIndex:(NSInteger)index
{

    switch (index) {
        case 0:
            
            [self .navigationController pushViewController:[[MapNavigationVC alloc]init] animated:YES];
            
            break;
        case 1:
            
        [self.navigationController pushViewController:[[NearByVC alloc]init] animated:YES];
            
            break;
         case 2:
            
            
           [self.navigationController pushViewController:[[CarMusicVC alloc]init] animated:YES];
            
            break;
        case 3:
            
             [self.navigationController pushViewController:[[CarFriendVC alloc]init] animated:YES];
            
            break;
        
            
            
        default:
            break;
    }


}

- (void)viewWillAppear:(BOOL)animated
{

    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.hidden = YES;
    
    [[CarSectionTools sharetools] loctionStr:^(NSString *loctionCity) {
        
        NSLog(@"=====%@",loctionCity);
    }];
    
    

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = KGrayColor;
    
    [self.view addSubview:self.tableView];

    
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
