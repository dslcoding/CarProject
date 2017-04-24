//
//  AddCarVC.m
//  CarProject
//
//  Created by 董诗磊 on 2017/4/17.
//  Copyright © 2017年 董诗磊. All rights reserved.
//

#import "AddCarVC.h"

@interface AddCarVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic ,strong) NavigationView * navigntionView;

@property (nonatomic ,strong) UITableView * addCarTableView;

@property (nonatomic ,strong) AddCarTableHeadView * headView;

@property (nonatomic ,strong) NSMutableArray * dataSource;

@property (nonatomic ,strong) AddCarTableFootView * footView;
@end

@implementation AddCarVC

- (NSMutableArray *)dataSource
{

    if (_dataSource == nil) {
        
        _dataSource = [[NSMutableArray alloc]init];
        
        CarLicenseNumberModel * carLicenseNumberModel = [CarLicenseNumberModel initWithCarLicenseNumber:@"车牌号码" TFPlaceholder:@""];
        
        [_dataSource addObject:carLicenseNumberModel];
        
        CarTableCellModel * carModel = [CarTableCellModel initWithCarMdoelWihtCarRemark:@"车型" TFPlaceholder:@"选填"];
        
        [_dataSource addObject:carModel];
        
        AlertCarTableCellModel * carEngineNumberModel = [AlertCarTableCellModel initWithCarEngineNumberWithCarFrameNumber:@"发动机号" TFPlaceholder:@"发动机号后6位"];
        
        [_dataSource addObject:carEngineNumberModel];
        
        AlertCarTableCellModel * carFrameNumberModel = [AlertCarTableCellModel initWithCarEngineNumberWithCarFrameNumber:@"车架号" TFPlaceholder:@"车架号6位"];
        
        [_dataSource addObject:carFrameNumberModel];

        
        DrivinglicenseTableModel *carDriverLienceModel = [DrivinglicenseTableModel initWithCarDriverLience:@"行驶证照" TFPlaceholder:@"选填"];
        
          [_dataSource addObject:carDriverLienceModel];
        
        CarTableCellModel * carRemarkModel = [CarTableCellModel initWithCarMdoelWihtCarRemark:@"备注" TFPlaceholder:@"选填"];
        
          [_dataSource addObject:carRemarkModel];
        
        
        
        
    }
    
    return _dataSource;

}

- (NavigationView *)navigntionView
{

    if (_navigntionView == nil) {
        
        _navigntionView = [[NavigationView alloc]init];
        
        __weak AddCarVC *selfVC = self;
        
        _navigntionView.option = ^{
          
            [selfVC.navigationController popViewControllerAnimated:YES];
            
            
        };
    }

    return _navigntionView;
}

- (AddCarTableHeadView *)headView
{

    if (_headView == nil) {
        
        _headView = [[AddCarTableHeadView alloc]init];
        
        _headView.bounds = CGRectMake(0, 0, self.view.frame.size.width, 100);
        
        _headView.backgroundColor = [UIColor yellowColor];
    }

    return _headView;
}

- (AddCarTableFootView *)footView
{
    
    if (_footView == nil) {
        
        _footView = [[AddCarTableFootView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 60)];
    
    }
    
    return _footView;
}


- (UITableView *)addCarTableView
{
    
    if (_addCarTableView == nil) {
        
        _addCarTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64  ) style:UITableViewStylePlain];
        
        _addCarTableView.tableHeaderView = self.headView;
        

        
        _addCarTableView.tableFooterView = self.footView;
        
        _addCarTableView.backgroundColor = KGrayColor;
        
        _addCarTableView.delegate = self;
        
        _addCarTableView.dataSource = self;
        
               _addCarTableView.showsVerticalScrollIndicator = NO;
        
        [_addCarTableView registerClass:[AddCarTableCell class] forCellReuseIdentifier:@"cell"];
        
    }
    
    return _addCarTableView;
    
}

#pragma mark tableViewDataSorce&tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.dataSource.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    AddCarTableCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    CarTableCellModel * model = self.dataSource[indexPath.row];
    
    cell.model = model;
    
    
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    return 60;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{

    return 5;

}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{

    [self.view endEditing:YES];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = KGrayColor;
    
    [self.view addSubview:self.navigntionView];
    
    self.navigntionView.sd_layout
    .topSpaceToView(self.view, 0)
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .heightIs(64);
    
    [self.view addSubview:self.addCarTableView];
    
    [self registerForKeyboardNotifications];
    
}

- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
    
}

// Called when the UIKeyboardDidShowNotification is sent.
- (void)keyboardWasShown:(NSNotification*)noti{
    
    NSDictionary * info = [noti userInfo];
    
    CGSize  infoSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, infoSize.height + 20, 0.0);
    
    self.addCarTableView.contentInset = contentInsets;
    self.addCarTableView.scrollIndicatorInsets = contentInsets;
}

- (void)keyboardWillBeHidden:(NSNotification *)info{

    self.addCarTableView.contentInset = UIEdgeInsetsZero;
    
    self.addCarTableView.scrollIndicatorInsets = UIEdgeInsetsZero;


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
