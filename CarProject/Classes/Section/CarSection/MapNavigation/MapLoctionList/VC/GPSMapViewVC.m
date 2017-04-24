//
//  GPSMapViewVC.m
//  CarProject
//
//  Created by 董诗磊 on 2017/4/18.
//  Copyright © 2017年 董诗磊. All rights reserved.
//

#import "GPSMapViewVC.h"

@interface GPSMapViewVC ()<MAMapViewDelegate,AMapNaviDriveViewDelegate,AMapNaviDriveManagerDelegate>

@property (nonatomic ,strong) MAMapView * mapView;

@property (nonatomic, strong) AMapGeoPoint *startPoint;
@property (nonatomic, strong) AMapGeoPoint *endPoint;

@property (nonatomic, strong) AMapNaviDriveView *driveView;

@property (nonatomic, strong) AMapNaviDriveManager *driveManager;


//@property (nonatomic, strong) MoreMenuView *moreMenu;


@end

@implementation GPSMapViewVC



- (MAMapView *)mapView
{

    if (_mapView == nil) {
        
        _mapView = [[MAMapView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        
        _mapView.delegate = self;
        
    }
    
    return _mapView;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.startPoint = self.model.startMaplocation;
    
    self.endPoint = self.model.endMaplocation;
    
    [self.view addSubview:self.mapView];
    
    
    self.driveView = [[AMapNaviDriveView alloc] initWithFrame:self.view.bounds];
    self.driveView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    [self.driveView setDelegate:self];
    
    [self.view addSubview:self.driveView];
    
    [self DriveManager];
    
    [self calculateDistance];
    
}

#pragma mark - Route Plan

- (void)calculateDistance
{
    //进行路径规划
    [self.driveManager calculateDriveRouteWithStartPoints:@[self.startPoint]
                                                endPoints:@[self.endPoint]
                                                wayPoints:nil
                                          drivingStrategy:AMapNaviDrivingStrategySingleDefault];
}

- (void)DriveManager
{
   
        self.driveManager = [[AMapNaviDriveManager alloc] init];
        [self.driveManager setDelegate:self];
        
    
        [self.driveManager setPausesLocationUpdatesAutomatically:NO];
        
        //将driveView添加为导航数据的Representative，使其可以接收到导航诱导数据
        [self.driveManager addDataRepresentative:self.driveView];
}

#pragma mark - AMapNaviDriveManager Delegate

- (void)driveManager:(AMapNaviDriveManager *)driveManager error:(NSError *)error
{
    NSLog(@"error:{%ld - %@}", (long)error.code, error.localizedDescription);
}

- (void)driveManagerOnCalculateRouteSuccess:(AMapNaviDriveManager *)driveManager
{
    
    
    //开始GPS导航
    [self.driveManager startGPSNavi];
}


- (BOOL)driveManagerIsNaviSoundPlaying:(AMapNaviDriveManager *)driveManager
{
    return [[SpeechSynthesizer sharedSpeechSynthesizer] isSpeaking];
}

- (void)driveManager:(AMapNaviDriveManager *)driveManager playNaviSoundString:(NSString *)soundString soundStringType:(AMapNaviSoundType)soundStringType
{
    NSLog(@"playNaviSoundString:{%ld:%@}", (long)soundStringType, soundString);
    
    [[SpeechSynthesizer sharedSpeechSynthesizer] speakString:soundString];
}

#pragma mark - AMapNaviWalkViewDelegate

- (void)driveViewCloseButtonClicked:(AMapNaviDriveView *)driveView
{
    //停止导航
    [self.driveManager stopNavi];
    [self.driveManager removeDataRepresentative:self.driveView];
    
    [[SpeechSynthesizer sharedSpeechSynthesizer] isSpeaking];
    
    [[SpeechSynthesizer sharedSpeechSynthesizer] speakString:@"退出导航"];

    [self.navigationController popViewControllerAnimated:YES];
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
