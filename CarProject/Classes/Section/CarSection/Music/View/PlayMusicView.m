//
//  PlayMusicView.m
//  CarProject
//
//  Created by 董诗磊 on 2017/4/18.
//  Copyright © 2017年 董诗磊. All rights reserved.
//

#import "PlayMusicView.h"

@interface PlayMusicView ()

@property (nonatomic ,strong) UILabel * startTimeLabel;

@property (nonatomic ,strong) UILabel * endTimeLabel;


@property (nonatomic ,strong) UIProgressView *dslProgress;

@property (nonatomic ,strong) UIButton *forwordSongBtn;

@property (nonatomic ,strong) UIButton *nextSongBtn;





@end

@implementation PlayMusicView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{

    
    if (self = [super initWithFrame:frame]) {
        
        [self setupView];
        
    }

    return self;
}

- (UIButton *)forwordSongBtn
{

    if (_forwordSongBtn == nil) {
        
        _forwordSongBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [_forwordSongBtn setImage:[UIImage imageNamed:@"presong_44x44_"] forState:UIControlStateNormal];
        
        [_forwordSongBtn addTarget:self action:@selector(forwordSongBtnActon) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    return _forwordSongBtn;

}

- (void)forwordSongBtnActon{

    if ([self.delegate respondsToSelector:@selector(forwordSongActon)]) {
        
        [self.delegate forwordSongActon];
    }


}

- (UIButton *)pauseBtn
{
    
    if (_pauseBtn == nil) {
        
        _pauseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [_pauseBtn setImage:[UIImage imageNamed:@"start_44x44_"] forState:UIControlStateNormal];
        
        [_pauseBtn addTarget:self action:@selector(pauseBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    return _pauseBtn;
    
}

-(void)pauseBtnAction:(UIButton *)btn{

    if ([self.delegate respondsToSelector:@selector(startPalyAction:)]) {
        
        [self.delegate startPalyAction:btn];
    }


}


- (UIButton *)nextSongBtn
{
    
    if (_nextSongBtn == nil) {
        
        _nextSongBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [_nextSongBtn setImage:[UIImage imageNamed:@"nextsong_44x44_"] forState:UIControlStateNormal];
        
        [_nextSongBtn addTarget:self action:@selector(nextSongBtnAction) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    return _nextSongBtn;
    
}

- (void)nextSongBtnAction{

    if ([self.delegate respondsToSelector:@selector(nextSongAction)]) {
        
        [self.delegate nextSongAction];
    }


}

- (UILabel *)startTimeLabel
{

    
    if (_startTimeLabel == nil) {
        
        _startTimeLabel = [[UILabel alloc]init];
        
        _startTimeLabel.text = @"00:00";
        
    }

    return _startTimeLabel;
}

- (UILabel *)endTimeLabel
{

    if (_endTimeLabel == nil) {
        
        _endTimeLabel = [[UILabel alloc]init];
        
        _endTimeLabel.text = @"00:00";
        
    }
    
    return _endTimeLabel;

}

- (UISlider *)dslSlider
{

    if (_dslSlider == nil) {
        
        _dslSlider = [[UISlider alloc]init];
        
        _dslSlider.value = 0;
        
        //设置silder左右两边的颜色
        [_dslSlider setMinimumTrackTintColor:[UIColor clearColor]];
        
        [_dslSlider setMaximumTrackTintColor:[UIColor clearColor]];
        
        _dslSlider.continuous = YES;

        
        [_dslSlider addTarget:self action:@selector(panSliderAction:) forControlEvents:UIControlEventValueChanged];
    }
    
    return _dslSlider;

}

#pragma mark slider拖动
- (void)panSliderAction:(UISlider *)slider
{
    
    CGFloat totalDuration = CMTimeGetSeconds([AVAudioPalyerTools shareIntance].player.currentItem.duration);
    
    CMTime fiveSecondsIn = CMTimeMake(totalDuration *slider.value, 1);
    
    
    [[AVAudioPalyerTools shareIntance].player seekToTime:fiveSecondsIn toleranceBefore:kCMTimeZero toleranceAfter:kCMTimeZero completionHandler:^(BOOL finished) {
        
        NSLog(@"快进完成");
        
    }];
    
}

- (UIProgressView *)dslProgress
{

    
    if (_dslProgress == nil) {
        
        _dslProgress = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
        
        _dslProgress.progressTintColor = [UIColor blueColor];
        
        _dslProgress.trackTintColor    = [UIColor blueColor];
        
        _dslProgress.progress = 0;
        
        
    }

    
    return _dslProgress;
}

- (void)setStartTimeStr:(NSString *)startTimeStr
{

    self.startTimeLabel.text = startTimeStr;


}

- (void)setTotalTimeStr:(NSString *)totalTimeStr
{

    self.endTimeLabel.text = totalTimeStr;

}

- (void)setDataDic:(NSMutableDictionary *)dataDic
{
    
    
    [self.dslProgress setProgress:[[dataDic objectForKey:@"progress"] floatValue] animated:YES];

    [self.dslSlider setValue:[[dataDic objectForKey:@"slider"] floatValue] animated:YES];

}

- (void)setupView{

    [self sd_addSubviews:@[self.startTimeLabel,self.dslProgress,self.dslSlider,self.endTimeLabel,self.forwordSongBtn,self.pauseBtn,self.nextSongBtn]];

    self.dslSlider.sd_layout
    .topSpaceToView(self, 40 + 25/2)
    .centerXEqualToView(self)
    .widthIs(SCREEN_WIDTH - 130)
    .heightIs(2);
    
    self.dslProgress.sd_layout
    .topSpaceToView(self, 40 + 25/2)
    .centerXEqualToView(self)
    .widthIs(SCREEN_WIDTH - 130)
    .heightIs(2);
    
    self.startTimeLabel.sd_layout
    .rightSpaceToView(self.dslProgress, 5)
    .topSpaceToView(self, 40)
    .widthIs(50)
    .heightIs(25);
    
    self.endTimeLabel.sd_layout
    .leftSpaceToView(self.dslProgress, 5)
    .topSpaceToView(self, 40)
    .widthIs(50)
    .heightIs(25);
    
    self.pauseBtn.sd_layout
    .centerXEqualToView(self)
    .topSpaceToView(self.dslSlider, 25)
    .heightIs(50)
    .widthIs(50);
    
    self.forwordSongBtn.sd_layout
    .rightSpaceToView(self.pauseBtn, 35)
    .topSpaceToView(self.dslSlider, 25)
    .heightIs(50)
    .widthIs(50);
    
    self.nextSongBtn.sd_layout
    .leftSpaceToView(self.pauseBtn, 35)
    .topSpaceToView(self.dslSlider, 25)
    .heightIs(50)
    .widthIs(50);


}
@end
