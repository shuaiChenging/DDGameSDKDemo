//
//  AppDelegate.m
//  DDGameSDKDemo
//
//  Created by MHJZ on 2022/3/3.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import <DDGameSDK/DDGameManage.h>
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    SDKConfig *config = [SDKConfig new];
    config.appID = @"13101";
    config.appKey = @"23ba34ef748fd0aaae234035274e82d4";
    config.sdkTag = @"tag1310100000";
    [DDGameManage gameInitWithConfig:config];
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [ViewController new];
    [self.window makeKeyAndVisible];
    return YES;
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options
{
    /// 从支付返回处理
    [DDGameManage callBackHandle];
    return YES;
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [DDGameManage callBackHandle];
}


@end
