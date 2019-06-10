//
//  YKToastView.h
//  YKMobileCommonUI
//
//  Created by NickJackson on 15/11/5.
//  Copyright © 2015年 Yueke. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YKToastView : UIView

/**
	Toast样式提示自定义内容
 
	@param text 自定义文本
	@param view 要显示的父视图
 */
+ (void)showToastText:(NSString *)text inView:(UIView *)view;
/**
	Toast样式在Window上提示自定义内容
 
	@param text 自定义文本
 */
+ (void)showToastText:(NSString *)text;

/**
 Toast样式在Window上提示自定义内容
 
 @param text 自定义文本 second 停留多少秒（单位是秒）
 */
+ (void)showToastText:(NSString *)text withDisplayTime:(NSTimeInterval)iSecond;

/**
 Toast样式在Window上提示自定义内容，位置随机
 
 @param text 自定义文本
 */
+ (void)showToastTextInRandomLocation:(NSString *)text;

@end

NS_ASSUME_NONNULL_END