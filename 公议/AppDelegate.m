//
//  AppDelegate.m
//  公议
//
//  Created by Mr.Lin on 17/12/16.
//  Copyright © 2017年 Mr.Lin. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewManger.h"
#import "HomeViewController.h"
#import "SideMenuViewController.h"
#import "JDSideMenu.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    [self.window setRootViewController:[ViewManger ShareInstance].Navigationcontroler];
    //初始化
    HomeViewController *Home =[[HomeViewController alloc]init];
    SideMenuViewController *Side =[SideMenuViewController new];
    JDSideMenu *menu =[[JDSideMenu alloc]initWithContentController:Home menuController:Side];
    
    
    [[ViewManger ShareInstance].Navigationcontroler pushViewController:menu animated:NO];
    
    //禁用右划手势
    //[ViewManger ShareInstance].Navigationcontroler.interactivePopGestureRecognizer.enabled=NO;
    
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
