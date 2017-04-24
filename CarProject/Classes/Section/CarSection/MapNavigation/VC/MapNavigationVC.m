//
//  MapNavigationVC.m
//  CarProject
//
//  Created by 董诗磊 on 2017/4/18.
//  Copyright © 2017年 董诗磊. All rights reserved.
//

#import "MapNavigationVC.h"

#import "xfTools.h"

@interface MapNavigationVC ()<AMapSearchDelegate,CAAnimationDelegate>

@property (nonatomic ,strong)
            MapNavigationVCNabigationView *navigntionView;

@property (nonatomic ,strong) UIButton * voiceBtn;

@property (nonatomic ,strong) UILabel * voiceLable;

@property (nonatomic ,strong) AMapSearchAPI * search;

@property (nonatomic ,strong) NSMutableArray * dataSource;

@property (nonatomic ,strong) NSTimer * timer;



@end

@implementation MapNavigationVC

- (NSMutableArray *)dataSource
{

    if (_dataSource == nil) {
        
        _dataSource = [[NSMutableArray alloc]init];
    }
    
    return _dataSource;

}

- (UILabel *)voiceLable
{

    if (_voiceLable == nil) {
        
        _voiceLable = [[UILabel alloc]init];
        
        _voiceLable.text = @"按住说话";
        
    }
    
    return _voiceLable;


}

- (UIButton *)voiceBtn
{

    if (_voiceBtn == nil) {
        
        _voiceBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        _voiceBtn.backgroundColor = [UIColor whiteColor];
        
        [_voiceBtn setImage:[UIImage imageNamed:@"voice_40x32_"] forState:UIControlStateNormal];
        
        [_voiceBtn addTarget:self action:@selector(startRecording:) forControlEvents:UIControlEventTouchDown];
        
        [_voiceBtn addTarget:self action:@selector(endRecording:) forControlEvents:UIControlEventTouchUpInside];
        
        
    }

    return _voiceBtn;
}

#pragma mark - 开始录音
-(void)startRecording:(UIButton *)btn
{
    
    
    
    [[xfTools shareTools] updateWordList];
    
    [self circleScaleAndZoomInView:btn];
    
    self.voiceLable.text = @"正在接收";
    
    BOOL ret = [[xfTools shareTools].iFlySpeechRecognizer startListening];
    
    if (ret)
    {
        NSLog(@"语音识别服务启动成功！");
    }
    else
    {
        NSLog(@"启动识别服务失败,请稍后重试");
    }
    
}
#pragma mark - 结束录音
-(void)endRecording:(UIButton *)btn
{
    NSLog(@"结束录音,关闭帧动画");
    
    [[xfTools shareTools].iFlySpeechRecognizer stopListening];
    
    [btn.layer removeAnimationForKey:@"scale-layer"];
    
    self.voiceLable.text = @"按住说话";
    
    [xfTools shareTools].block = ^(NSString *xfStr) {
      
        NSLog(@"结果====%@",xfStr);
        
    };
    
    
}


- (void)voiceBtnAction:(UIButton *)btn{
    
    
  //
//    
//    btn.transform = CGAffineTransformMakeScale(0.1, 0.1);
//
//    
//    
//    LoctionLIstVC * listVC = [[LoctionLIstVC alloc]init];
//    
//    listVC.tempDataSource = self.dataSource;
//
//    //[self.navigationController pushViewController:listVC animated:YES];
    
    self.timer = [NSTimer timerWithTimeInterval:3 repeats:NO block:^(NSTimer * _Nonnull timer) {
       
        
        
    }];

}

-(void)circleScaleAndZoomInView:(UIView *)view{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    //动画持续时间
    animation.duration = 0.3;
    // 动画结束时执行逆动画
    animation.autoreverses = NO;
    
    animation.removedOnCompletion = NO;
    
    animation.delegate = self;
    
    animation.fillMode = kCAFillModeForwards;
    // 开始时的倍率
    animation.fromValue = [NSNumber numberWithFloat:-1.0];
    // 结束时的倍率
    animation.toValue = [NSNumber numberWithFloat:-1.5];
    // 添加动画
    [view.layer addAnimation:animation forKey:@"scale-layer"];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{

    if (flag) {
        
        
    }


}

- (MapNavigationVCNabigationView *)navigntionView
{
    
    if (_navigntionView == nil) {
        
        _navigntionView = [[MapNavigationVCNabigationView alloc]init];
        
        __weak MapNavigationVC *selfVC = self;
        
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
    
    self.view.backgroundColor = KGrayColor;
    
    [self.view addSubview:self.navigntionView];
    
    self.navigntionView.sd_layout
    .topSpaceToView(self.view, 0)
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .heightIs(64);
    
    
    UILabel * whereLable = [[UILabel alloc]init];
    
    whereLable.text = @"您想去哪里?";
    
    whereLable.font = [UIFont systemFontOfSize:23];
    
    [self.view addSubview:whereLable];
    
    whereLable.sd_layout
    .centerXEqualToView(self.view)
    .centerYEqualToView(self.view)
    .heightIs(35);
    
    [whereLable setSingleLineAutoResizeWithMaxWidth:200];
    
    [self.view addSubview:self.voiceBtn];
    
    self.voiceBtn.sd_cornerRadius = [NSNumber numberWithFloat:40.0];
    
    self.voiceBtn.sd_layout
    .centerXEqualToView(self.view)
    .bottomSpaceToView(self.view, 100)
    .widthIs(80)
    .heightIs(80);
    
    
    [self.view addSubview:self.voiceLable];
    
    self.voiceLable.sd_layout
    .topSpaceToView(self.voiceBtn, 20)
    .centerXEqualToView(self.view)
    .heightIs(30);
    
    [self.voiceLable setSingleLineAutoResizeWithMaxWidth:200];
    
    
    self.search = [[AMapSearchAPI alloc] init];
    self.search.delegate = self;
    
    [self searchPoi];
    
}

- (void)searchPoi{

    AMapPOIKeywordsSearchRequest *request = [[AMapPOIKeywordsSearchRequest alloc] init];
    
    request.keywords            = @"郑州";
    //request.city                = @"郑州";
    request.requireExtension    = YES;
    
    /*  搜索SDK 3.2.0 中新增加的功能，只搜索本城市的POI。*/
    //request.cityLimit           = YES;
    request.requireSubPOIs      = YES;
    
    
   [self.search AMapPOIKeywordsSearch:request];




}

/* POI 搜索回调. */
- (void)onPOISearchDone:(AMapPOISearchBaseRequest *)request response:(AMapPOISearchResponse *)response
{
    if (response.pois.count == 0)
    {
        return;
    }
    
    //解析response获取POI信息，具体解析见 Demo
    
    NSDictionary * loctionDic = [[NSUserDefaults standardUserDefaults] objectForKey:@"loction"];
    
    [response.pois enumerateObjectsUsingBlock:^(AMapPOI * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        //1.将两个经纬度点转成投影点
        MAMapPoint point1 = MAMapPointForCoordinate(CLLocationCoordinate2DMake(obj.location.latitude,obj.location.longitude));
        MAMapPoint point2 = MAMapPointForCoordinate(CLLocationCoordinate2DMake([[loctionDic objectForKey:@"latitude"] floatValue],[[loctionDic objectForKey:@"longitude"] floatValue]));
        //2.计算距离
        CLLocationDistance distance = MAMetersBetweenMapPoints(point1,point2);
        
        MapNavigationModel * model = [[MapNavigationModel alloc]init];
        
        model.locationNameStr = obj.name;
        
        model.addressStr = obj.address;
        
        model.distanceStr = [NSString stringWithFormat:@"%.0fkm",distance/1000];
        
        model.endMaplocation = obj.location;
        
        AMapGeoPoint * endpoint = [[AMapGeoPoint alloc]init];
        
        endpoint.latitude = [[loctionDic objectForKey:@"latitude"] floatValue];
        
        endpoint.longitude = [[loctionDic objectForKey:@"longitude"] floatValue];
        
        model.startMaplocation = endpoint;
        
        [self.dataSource addObject:model];
        
    }];
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
