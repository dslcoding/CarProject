//
//  xfTools.h
//  CarProject
//
//  Created by 董诗磊 on 2017/4/21.
//  Copyright © 2017年 董诗磊. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^xfBlock)(NSString *xfStr);

@interface xfTools : NSObject

@property (nonatomic, strong) IFlySpeechRecognizer *iFlySpeechRecognizer;//不带界面的识别对象
@property (nonatomic, strong) IFlyDataUploader *uploader;//数据上传对

@property (nonatomic ,copy) xfBlock block;

+ (xfTools *)shareTools;

- (void)updateWordList;


@end
