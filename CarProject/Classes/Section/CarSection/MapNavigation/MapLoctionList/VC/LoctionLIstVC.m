//
//  LoctionLIstVC.m
//  CarProject
//
//  Created by 董诗磊 on 2017/4/18.
//  Copyright © 2017年 董诗磊. All rights reserved.
//

#import "LoctionLIstVC.h"

@interface LoctionLIstVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic ,strong)
MapNavigationListVCNabigationView *navigntionView;

@property (nonatomic ,strong) NSMutableArray * dataSource;

@property (nonatomic ,strong) UITableView * tableView;



@end

@implementation LoctionLIstVC

- (MapNavigationListVCNabigationView *)navigntionView
{
    
    if (_navigntionView == nil) {
        
        _navigntionView = [[MapNavigationListVCNabigationView alloc]init];
        
        __weak LoctionLIstVC *selfVC = self;
        
        _navigntionView.option = ^{
            
            [selfVC.navigationController popViewControllerAnimated:YES];
            
            
        };
    }
    
    return _navigntionView;
}

- (NSMutableArray *)dataSource
{

    if (_dataSource == nil) {
        
        _dataSource = [[NSMutableArray alloc]init];
    }
    
    return _dataSource;

}

- (void)setTempDataSource:(NSMutableArray *)tempDataSource
{
    [self.dataSource removeAllObjects];

    [self.dataSource addObjectsFromArray:tempDataSource];
    
    [self.tableView reloadData];

}

- (UITableView *)tableView
{
    
    if (_tableView == nil) {
        
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64  ) style:UITableViewStylePlain];
        
        _tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
        
        _tableView.delegate = self;
        
        _tableView.dataSource = self;
        
        _tableView.showsVerticalScrollIndicator = NO;
        
        [_tableView registerNib:[UINib nibWithNibName:@"LoctionlistTableCell" bundle:nil] forCellReuseIdentifier:@"cell"];
        
        
        
    }
    
    return _tableView;
    
}

#pragma mark tableViewDataSorce&tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.dataSource.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    LoctionlistTableCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.model = self.dataSource[indexPath.row];
    
    return cell;
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    return (self.view.frame.size.height - 64)/5;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{


    GPSMapViewVC * gpsVC = [[GPSMapViewVC alloc]init];
    
    MapNavigationModel * model = self.dataSource[indexPath.row];
    
    gpsVC.model = model;
    
    [self.navigationController pushViewController:gpsVC animated:YES];
    


}




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = KGrayColor;
    
    [self.view addSubview:self.navigntionView];
    
    self.navigntionView.sd_layout
    .topSpaceToView(self.view, 0)
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .heightIs(64);
    
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
