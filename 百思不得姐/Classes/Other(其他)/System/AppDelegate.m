//
//  AppDelegate.m
//  百思不得姐
//
//  Created by 李好一 on 16/1/12.
//  Copyright © 2016年 李好一. All rights reserved.
//

#import "AppDelegate.h"

#import "HYTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    HYTabBarController *tabBarVC = [[HYTabBarController alloc] init];
    self.window.rootViewController = tabBarVC;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}


@end
