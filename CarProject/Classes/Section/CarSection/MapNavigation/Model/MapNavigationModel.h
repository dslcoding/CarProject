//
//  MapNavigationModel.h
//  CarProject
//
//  Created by 董诗磊 on 2017/4/18.
//  Copyright © 2017年 董诗磊. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MapNavigationModel : NSObject

@property (nonatomic ,copy) NSString * locationNameStr;

@property (nonatomic ,copy) NSString * distanceStr;

@property (nonatomic, copy)  NSString * addressStr;

@property (nonatomic, copy) AMapGeoPoint * startMaplocation;

@property (nonatomic, copy) AMapGeoPoint * endMaplocation;

@end
