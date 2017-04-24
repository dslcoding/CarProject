//
//  CarMuscList.h
//  CarProject
//
//  Created by 董诗磊 on 2017/4/19.
//  Copyright © 2017年 董诗磊. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol CarMuscListViewDelegate <NSObject>

@optional



- (void)selectSongWithModel:(CarMusicModel *)model;

@end


@interface CarMuscListView : UIView<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic ,strong) UITableView * tableView;

@property (nonatomic ,strong) NSMutableArray * dataSource;

@property (nonatomic ,strong) NSMutableArray * tempDataSource;

@property (nonatomic ,weak) id<CarMuscListViewDelegate>delegate;


@end
