//
//  YBFrameTool.h
//  Aa
//
//  Created by Aalto on 2018/11/19.
//  Copyright © 2018 Aalto. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YBFrameTool : NSObject

/** iphone 底部额外的高度 */
+ (CGFloat)iphoneBottomHeight;

/** 标签栏高度 */
+ (CGFloat)tabBarHeight;

/** 状态栏高度 */
+ (CGFloat)statusBarHeight;

/** 导航栏高度 */
+ (CGFloat)navigationBarHeight;

+ (CGFloat)getNavigationHeight;

@end

NS_ASSUME_NONNULL_END
