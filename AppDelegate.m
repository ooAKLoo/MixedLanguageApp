//
//  AppDelegate.m
//  MixedLanguageApp
//
//  Created by 杨东举 on 2025/3/13.
//

// AppDelegate.m
#import "AppDelegate.h"
#import "MainViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // 创建主视图控制器
    MainViewController *mainVC = [[MainViewController alloc] init];
    
    // 创建导航控制器
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:mainVC];
    
    // 设置根视图控制器
    self.window.rootViewController = navController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
