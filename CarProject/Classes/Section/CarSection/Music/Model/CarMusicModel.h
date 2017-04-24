//
//  CarMusicModel.h
//  CarProject
//
//  Created by 董诗磊 on 2017/4/19.
//  Copyright © 2017年 董诗磊. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CarMusicModel : NSObject

@property (nonatomic ,copy) NSString * songTitle;

@property (nonatomic ,copy) NSURL * songURL;

@property (nonatomic ,copy) NSString * artistStr;

@end
