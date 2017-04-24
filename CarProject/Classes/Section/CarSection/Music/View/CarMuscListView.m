//
//  CarMuscList.m
//  CarProject
//
//  Created by 董诗磊 on 2017/4/19.
//  Copyright © 2017年 董诗磊. All rights reserved.
//

#import "CarMuscListView.h"
@implementation CarMuscListView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (NSMutableArray *)dataSource
{

    if (_dataSource == nil) {
        
        _dataSource = [[NSMutableArray alloc]init];
    }
    
    return _dataSource;

}
- (UITableView *)tableView
{
    
    if (_tableView == nil) {
        
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        
        _tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
        
        _tableView.delegate = self;
        
        _tableView.dataSource = self;
        
        _tableView.showsVerticalScrollIndicator = NO;
        
        
        
        
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
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
     
    
    CarMusicModel * mdoel = self.dataSource[indexPath.row];
    
    cell.textLabel.text = mdoel.songTitle;
    
    return cell;
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    return 50;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

 CarMusicModel * mdoel = self.dataSource[indexPath.row];

    if ([self.delegate respondsToSelector:@selector(selectSongWithModel:)]) {
        
        [self.delegate selectSongWithModel:mdoel];
    }

}

- (instancetype)initWithFrame:(CGRect)frame
{
    
    
    if (self = [super initWithFrame:frame]) {
        
        [self setupView];
        
    }
    
    return self;
}

- (void)setTempDataSource:(NSMutableArray *)tempDataSource
{


    [self.dataSource addObjectsFromArray:tempDataSource];
    
    [self.tableView reloadData];

}

- (void)setupView{
    

    [self addSubview:self.tableView];
    
    self.tableView.sd_layout
    .spaceToSuperView(UIEdgeInsetsZero);


}

@end
