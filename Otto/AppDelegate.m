//
//  AppDelegate.m
//  Otto
//
//  Created by Cheng Sun on 7/31/19.
//  Copyright © 2019 EF. All rights reserved.
//

#import "AppDelegate.h"
#import "JPEngine.h"
#import "JPLoader.h"
#import "JSPathRequest.h"

//取消注释就是使用本地的js热更新文件，当前是使用从服务器下载的
#define JSPatch_Test 1

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //APP启动时下载热更新脚本
#ifdef JSPatch_Test
    [JPEngine startEngine];
    //如果是模块化开发(需要include导入js文件的时候)使用[JPEngine evaluateScriptWithPath:sourcePath];方法执行js文件
    NSString *sourcePath = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:@"Resource/main.js"];
    [JPEngine evaluateScriptWithPath:sourcePath];
#else
    //执行下载下来的js文件
    [JPLoader run];
    
    //下载模块化js zip文件
    [JSPathRequest loadServiceJSZip];
    //下载单个js文件
    //[JSPathRequest loadServiceScriptString];
#endif
    return YES;
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
    //app从后台返回前台时，重新下载热更新脚本
#ifdef JSPatch_Test
    [JPEngine startEngine];
    //如果是模块化开发(需要include导入js文件的时候)使用[JPEngine evaluateScriptWithPath:sourcePath];方法执行js文件
    NSString *sourcePath = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:@"Resource/main.js"];
    [JPEngine evaluateScriptWithPath:sourcePath];
#else
    //执行下载下来的js文件
    [JPLoader run];
    //下载模块化js zip文件
    [JSPathRequest loadServiceJSZip];
    //下载单个js文件
    //[JSPathRequest loadServiceScriptString];
#endif
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
