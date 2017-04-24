//
//  AVAudioPalyerTools.h
//  AVAudioPlayer
//
//  Created by 董诗磊 on 2017/1/11.
//  Copyright © 2017年 董诗磊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

typedef void(^FinshPlay)();
typedef void(^PlayErrorMsg)(NSString *);

@class AVAudioPalyerTools;

@protocol AVAudioPalyerToolsDelegate <NSObject>

@optional

//缓存进度
- (void)loadedTimeRangesWithValue:(CGFloat)value;

//总共的时间
- (void)totalTimeWithValueStr:(NSString *)valueStr;

//当前播放的时间
- (void)currentTimeWithValueStr:(NSString *)valueStr;

//silder进度
- (void)sliderWithValue:(NSString *)valueStr;

@end

@interface AVAudioPalyerTools : NSObject<AVAudioPlayerDelegate>

@property (nonatomic,strong)AVPlayer * player;

@property (nonatomic,strong) NSTimer * timer;

@property (nonatomic,copy)FinshPlay finsh_play;

@property (nonatomic,copy)PlayErrorMsg play_error;

@property(nonatomic, strong) id timeOber;

@property (nonatomic,assign)id<AVAudioPalyerToolsDelegate>delegate;

+(AVAudioPalyerTools*)shareIntance;

- (void)beginPlayAudioWithPath:(NSURL *)path FinshPlay:(void(^)())successedPlay WithPlayErrorMsg:(void(^)(NSString *))errorMsg;

- (void)audioPlayWithPlayBlock:(void(^)())successed;

- (void)audioPauseWithPauseBlock:(void(^)())successed;

@end
