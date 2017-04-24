//
//  PlayTools.m
//  CarProject
//
//  Created by 董诗磊 on 2017/4/19.
//  Copyright © 2017年 董诗磊. All rights reserved.
//

#import "PlayTools.h"

#import <MediaPlayer/MediaPlayer.h>

static PlayTools * tools = nil;

@implementation PlayTools


+(PlayTools *)shareTools{

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        tools = [[PlayTools alloc]init];
    });
    
    
    return tools;
    
    
}

- (NSMutableArray *)songDataSource
{
    NSMutableArray * TempArray = [[NSMutableArray alloc]init];

    MPMediaQuery *allMp3 = [[MPMediaQuery alloc] init];
    
    // 读取条件
    MPMediaPropertyPredicate *albumNamePredicate =
    [MPMediaPropertyPredicate predicateWithValue:[NSNumber numberWithInt:MPMediaTypeMusic ] forProperty: MPMediaItemPropertyMediaType];
    
    [allMp3 addFilterPredicate:albumNamePredicate];
    
    NSArray * DataArray = [allMp3 items];
    
    for (MPMediaItem *song in DataArray) {
       
        
        NSString *songTitle = song.title;
        
//        NSLog (@"%@, %@, %@", songTitle, song.assetURL,song.
//               artist);
        
        CarMusicModel * model = [[CarMusicModel alloc]init];
        
        model.songURL = song.assetURL;
        
        model.songTitle = songTitle;
        
        model.artistStr = song.artist;
        
        [TempArray addObject:model];
    }


    
    return TempArray;



}

@end
