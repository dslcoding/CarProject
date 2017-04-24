//
//  MineVC.m
//  CarProject
//
//  Created by 董诗磊 on 2017/4/17.
//  Copyright © 2017年 董诗磊. All rights reserved.
//

#import "MineVC.h"

@interface MineVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic ,strong) PersonalView * personView;

@property (nonatomic ,strong) PersonalCarInfoView * carinfoView;

@property (nonatomic ,strong) UITableView * tableView;

@property (nonatomic ,strong) NSMutableArray * tableHeadViewDataSource;



@end

@implementation MineVC

- (PersonalView *)personView
{

    if (_personView == nil) {
        
        _personView = [[PersonalView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 100)];
        
        _personView.backgroundColor = [UIColor colorWithRed:247/255.0 green:146/255.0 blue:1 alpha:1];
    }

    return _personView;
}

- (PersonalCarInfoView *)carinfoView
{

    
    if (_carinfoView == nil) {
        
         _carinfoView = [[PersonalCarInfoView alloc]initWithFrame:CGRectMake(0, 64 + 100, self.view.frame.size.width, 80)];
    }
    
    return _carinfoView;

}

- (NSMutableArray *)tableHeadViewDataSource
{
    
    
    if (_tableHeadViewDataSource == nil) {
        
        _tableHeadViewDataSource = [[NSMutableArray alloc]init];
        
        ServiceCollectModel * breakRulesModel = [ServiceCollectModel initWithImageName:@"item_1_38x37_" TitleStr:@"违章订单"];
        
        [_tableHeadViewDataSource addObject:breakRulesModel];
        
        ServiceCollectModel * oilModel = [ServiceCollectModel initWithImageName:@"item_3_42x46_" TitleStr:@"油卡订单"];
        
        [_tableHeadViewDataSource addObject:oilModel];
        
        ServiceCollectModel * driviingLiceseModel = [ServiceCollectModel initWithImageName:@"item_12_170x170_" TitleStr:@"我的车辆"];
        
        [_tableHeadViewDataSource addObject:driviingLiceseModel];
        
        ServiceCollectModel * newsModel = [ServiceCollectModel initWithImageName:@"item_11_195x131_" TitleStr:@"优惠卷"];
        
        [_tableHeadViewDataSource addObject:newsModel];
        
        ServiceCollectModel * carModel = [ServiceCollectModel initWithImageName:@"item_13_146x157_" TitleStr:@"积分商城"];
        
        [_tableHeadViewDataSource addObject:carModel];
        
    }
    
    return _tableHeadViewDataSource;
    
}


- (UITableView *)tableView
{
    
    if (_tableView == nil) {
        
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,  64 + 100 + 80, self.view.frame.size.width, self.view.frame.size.height -  64 -100 - 80 - 49 ) style:UITableViewStylePlain];
        
        _tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectZero];
    
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        
        _tableView.backgroundColor = KGrayColor;
        
        _tableView.delegate = self;
        
        _tableView.dataSource = self;
        
        _tableView.showsVerticalScrollIndicator = NO;
        
       // [_tableView registerClass:[AddCarTableCell class] forCellReuseIdentifier:@"cell"];
        
    }
    
    return _tableView;
    
}

#pragma mark tableViewDataSorce&tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.tableHeadViewDataSource.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
   
    
    MineTableModel * model = self.tableHeadViewDataSource[indexPath.row];
    
     UIImage * orImage = [UIImage imageNamed:model.imageName];
    
    cell.imageView.image = orImage ;
    
    cell.textLabel.text = model.titleStr;
    
    
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    return 50;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    return 5;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"我的";
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.view.backgroundColor = KGrayColor;
    
    self.navigationController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"setting_icon_23x22_"] style:UIBarButtonItemStylePlain target:self action:@selector(settingAction)];
    
    [self.view addSubview:self.personView];
    
    [self.view addSubview:self.carinfoView];
    
    [self.view addSubview:self.tableView];
    
}

- (void)settingAction
{




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
