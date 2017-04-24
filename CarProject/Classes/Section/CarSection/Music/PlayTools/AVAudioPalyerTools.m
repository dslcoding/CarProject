//
//  AVAudioPalyerTools.m
//  AVAudioPlayer
//
//  Created by 董诗磊 on 2017/1/11.
//  Copyright © 2017年 董诗磊. All rights reserved.
//

#import "AVAudioPalyerTools.h"

static const NSString * ItemStatusContext;

static AVAudioPalyerTools * _player;

@interface AVAudioPalyerTools ()

@property(nonatomic,strong) AVPlayerItem * playerItme;



@property(nonatomic,assign)BOOL isPlay;

@end

@implementation AVAudioPalyerTools

+(AVAudioPalyerTools*)shareIntance
{

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _player = [[AVAudioPalyerTools alloc]init];
        
    });
    
    return _player;



}

- (AVPlayer*)player
{

    if (_player == nil) {
        
        _player = [[AVPlayer alloc]init];
    }

    return _player;

}


- (NSTimer *)timer
{
    if (_timer == nil) {
        
        
        _timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(updateProgress) userInfo:nil repeats:YES];
        
        [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSDefaultRunLoopMode];
        
    }
    return _timer;
}
- (void)beginPlayAudioWithPath:(NSURL *)path FinshPlay:(void(^)())successedPlay WithPlayErrorMsg:(void(^)(NSString *))errorMsg
{

    NSAssert(path, @"path is not null");
    
   
    
    self.player = nil;
    
    self.playerItme = [[AVPlayerItem alloc]initWithURL:path];
    
    [self.playerItme addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionInitial context:&ItemStatusContext];

   [self.playerItme addObserver:self forKeyPath:@"loadedTimeRanges" options:NSKeyValueObservingOptionNew context:nil];

                        
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(palaydidFinsh:) name:AVPlayerItemDidPlayToEndTimeNotification object:self.playerItme];
    
    //self.player = [[AVPlayer alloc]initWithPlayerItem:self.playerItme];
    
    [self.player replaceCurrentItemWithPlayerItem:self.playerItme];
    
    [self.player play];
    
    
    
    //play finsh
    
    self.finsh_play = ^{
    
        successedPlay();
    
    };
    
    //play error
    
    self.play_error = ^(NSString * eror){
    
        errorMsg(eror);
    
    };


}


#pragma mark KVO

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{


    if (context == &ItemStatusContext) {
        dispatch_async(dispatch_get_main_queue(),
                       ^{
                           [self setsyncUI];
                       });
        return;
    }
    
    if ([keyPath isEqualToString:@"loadedTimeRanges"]) {
        
        NSTimeInterval timeIntervarl = [self availableDuration];
        
        CMTime duration = self.player.currentItem.duration;
        
        CGFloat totalDuration = CMTimeGetSeconds(duration);
        
        
        
        
        if ([self.delegate respondsToSelector:@selector(loadedTimeRangesWithValue:)]) {
            
            [self.delegate loadedTimeRangesWithValue:timeIntervarl / totalDuration];
            
            NSLog(@"=====%f",timeIntervarl / totalDuration);

        }
        
        
    }
    
}


- (void)setsyncUI{
    
    
    if ((self.player.currentItem != nil) &&
        ([self.player.currentItem status] == AVPlayerItemStatusReadyToPlay)) {
        
        [self addProgressObserver];
        
    }
    
}

#pragma mark - 监控
/**
 *  给播放器添加进度更新
 */
-(void)addProgressObserver{
    AVPlayerItem *playerItem=self.player.currentItem;
    
    float total=CMTimeGetSeconds([playerItem duration]);
    
    NSString * totalStr = [self getMMSSFromSS:[NSString stringWithFormat:@"%.2f",total]];
    
    if ([self.delegate respondsToSelector:@selector(totalTimeWithValueStr:)]) {
        
        [self.delegate totalTimeWithValueStr:totalStr];
    }

    
   // self.totalTimeLabel.text = totalStr;
    
    
    __weak AVAudioPalyerTools * selfVC = self;
    
    self.timeOber = [self.player addPeriodicTimeObserverForInterval:CMTimeMake(1.0, 1.0) queue:dispatch_get_main_queue() usingBlock:^(CMTime time) {
        float current=CMTimeGetSeconds(time);
        
        float total=CMTimeGetSeconds([playerItem duration]);
        
        
        NSString * currentStr = [selfVC getMMSSFromSS:[NSString stringWithFormat:@"%f",current]];
        
        if ([selfVC.delegate respondsToSelector:@selector(currentTimeWithValueStr:)]) {
            
            [selfVC.delegate currentTimeWithValueStr:currentStr];
        }

        
        //NSLog(@"当前已经播放%.2fs.",current);
        if (current) {
            
            if ([selfVC.delegate respondsToSelector:@selector(sliderWithValue:)]) {
                
                [selfVC.delegate sliderWithValue:[NSString stringWithFormat:@"%f",current/total]];
            }
            
        }
    }];
}



#pragma mark 计算缓冲进度
- (NSTimeInterval)availableDuration {
    NSArray *loadedTimeRanges = [[self.player currentItem] loadedTimeRanges];
    CMTimeRange timeRange = [loadedTimeRanges.firstObject CMTimeRangeValue];// 获取缓冲区域
    float startSeconds = CMTimeGetSeconds(timeRange.start);
    float durationSeconds = CMTimeGetSeconds(timeRange.duration);
    NSTimeInterval result = startSeconds + durationSeconds;// 计算缓冲总进度
    return result;
}


#pragma mark begin play

- (void)audioPlayWithPlayBlock:(void(^)())successed{

    
        [self.player play];
        
        //[self.timer setFireDate:[NSDate date]];
        
        successed();


}

#pragma mark  pause

- (void)audioPauseWithPauseBlock:(void(^)())successed

{

          [self.player pause];
        
          //[self.timer setFireDate:[NSDate distantFuture]];
          successed();

}

#pragma mark update Progress

- (void)updateProgress
{

        
//    NSMutableDictionary * dic = [[NSMutableDictionary alloc]init];
//    [dic setObject: [self getMMSSFromSS: [NSString stringWithFormat:@"%.2f",self.player.currentTime] ]  forKey:@"current"];
//    
//    [dic setObject: [self getMMSSFromSS: [NSString stringWithFormat:@"%.2f",self.player.duration] ]  forKey:@"total"];
//    
//    [dic setObject:[NSString stringWithFormat:@"%.2f",self.player.currentTime/self.player.duration] forKey:@"progress"];
//
//    if ([self.delegate respondsToSelector:@selector(AVAudioProgress:)]) {
//        
//        [self.delegate AVAudioProgress:dic];
//    }

}

-(NSString *)getMMSSFromSS:(NSString *)totalTime{
    
    NSInteger seconds = [totalTime integerValue];
    
    //format of hour
    //NSString *str_hour = [NSString stringWithFormat:@"%02ld",seconds/3600];
    //format of minute
    NSString *str_minute = [NSString stringWithFormat:@"%02ld",(seconds%3600)/60];
    //format of second
    NSString *str_second = [NSString stringWithFormat:@"%02ld",seconds%60];
    //format of time
    NSString *format_time = [NSString stringWithFormat:@"%@:%@",str_minute,str_second];
    
    return format_time;
    
}

#pragma mark nsnotificationmethed

- (void)routeChange{

    [self audioPauseWithPauseBlock:^{
        
    }];


}


#pragma mark NSNotification

- (void)palaydidFinsh:(NSNotification *)notification
{
    
//    if (self.play_error) {
//        
//        self.play_error([error localizedDescription]);
//    }
////
    
    [self.player seekToTime:kCMTimeZero];
    
    if (self.finsh_play) {
        
        self.finsh_play();
    }
    
    [self.timer invalidate];
    
    self.player = nil;

}

- (void)dealloc
{
    
    [self.player removeTimeObserver:self.timeOber];
    
    [self.playerItme removeObserver:self forKeyPath:@"status"];
    
    [self.playerItme removeObserver:self forKeyPath:@"loadedTimeRanges"];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:AVPlayerItemDidPlayToEndTimeNotification object:nil];

}
@end
