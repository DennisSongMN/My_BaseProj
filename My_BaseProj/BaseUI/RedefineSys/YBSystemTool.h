//
//  YBSystemTool.h
//  Aa
//
//  Created by Aalto on 2018/11/19.
//  Copyright © 2018 Aalto. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YBSystemTool : NSObject

/** 判断是否是 iphoneX 系列 */
+ (BOOL)isIphoneX;

/** app 版本号 */
+ (NSString *)appVersion;

/** app 来源 ：iOS或安卓 */
+ (NSString *)appSource;

/** app 名称 */
+ (NSString *)appName;

@end

@interface YBSystemTool (UI)

/** 获取顶层的 UIViewController 实例 */
+ (UIViewController *)topViewController;

/** 获取 windowLevel 为 UIWindowLevelNormal 的 UIWindow 实例 */
+ (UIWindow *)normalWindow;


/**
 修改导航的为应用导航样式

 @param naVC
 */
+(void)modifyNavigationBarWith:(UINavigationController*)naVC;
@end

NS_ASSUME_NONNULL_END
