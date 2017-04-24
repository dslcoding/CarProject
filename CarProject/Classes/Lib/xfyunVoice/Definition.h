//
//  Definition.h
//  MSCDemo
//
//  Created by iflytek on 13-6-6.
//  Copyright (c) 2013年 iflytek. All rights reserved.
//

#import <Foundation/Foundation.h>
#define Margin  5
#define Padding 10
#define iOS7TopMargin 64 //导航栏44，状态栏20
#define IOS7_OR_LATER   ( [[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending )
#define ButtonHeight 44
#define NavigationBarHeight 44

#define APPID_VALUE           @"56ef55cc"
#define URL_VALUE             @""                 // url
#define TIMEOUT_VALUE         @"20000"            // timeout      连接超时的时间，以ms为单位
#define BEST_URL_VALUE        @"1"                // best_search_url 最优搜索路径

#define SEARCH_AREA_VALUE     @"安徽省合肥市"
#define ASR_PTT_VALUE         @"1"
#define VAD_BOS_VALUE         @"5000"
#define VAD_EOS_VALUE         @"1800"
#define PLAIN_RESULT_VALUE    @"1"
#define ASR_SCH_VALUE         @"1"

#define NAME        @"userwords"
#define USERWORDS   @"{\"userword\":[{\"name\":\"我的常用词\",\"words\":[\"冀A\",\"冀B\",\"冀C\",\"冀D\",\"冀E\",\"冀F\",\"冀G\",\"冀H\",\"冀J\",\"冀R\",\"冀T\",\"AA\",\"AB\",\"AC\",\"AD\",\"AE\",\"AF\",\"AG\",\"AT\",\"AV\",\"KA\",\"KB\",\"KC\",\"KD\",\"KE\",\"KF\",\"KK\",\"KU\",\"WJ\",\"ZF\",\"12345\"]}]}"

#ifdef __IPHONE_6_0
# define IFLY_ALIGN_CENTER NSTextAlignmentCenter
#else
# define IFLY_ALIGN_CENTER UITextAlignmentCenter
#endif

#ifdef __IPHONE_6_0
# define IFLY_ALIGN_LEFT NSTextAlignmentLeft
#else
# define IFLY_ALIGN_LEFT UITextAlignmentLeft
#endif

@interface Definition : NSObject

@end
