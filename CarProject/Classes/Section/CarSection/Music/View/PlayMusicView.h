//
//  PlayMusicView.h
//  CarProject
//
//  Created by 董诗磊 on 2017/4/18.
//  Copyright © 2017年 董诗磊. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PlayMusicViewDelegate <NSObject>

@optional

- (NSDictionary *)AVAudioProgress;

- (void)startPalyAction:(UIButton *)btn;

- (void)nextSongAction;

- (void)forwordSongActon;

@end

@interface PlayMusicView : UIView

//播放时间，progress，silder，
@property (nonatomic ,strong) NSDictionary * dataDic;

@property (nonatomic ,strong) UISlider *dslSlider;

@property (nonatomic ,copy) NSString * startTimeStr;

@property (nonatomic ,copy) NSString * totalTimeStr;

@property (nonatomic ,strong) UIButton * pauseBtn;



@property (nonatomic ,weak) id<PlayMusicViewDelegate>delegate;


@end
