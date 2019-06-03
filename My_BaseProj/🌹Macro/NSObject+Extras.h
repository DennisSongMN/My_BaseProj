//
//  NSObject+Extras.h
//  TestDemo
//
//  Created by AaltoChen on 15/10/31.
//  Copyright © 2015年 AaltoChen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Extras)
//判断类型是否匹配
+(BOOL)isNSStringClass:(id)object;
+(BOOL)isNSDictionaryClass:(id)object;
+(BOOL)isNSNumberClass:(id)object;
+(BOOL)isNSNullClass:(id)object;
+(BOOL)isNSArrayClass:(id)object;

/**
 圆切角
 
 @param view 目标View
 @param cornerRadiusValue 圆切角
 */
+(void)cornerCutToCircleWithView:(UIView *)view
                 AndCornerRadius:(CGFloat)cornerRadiusValue;

/**
 描边
 
 @param view 目标View
 @param colour 色彩
 @param WidthOfBorder 线宽
 */
+(void)colourToLayerOfView:(UIView *)view
                WithColour:(UIColor *)colour
            AndBorderWidth:(CGFloat)WidthOfBorder;

/**
 *  指定圆切角
 */
+(void)appointCornerCutToCircleWithTargetView:(UIView *)targetView
                         TargetCorner_TopLeft:(UIRectCorner)targetCorner_TopLeft
                        TargetCorner_TopRight:(UIRectCorner)targetCorner_TopRight
                      TargetCorner_BottomLeft:(UIRectCorner)targetCorner_BottomLeft
                     TargetCorner_BottomRight:(UIRectCorner)targetCorner_BottomRight;

/**
 *  判断是否当日第一次启动App
 */
+(BOOL)isFirstLaunchApp;

/**
 文本转图像
 */
+ (UIImage *)imageWithString:(NSString *)string
                        font:(UIFont *)font
                       width:(CGFloat)width
               textAlignment:(NSTextAlignment)textAlignment
             backGroundColor:(UIColor *)backGroundColor
                   textColor:(UIColor *)textColor;
/**
 *  UIColor 转 UIImage
 */
+(UIImage*)createImageWithColor:(UIColor*)color;

- (NSString *)stringForValue:(id)value;
- (BOOL)boolForValue:(id)value;
- (float)floatForValue:(id)value;
- (int)intForValue:(id)value;
-(NSString*)convertNull:(id)object;//转换空串
-(BOOL)isNull:(id)object;//判断是否为空串

- (void) showLoad:(NSString *) msg;

- (void) hideLoad;
@end
