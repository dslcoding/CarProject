//
//  CarMusicVC.m
//  CarProject
//
//  Created by 董诗磊 on 2017/4/19.
//  Copyright © 2017年 董诗磊. All rights reserved.
//

#import "CarMusicVC.h"


@interface CarMusicVC ()<PlayMusicViewDelegate,AVAudioPalyerToolsDelegate,CarMuscListViewDelegate,CarMuscListViewDelegate>
{

    NSInteger _songIndex;

}

@property (nonatomic,assign) BOOL isplay;

@property (nonatomic ,assign) BOOL isShowListView;

@property (nonatomic ,strong) PlayMusicView * playView;

@property (nonatomic ,strong) CarMusicVCNavigationView *navigntionView;

@property (nonatomic ,strong) UILabel * songTitleLable;

@property (nonatomic ,strong) UILabel * songAuthorLable;

@property (nonatomic ,strong) NSMutableArray * dataSorce;

@property (nonatomic ,strong) CarMuscListView * listView;

@property (nonatomic ,strong) UIImageView * roteView;


@end

@implementation CarMusicVC

- (CarMuscListView *)listView
{

    if (_listView == nil) {
        
        _listView = [[CarMuscListView alloc]initWithFrame:CGRectMake(0, 1800, self.view.frame.size.width, self.view.frame.size.height - 300)];
        
        _listView.hidden = YES;
        
        _listView.delegate = self;
        
        
    }

    return _listView;
}

- (NSMutableArray *)dataSorce
{

    if (_dataSorce == nil) {
        
        _dataSorce = [[NSMutableArray alloc]init];
    }
    
    return _dataSorce;

}

- (CarMusicVCNavigationView *)navigntionView
{
    
    if (_navigntionView == nil) {
        
        _navigntionView = [[CarMusicVCNavigationView alloc]init];
        
        __weak CarMusicVC *selfVC = self;
        
        _navigntionView.option = ^{
            
            [selfVC.navigationController popViewControllerAnimated:YES];
            
            
        };
        
        _navigntionView.rightOption = ^{
            
            selfVC.isShowListView = !selfVC.isShowListView;
            
            
            if (selfVC.isShowListView) {
                
                if (self.dataSorce.count == 0) {
                    
                    [[DSLHUD shareDSLHUD] showHUDWithLable:@"没有歌曲" SuperView:selfVC.view FontSize:14 HudDismissTiem:1.2 HudDismissBlock:^{
                        
                    }];
                }else{
                
                [selfVC listViewShow];
                
                }
                
                
                
            }else
            {
            
              [selfVC listViewDismiss];
            
            
            
            }
          
            
            
        };
    }
    
    return _navigntionView;
}


- (PlayMusicView *)playView {

    if (_playView == nil) {
        
        
        _playView =  [[PlayMusicView alloc]init];
        
        _playView.delegate = self;
        
        _playView.backgroundColor = KGrayColor;
    }

    return _playView;

}

- (UILabel * )songTitleLable
{

    if (_songTitleLable == nil) {
        
        _songTitleLable = [[UILabel alloc]init];
        
        _songTitleLable.textAlignment = NSTextAlignmentCenter;
        
    }
    
    return _songTitleLable;

}

- (UILabel * )songAuthorLable
{
    
    if (_songAuthorLable == nil) {
        
        _songAuthorLable = [[UILabel alloc]init];
        
        
         _songAuthorLable.textAlignment = NSTextAlignmentCenter;
        
    }
    
    return _songAuthorLable;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self loadDataSource];
    
    
    
    self.view.backgroundColor = KGrayColor;
    
    [self.view addSubview:self.songAuthorLable];
    
    [self.view addSubview:self.songTitleLable];
    
    self.songTitleLable.sd_layout
    .leftSpaceToView(self.view, 20)
    .rightSpaceToView(self.view, 20)
    .topSpaceToView(self.view, 64)
    .heightIs(25);
    
    self.songAuthorLable.sd_layout
    .centerXEqualToView(self.view)
    .heightIs(20)
    .topSpaceToView(self.songTitleLable, 10);
    
    [self.songAuthorLable setSingleLineAutoResizeWithMaxWidth:200];
    
    
    
    [self.view addSubview:self.navigntionView];
    
    self.navigntionView.sd_layout
    .topSpaceToView(self.view, 0)
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .heightIs(64);

    
    [self.view addSubview:self.playView];
    
    self.playView.sd_layout
    .centerXEqualToView(self.view)
    .bottomSpaceToView(self.view, 0)
    .heightIs(150)
    .widthIs(self.view.frame.size.width);
    
    
   
    
    
    self.roteView = [[UIImageView alloc]init];
    
    self.roteView.image = [UIImage imageNamed:@"aboutus_logo_100x100_"];
    
    self.roteView.layer.cornerRadius = 100;
    
    self.roteView.layer.masksToBounds = YES;
    
    [self.view addSubview:self.roteView];
    
    self.roteView.sd_layout
    .centerXEqualToView(self.view)
    .centerYEqualToView(self.view)
    .widthIs(200)
    .heightIs(200);
    
    CABasicAnimation *rotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    
    [rotation setToValue:@(M_PI*2)];
    
    [rotation setDuration:4];
    
    [rotation setRepeatCount:MAXFLOAT];
    
    [self.roteView.layer addAnimation:rotation forKey:@"rotation"];
    
    [self.view addSubview:self.listView];
    

    
}

- (void)loadDataSource
{

    dispatch_queue_t queue = dispatch_queue_create(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(queue, ^{
       
        self.dataSorce = [[PlayTools shareTools] songDataSource];
        
        self.listView.tempDataSource = self.dataSorce;
        
       // NSLog(@"VC===%@",self.dataSorce);
        
        if (self.dataSorce.count  != 0) {
            
            CarMusicModel *model = [self.dataSorce objectAtIndex:0];
            
            [self playSongWithModel:model];
            
        }
        
       
        
    });

}


- (void)playSongWithModel:(CarMusicModel *)model{
    
    
    _songIndex = 0;
    
    NSUInteger index = [self.dataSorce indexOfObject:model];
    
    _songIndex = index;
    
    
    [[AVAudioPalyerTools shareIntance].player pause];
    
    [AVAudioPalyerTools shareIntance].player = nil;


    self.songTitleLable.text = model.songTitle;
    
    self.songAuthorLable.text = model.artistStr;
    
   
    
    [AVAudioPalyerTools shareIntance].delegate = self;
    
    [[AVAudioPalyerTools shareIntance] beginPlayAudioWithPath:model.songURL FinshPlay:^{
        
        [[DSLHUD shareDSLHUD] showHUDWithLable:@"播放完成" SuperView:self.view FontSize:16 HudDismissTiem:1.0 HudDismissBlock:^{
            
            
        }];
        
    self.isplay = YES;

    [self.playView.pauseBtn  setImage:[UIImage imageNamed:@"pause_44x44_"] forState:UIControlStateNormal];

    
    [self.playView.dslSlider setValue:0 animated:YES];
        
    } WithPlayErrorMsg:^(NSString * error) {
        
        
    }];





}

#pragma mark palyMusicDelegate

- (void)forwordSongActon
{
    
    NSInteger forwordSongIndex =  _songIndex - 1;
    
    if (forwordSongIndex<0) {
        
        [[DSLHUD shareDSLHUD] showHUDWithLable:@"没上首啦" SuperView:self.view FontSize:15 HudDismissTiem:1 HudDismissBlock:^{
            
        }];
        
    }else{
    
        [self playSongWithModel:self.dataSorce[_songIndex - 1]];
        
    
    }

}

- (void)startPalyAction:(UIButton *)btn
{

    self.isplay = !self.isplay;
    
    if (self.isplay) {
        
        [[AVAudioPalyerTools shareIntance] audioPlayWithPlayBlock:^{
            
          
            
            [btn setImage:[UIImage imageNamed:@"pause_44x44_"] forState:UIControlStateNormal];
            
            
        }];
    }else
    {
        [[AVAudioPalyerTools shareIntance]audioPauseWithPauseBlock:^{
           
            
            [btn setImage:[UIImage imageNamed:@"start_44x44_"] forState:UIControlStateNormal];
        }];
        
        
        
    }



}

- (void)nextSongAction
{

    NSInteger forwordSongIndex =  _songIndex + 1;
    
    if (forwordSongIndex == self.dataSorce.count) {
        
        [[DSLHUD shareDSLHUD] showHUDWithLable:@"没下首啦" SuperView:self.view FontSize:15 HudDismissTiem:1 HudDismissBlock:^{
            
        }];
        
    }else{
        
        [self playSongWithModel:self.dataSorce[_songIndex +1]];
        
        
    }
    




}
#pragma mark AVAudioPalyerToolsDelegate

#pragma mark 缓存进度
- (void)loadedTimeRangesWithValue:(CGFloat)value
{
    
    
    
    self.playView.dataDic = @{@"progress":[NSString stringWithFormat:@"%f",value]};
    
}

- (void)totalTimeWithValueStr:(NSString *)valueStr
{
 
    self.playView.totalTimeStr = valueStr;
 
}

- (void)currentTimeWithValueStr:(NSString *)valueStr
{

    self.playView.startTimeStr = valueStr;

}

- (void)sliderWithValue:(NSString *)valueStr
{
    
    self.playView.dataDic = @{@"slider":valueStr};
    
}

#pragma mark CarMuscListViewDelegate

- (void)selectSongWithModel:(CarMusicModel *)model
{

    [self playSongWithModel:model];

    [self listViewDismiss];

}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{

    [self listViewDismiss];

}

#pragma mark listViewDismiss

- (void)listViewDismiss{

    
    [UIView animateWithDuration:0.3 animations:^{
        
        self.listView.hidden = YES;
        
        self.listView.frame = CGRectMake(0, 1800, self.view.frame.size.width, self.view.frame.size.height - 300);
    }];


}

#pragma mark listViewShow
- (void)listViewShow{


    [UIView animateWithDuration:0.3 animations:^{
        
        self.listView.hidden = NO;
        
        self.listView.frame = CGRectMake(0, self.view.frame.size.height - 300, self.view.frame.size.width, 300);
        
    } completion:^(BOOL finished) {
        
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
