//
//  NearByVC.m
//  CarProject
//
//  Created by 董诗磊 on 2017/4/17.
//  Copyright © 2017年 董诗磊. All rights reserved.
//

#import "NearByVC.h"



@interface NearByVC ()<ChoseItemsViewDelegate,AMapSearchDelegate,MAMapViewDelegate>

@property (nonatomic ,strong) NearbyNavigationView *navigntionView;

@property (nonatomic ,strong) ChoseItemsView * choseItemView;

@property (nonatomic , strong) AMapSearchAPI *search;

@property (nonatomic, strong) MAMapView *maMapView;

//标注内容数组
@property (nonatomic, strong) NSMutableArray * dataSoruce;

@end

@implementation NearByVC

- (NSMutableArray *)dataSoruce
{

    if (_dataSoruce == nil) {
        
        _dataSoruce = [[NSMutableArray alloc]init];
    }
    
    return _dataSoruce;

}

- (ChoseItemsView *)choseItemView
{

    if (_choseItemView == nil) {
        
        _choseItemView = [[ChoseItemsView alloc]initWithFrame:CGRectMake(0, 63, self.view.frame.size.width, 60)];
        
        _choseItemView.delegate = self;
        
    }
    
    return _choseItemView;

}

#pragma mark choseItemViewDelegate

- (void)trffictatusBtnAction:(BOOL)isShowTraffic
{
    
    if (isShowTraffic) {
        
        self.maMapView.showTraffic = YES;
        
    }else{
    
        self.maMapView.showTraffic = NO;
    
    }

    

}

- (void)addOilStationBtnAction
{

    [self.maMapView removeAnnotations:self.dataSoruce];
    
    [self searchApi:@"加油站"];

}

- (void)storesBtnAction
{

     [self.maMapView removeAnnotations:self.dataSoruce];
    
    [self searchApi:@"4s店"];

}

- (MAMapView *)maMapView
{

    if (_maMapView == nil) {
        

       _maMapView = [[MAMapView alloc] initWithFrame:CGRectMake(0, 64 + 60, self.view.frame.size.width, self.view.frame.size.height - 64 - 60)];

        _maMapView.delegate = self;
    }
    
    return _maMapView;

}

- (NearbyNavigationView *)navigntionView
{
    
    if (_navigntionView == nil) {
        
        _navigntionView = [[NearbyNavigationView alloc]init];
        
        __weak NearByVC *selfVC = self;
        
        _navigntionView.option = ^{
            
            [selfVC.navigationController popViewControllerAnimated:YES];
            
            
        };
    }
    
    return _navigntionView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.navigntionView];
    
    self.navigntionView.sd_layout
    .topSpaceToView(self.view, 0)
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .heightIs(64);
    
    [self.view addSubview:self.choseItemView];

    ///把地图添加至view
    [self.view addSubview:self.maMapView];
    
    self.maMapView.showsUserLocation = YES;
    
    self.maMapView.userTrackingMode = MAUserTrackingModeFollow;
    
   
   
    [self searchApi:@"加油站"];
    
    
}
- (void)searchApi:(NSString *)keyworld
{

    self.search = [[AMapSearchAPI alloc] init];
    self.search.delegate = self;
    
    
    //[[NSUserDefaults standardUserDefaults] setObject:@{@"latitude":[NSNumber numberWithFloat:location.coordinate.latitude],@"longitude":[NSNumber numberWithFloat:location.coordinate.longitude]} forKey:@"loction"];
    
    NSDictionary * loctionDic = [[NSUserDefaults standardUserDefaults] objectForKey:@"loction"];

    AMapPOIAroundSearchRequest *request = [[AMapPOIAroundSearchRequest alloc] init];
    
    request.location            = [AMapGeoPoint locationWithLatitude:[[loctionDic objectForKey:@"latitude"] floatValue] longitude:[[loctionDic objectForKey:@"longitude"] floatValue]];
    request.keywords            = keyworld;
    /* 按照距离排序. */
    request.sortrule            = 0;
    request.requireExtension    = YES;
    
   [self.search AMapPOIAroundSearch:request];

}

/* POI 搜索回调. */
- (void)onPOISearchDone:(AMapPOISearchBaseRequest *)request response:(AMapPOISearchResponse *)response
{
    if (response.pois.count == 0)
    {
        return;
    }
    
    //解析response获取POI信息，具体解析见 Demo
    
    [self.dataSoruce removeAllObjects];
    
    [response.pois enumerateObjectsUsingBlock:^(AMapPOI * _Nonnull poi, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSLog(@"======+%@",poi.address);

        
        MAPointAnnotation *pointAnnotation = [[MAPointAnnotation alloc] init];
        pointAnnotation.coordinate = CLLocationCoordinate2DMake(poi.location.latitude, poi.location.longitude);
        pointAnnotation.title = poi.name;
        
        [self.dataSoruce addObject:pointAnnotation];
        
    }];
    
   
    
    [self.maMapView addAnnotations:self.dataSoruce];
}

- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id <MAAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MAPointAnnotation class]])
    {
        static NSString *pointReuseIndentifier = @"pointReuseIndentifier";
        MAPinAnnotationView*annotationView = (MAPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:pointReuseIndentifier];
        if (annotationView == nil)
        {
            annotationView = [[MAPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:pointReuseIndentifier];
        }
        annotationView.canShowCallout= YES;       //设置气泡可以弹出，默认为NO
        annotationView.animatesDrop = YES;        //设置标注动画显示，默认为NO
        annotationView.draggable = YES;        //设置标注可以拖动，默认为NO
        annotationView.pinColor = MAPinAnnotationColorPurple;
        return annotationView;
    }
    return nil;
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
