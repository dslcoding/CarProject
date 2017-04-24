//
//  AppDelegate.m
//  CardProject
//
//  Created by 董诗磊 on 2017/4/11.
//  Copyright © 2017年 董诗磊. All rights reserved.
//

#import "AppDelegate.h"
#define IflyAppID @"577f526d"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window.backgroundColor = [UIColor whiteColor];
    
    self.window.rootViewController = [[RootVC alloc]init];
    
    [AMapServices sharedServices].apiKey = @"2dc24959006a1ddbc58f4caa35d46e4b";
    
    NSString *initString = [[NSString alloc] initWithFormat:@"appid=%@",IflyAppID];
    //所有服务启动前,需要确保执行createUtility
    
    [IFlySetting setLogFile:false];
    [IFlySpeechUtility createUtility:initString];
    
    [IFlySetting setLogFile:false];
    
    return YES;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{

    [self.window endEditing:YES];

}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
