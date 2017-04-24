//
//  xfTools.m
//  CarProject
//
//  Created by 董诗磊 on 2017/4/21.
//  Copyright © 2017年 董诗磊. All rights reserved.
//

#import "xfTools.h"
@interface xfTools ()<IFlySpeechRecognizerDelegate>


@end

static xfTools * tools = nil;

@implementation xfTools

+(xfTools *)shareTools
{

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tools = [[xfTools alloc]init];
        
        [tools initRecognizer];
    });

    return tools;
}

/**
 *设置语音识别参数
 */
-(void)initRecognizer
{
    //单例模式，无UI的实例
    if (_iFlySpeechRecognizer == nil) {
        _iFlySpeechRecognizer = [IFlySpeechRecognizer sharedInstance];
        
        [_iFlySpeechRecognizer setParameter:@"" forKey:[IFlySpeechConstant PARAMS]];
        
        //设置听写模式
        [_iFlySpeechRecognizer setParameter:@"iat" forKey:[IFlySpeechConstant IFLY_DOMAIN]];
        
        //设置音频来源为麦克风
        [_iFlySpeechRecognizer setParameter:IFLY_AUDIO_SOURCE_MIC forKey:@"audio_source"];
        
        //设置听写结果格式为json
        [_iFlySpeechRecognizer setParameter:@"json" forKey:[IFlySpeechConstant RESULT_TYPE]];
        
        //保存录音文件，保存在sdk工作路径中，如未设置工作路径，则默认保存在library/cache下
        [_iFlySpeechRecognizer setParameter:@"asr.pcm" forKey:[IFlySpeechConstant ASR_AUDIO_PATH]];
        
        [_iFlySpeechRecognizer setDelegate:self];

    }
    _iFlySpeechRecognizer.delegate = self;
    
    if (_iFlySpeechRecognizer != nil) {
        IATConfig *instance = [IATConfig sharedInstance];
        
        //设置最长录音时间
        [_iFlySpeechRecognizer setParameter:instance.speechTimeout forKey:[IFlySpeechConstant SPEECH_TIMEOUT]];
        //设置后端点
        [_iFlySpeechRecognizer setParameter:instance.vadEos forKey:[IFlySpeechConstant VAD_EOS]];
        //设置前端点
        [_iFlySpeechRecognizer setParameter:instance.vadBos forKey:[IFlySpeechConstant VAD_BOS]];
        //网络等待时间
        [_iFlySpeechRecognizer setParameter:@"20000" forKey:[IFlySpeechConstant NET_TIMEOUT]];
        
        //设置采样率，推荐使用16K
        [_iFlySpeechRecognizer setParameter:instance.sampleRate forKey:[IFlySpeechConstant SAMPLE_RATE]];
        
        [_iFlySpeechRecognizer setDelegate:self];

        
        if ([instance.language isEqualToString:[IATConfig chinese]]) {
            //设置语言
            [_iFlySpeechRecognizer setParameter:instance.language forKey:[IFlySpeechConstant LANGUAGE]];
            //设置方言
            [_iFlySpeechRecognizer setParameter:instance.accent forKey:[IFlySpeechConstant ACCENT]];
        }else if ([instance.language isEqualToString:[IATConfig english]]) {
            [_iFlySpeechRecognizer setParameter:instance.language forKey:[IFlySpeechConstant LANGUAGE]];
        }
        //设置是否返回标点符号
        [_iFlySpeechRecognizer setParameter:instance.dot forKey:[IFlySpeechConstant ASR_PTT]];
        
    }
    
}

- (void)updateWordList {
    
    [_iFlySpeechRecognizer stopListening];
    //    _upContactBtn.enabled = NO;
    //    _upWordListBtn.enabled = NO;
    [_uploader setParameter:@"iat" forKey:[IFlySpeechConstant SUBJECT]];
    [_uploader setParameter:@"userword" forKey:[IFlySpeechConstant DATA_TYPE]];
    
    //    [self showPopup];
    
    IFlyUserWords *iFlyUserWords = [[IFlyUserWords alloc] initWithJson:USERWORDS];
    
    [_uploader uploadDataWithCompletionHandler:
     ^(NSString * grammerID, IFlySpeechError *error)
     {
         //         [self onUploadFinished:error];
         if (error.errorCode == 0) {
             //             _textView.text = @"佳晨实业\n蜀南庭苑\n高兰路\n复联二\n李馨琪\n鹿晓雷\n张集栋\n周家莉\n叶震珂\n熊泽萌\n";
         }
     } name:NAME data:[iFlyUserWords toString]];
}

/**
 无界面，听写结果回调
 results：听写结果
 isLast：表示最后一次
 **/
-(void) onResults:(NSArray *)results isLast:(BOOL)isLast
{
    NSLog(@"-听写结果-----%@",results);
    
    
    NSMutableString *resultString = [[NSMutableString alloc] init];
    NSDictionary *dic = [results objectAtIndex:0];
    for(NSString *key in dic)
    {
        [resultString appendFormat:@"%@",key];
    }
    
    NSString *resultFromJson = [self stringFromJson:resultString];
    
    NSLog(@"-听写结果self.resultString = resultFromJson-----%@",resultFromJson);
    
    if (self.block) {
        
        self.block(resultFromJson);
    }
   
    
}
//音量回调
-(void)onVolumeChanged:(int)volume
{
    
       //   NSString *volStr = [NSString stringWithFormat:@"%d",volume];
    //NSLog(@"监听用户正在说话的音量大小%@",volStr);
    
}

/**
 听写结束回调
 errorCode
 0    正确
 其他  错误
 **/
-(void)onError:(IFlySpeechError *)error
{
//    NSLog(@"--------%d",error.errorCode);
//    NSString *text;
//    if(error.errorCode == 0)
//    {
//        if(self.resultString.length == 0)
//        {
//            text = @"无识别结果";
//        }
//        else
//        {
//            text = @"识别成功";
//        }
//    }
//    else
//    {
//        text = @"识别失败";
//    }
//    //[_popupView showText:text];
}
#pragma mark - 把json字符串转换成字符串
-(NSString *)stringFromJson:(NSString *)params
{
    
    if(params == NULL)
    {
        return nil;
    }
    
    NSMutableString *tempStr = [[NSMutableString alloc] init];
    NSData *paramsData = [params dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:paramsData options:kNilOptions error:nil];
    if(resultDic != nil)
    {
        NSArray *wordArray = [resultDic objectForKey:@"ws"];
        for(int i = 0;i < [wordArray count];i++)
        {
            NSDictionary *wsDic = [wordArray objectAtIndex:i];
            NSArray *cwArray = [wsDic objectForKey:@"cw"];
            
            for(int j=0;j<cwArray.count;j++)
            {
                NSDictionary *wDic = [cwArray objectAtIndex:j];
                NSString *str = [wDic objectForKey:@"w"];
                [tempStr appendString:str];
            }
        }
    }
    return tempStr;
}
#pragma mark - 处理识别的数据,这里逻辑自定义
-(NSString *)handleRecognizedStr:(NSString *)string
{
    NSMutableString *wantStr = [[NSMutableString alloc] init];
    
    //创建正则表达式
    NSString *pattern = @"[0-9]";
    //将正则表达式设置为OC规则
    
    NSRegularExpression *regular = [[NSRegularExpression alloc] initWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:nil];
    
    //利用规则测试字符串获取匹配结果
    NSArray *results = [regular matchesInString:string options:0 range:NSMakeRange(0, string.length)];
    //遍历数组,这里面的数组不是存的字符串 而是 |[字符串长度,第几个数字]具体数字 | 这样的对象
    for (NSTextCheckingResult *result in results) {
        
        NSString *str = [string substringWithRange:result.range];
        [wantStr appendString:str];
        // NSLog(@"mgm %@",str);
        
    }
    
    //    int i = 0;
    //    //去除汉子
    //    while (i<wantStr.length) {
    //        int c = [wantStr characterAtIndex:i];
    //        if (c>0x4e00&&c<0x9fff) {
    //            NSRange range = NSMakeRange(i, 1);
    //            [wantStr replaceCharactersInRange:range withString:@""];
    //        }else{
    //            i++;
    //        }
    //    }
    //    return wantStr;
    
    
    
    
    return  wantStr;
}

@end
