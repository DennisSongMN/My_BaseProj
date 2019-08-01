

//
//  NSObject+Extras.m
//  TestDemo
//
//  Created by AaltoChen on 15/10/31.
//  Copyright © 2015年 AaltoChen. All rights reserved.
//

#import "NSObject+Extras.h"

@implementation NSObject (Extras)

+(BOOL)isNSStringClass:(id)object
{
    if ([object isKindOfClass:[NSString class]]) {
        return YES;
    }
    else
        return NO;
}

+(BOOL)isNSDictionaryClass:(id)object
{
    if ([object isKindOfClass:[NSDictionary class]]) {
        return YES;
    }
    else
        return NO;
}

+(BOOL)isNSNumberClass:(id)object
{
    if ([object isKindOfClass:[NSNumber class]]) {
        return YES;
    }
    else
        return NO;
}

+(BOOL)isNSNullClass:(id)object
{
    if ([object isKindOfClass:[NSNull class]]) {
        return YES;
    }
    else
        return NO;
}

+(BOOL)isNSArrayClass:(id)object
{
    if ([object isKindOfClass:[NSArray class]]) {
        return YES;
    }
    else
        return NO;
}

/**
 *  判断是否当日第一次启动App
 */
//+(BOOL)isFirstLaunchApp{
//
//    NSDateFormatter *format = [[NSDateFormatter alloc]init];
//    [format setDateFormat:@"yyyy-MM-dd"];
//
//    //取本机时间
//    NSDate *date_localMachine = [NSDate date];
//    BOOL c = [[NSCalendar currentCalendar] isDateInToday:date_localMachine];//永真
//    //----------将nsdate按formatter格式转成nsstring
//    NSString *currentTimeString = [format stringFromDate:date_localMachine];
//
//    //取本地数据库中时间
//    NSDate *date_local = [format dateFromString:GetUserDefaultWithKey(@"daytime")];
//    NSString *currentTimeString_0 = [format stringFromDate:date_local];
//    BOOL b = [[NSCalendar currentCalendar] isDateInToday:date_local];
//
//
//    NSString *str_1 = GetUserDefaultWithKey(@"daytime");
//    //更新本地记录
//    SetUserDefaultKeyWithObject(@"daytime",[NSString getTimeString:currentTimeString]);
//    UserDefaultSynchronize;
//
//    //再取本地数据库时间
//
//    NSString *str_0 = GetUserDefaultWithKey(@"daytime");
//
//    NSDate *date_local_01 = [format dateFromString:GetUserDefaultWithKey(@"daytime")];
//    NSString *currentTimeString_01 = [format stringFromDate:date_local_01];
//
//    if (c != b ) {//第一次
//        return YES;
//    }else return NO;
//}

+ (BOOL)isFirstLaunchApp{
    BOOL flag;
    
//    NSDate *oldDate = [[NSUserDefaults standardUserDefaults] objectForKey:@"APPFirstStartKey"];

    NSDate *oldDate = GetUserDefaultObjForKey(@"APPFirstStartKey");

    UserDefaultSynchronize;
    
    if (oldDate == nil) {
        NSLog(@"未启动过，第一次启动");
        flag = YES;
    }else {
        if ([self isToday:oldDate]) {
            NSLog(@"今日  已启动过");
            flag = NO;
        }else {
            NSLog(@"今天第一次启动");
            flag = YES;
        }
    }
    // 保存启动时间
//    [[NSUserDefaults standardUserDefaults] setObject:[NSDate date] forKey:@"APPFirstStartKey"];
    
    SetUserDefaultKeyWithObject(@"APPFirstStartKey",[NSDate date]);
    
    UserDefaultSynchronize;
    
    return flag;
}

/**
 *  判断某个时间是否为今天
 */
+ (BOOL)isToday:(NSDate *)date{
    
    NSDate *now = [NSDate date];
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.timeZone = [NSTimeZone systemTimeZone]; // 系统时区
    [fmt setDateStyle:NSDateFormatterMediumStyle];
    [fmt setTimeStyle:NSDateFormatterShortStyle];
    fmt.dateFormat = @"yyyy-MM-dd";
    
    NSString *dateStr = [fmt stringFromDate:date];
    NSString *nowStr = [fmt stringFromDate:now];
    
    return [dateStr isEqualToString:nowStr];
}

+ (UIImage *)imageWithString:(NSString *)string
                        font:(UIFont *)font
                       width:(CGFloat)width
               textAlignment:(NSTextAlignment)textAlignment
             backGroundColor:(UIColor *)backGroundColor
                   textColor:(UIColor *)textColor{
    
    NSDictionary *attributeDic = @{NSFontAttributeName:font};
    
    CGSize size = [string boundingRectWithSize:CGSizeMake(width, 10000)
                                       options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingTruncatesLastVisibleLine
                                    attributes:attributeDic
                                       context:nil].size;
    
    if ([UIScreen.mainScreen respondsToSelector:@selector(scale)]){
        
        if (UIScreen.mainScreen.scale == 2.0){
            
            UIGraphicsBeginImageContextWithOptions(size, NO, 1.0);
            
        } else{
            
            UIGraphicsBeginImageContext(size);
        }
    }
    else{
        
        UIGraphicsBeginImageContext(size);
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [backGroundColor set];
    
    CGRect rect = CGRectMake(0, 0, size.width + 1, size.height + 1);
    
    CGContextFillRect(context, rect);
    
    
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    
    paragraph.alignment = textAlignment;
    
    NSDictionary *attributes = @ {
        
    NSForegroundColorAttributeName:textColor,
    NSFontAttributeName:font,
    NSParagraphStyleAttributeName:paragraph
    };
    
    [string drawInRect:rect
        withAttributes:attributes];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

/**
 *  UIColor 转 UIImage
 */
+(UIImage*)createImageWithColor:(UIColor*)color{
    
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context,[color CGColor]);
    
    CGContextFillRect(context, rect);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return theImage;
}

- (BOOL)boolForValue:(id)value{
    if (value == nil || [NSObject isNSNullClass:value]) {
        return NO;
    } else if([NSObject isNSStringClass:value]) {
        if ([(NSString *)value match:@"\\d+"]) {
            return [value boolValue];
        } else {
            return NO;
        }
    } else if ([NSObject isNSNumberClass:value]) {
        return [value boolValue];
    }
    return NO;
}

- (float)floatForValue:(id)value {
    if (value == nil || [NSObject isNSNullClass:value]) {
        return 0;
    } else if([NSObject isNSStringClass:value]) {
        if ([(NSString *)value match:@"\\d+"]) {
            return [value floatValue];
        } else {
            return 0;
        }
    } else if ([NSObject isNSNumberClass:value]) {
        return [value floatValue];
    }
    return 0;
}

- (NSString *)stringForValue:(id)value {
    if (value == nil || [NSObject isNSNullClass:value]) {
        return @"";
    } else if ([NSObject isNSStringClass:value]) {
        return value;
    } else if ([NSObject isNSNumberClass:value]) {
        return [value stringValue];
    }
    return @"";
}

- (int)intForValue:(id)value {
    if (value == nil || [NSObject isNSNullClass:value]) {
        return 0;
    } else if ([NSObject isNSStringClass:value]) {
        return [value intValue];
    } else if ([NSObject isNSNumberClass:value]) {
        return [value intValue];
    }
    return 0;
}

/**
 *  判断是否为空串
 */
-(BOOL)isNull:(id)object
{
    
    if ([object isEqual:[NSNull null]]) {
        return NO;
    }
    else if ([object isKindOfClass:[NSNull class]])
    {
        return NO;
    }
    else if (object==nil){
        return NO;
    }
    return YES;
}

/**
 *  转换空串
 */
-(NSString*)convertNull:(id)object{
    
    if ([object isEqual:[NSNull null]]) {
        return @" ";
    }
    else if ([object isKindOfClass:[NSNull class]])
    {
        return @" ";
    }
    else if (object == nil){
        
        return @"空";
    }
    
    return object;
}

- (void) showLoad:(NSString *) msg{
    [SVProgressHUD showWithStatus:msg
                         maskType:SVProgressHUDMaskTypeNone];
}

- (void) hideLoad{
    [SVProgressHUD dismiss];
}

@end
