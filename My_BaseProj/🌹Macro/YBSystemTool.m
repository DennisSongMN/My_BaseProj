//
//  YBSystemTool.m
//  Aa
//
//  Created by Aalto on 2018/11/19.
//  Copyright © 2018 Aalto. All rights reserved.
//

#import "YBSystemTool.h"
#import <sys/utsname.h>
//liu_geng
@implementation YBSystemTool

+ (BOOL)isIphoneX {
    static BOOL isIphoneX = NO;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSSet *platformSet = [NSSet setWithObjects:@"iPhone10,3", @"iPhone10,6", @"iPhone11,8", @"iPhone11,2", @"iPhone11,4", @"iPhone11,6", nil];
        struct utsname systemInfo;
        uname(&systemInfo);
        NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
        if ([platform isEqualToString:@"x86_64"] || [platform isEqualToString:@"i386"]) {
            platform = NSProcessInfo.processInfo.environment[@"SIMULATOR_MODEL_IDENTIFIER"];
        }
        isIphoneX = [platformSet containsObject:platform];
    });
    return isIphoneX;
}

+ (NSString *)appVersion {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

+ (NSString *)appSource {
    return @"2";
}

+ (NSString *)appName {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"];
}

@end


@implementation YBSystemTool (UI)

+ (UIWindow *)normalWindow {
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal) {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for (UIWindow *temp in windows) {
            if (temp.windowLevel == UIWindowLevelNormal) {
                window = temp;
                break;
            }
        }
    }
    return window;
}

+ (UIViewController *)topViewController {
    UIViewController *topController = nil;
    UIWindow *window = [self normalWindow];
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    if ([nextResponder isKindOfClass:UIViewController.class]) {
        topController = nextResponder;
    } else {
        topController = window.rootViewController;
        while (topController.presentedViewController) {
            topController = topController.presentedViewController;
        }
    }
    return topController;
}

+(void)modifyNavigationBarWith:(UINavigationController*)naVC{
    naVC.navigationBar.translucent = NO;
    naVC.navigationBar.barTintColor = YBGeneralColor.navigationBarColor;
    [naVC.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:YBGeneralColor.navigationBarTitleColor, NSFontAttributeName:YBGeneralFont.navigationBarTitleFont}];
    
    [naVC.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [naVC.navigationBar setShadowImage:[UIImage new]];
}

@end
