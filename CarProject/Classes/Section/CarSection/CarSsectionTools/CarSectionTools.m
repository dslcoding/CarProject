//
//  CarSectionTools.m
//  CarProject
//
//  Created by 董诗磊 on 2017/4/17.
//  Copyright © 2017年 董诗磊. All rights reserved.
//

#import "CarSectionTools.h"



@interface CarSectionTools ()

@property (nonatomic, strong) AMapLocationManager * locationManager;

@end

static CarSectionTools * tools = nil;

@implementation CarSectionTools

+(CarSectionTools *)sharetools
{

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        tools = [[CarSectionTools alloc]init];
        
        
    });

    return tools;
}

- (void)loctionStr:(loctionOption)option{
    
    self.locationManager = [[AMapLocationManager alloc]init];

    [self.locationManager setDesiredAccuracy:kCLLocationAccuracyHundredMeters];
    
    self.locationManager.locationTimeout =2;
    
    self.locationManager.reGeocodeTimeout = 2;
    
    [self.locationManager requestLocationWithReGeocode:YES completionBlock:^(CLLocation *location, AMapLocationReGeocode *regeocode, NSError *error) {
        
      
        
        if (error)
        {
            NSLog(@"locError:{%ld - %@};", (long)error.code, error.localizedDescription);
            
            if (error.code == AMapLocationErrorLocateFailed)
            {
                return;
            }
        }
        
        NSLog(@"location:%f", location.coordinate.longitude);
        
        
        [[NSUserDefaults standardUserDefaults] setObject:@{@"latitude":[NSNumber numberWithFloat:location.coordinate.latitude],@"longitude":[NSNumber numberWithFloat:location.coordinate.longitude]} forKey:@"loction"];
        
        if (regeocode)
            
        {
                       
            if (option) {
                
                option(regeocode.city);
                
            }
            
      }
    }];
    
}
@end
