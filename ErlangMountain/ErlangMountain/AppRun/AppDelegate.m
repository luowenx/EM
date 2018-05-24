//
//  AppDelegate.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/13.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "AppDelegate.h"
#import "EMRootViewCtrl.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    EMRootViewCtrl *rootViewCtrl = [[EMRootViewCtrl alloc] init];
    [self.window setRootViewController:rootViewCtrl];
    [self.window makeKeyAndVisible];

    return YES;
}




@end
