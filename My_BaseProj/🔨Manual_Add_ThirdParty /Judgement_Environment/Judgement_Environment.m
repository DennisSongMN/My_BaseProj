//
//  Judgement_Environment.m
//  JinXian Finance
//
//  Created by 刘赓 on 2017/7/13.
//  Copyright © 2017年 刘赓. All rights reserved.
//

#import "Judgement_Environment.h"

struct utsname systemInfo;

@implementation Judgement_Environment

+ (NSString *)iphoneType{
    
    uname(&systemInfo);
    
    NSString *platform = [NSString stringWithCString:systemInfo.machine
                                            encoding:NSASCIIStringEncoding];
    
    if ([platform isEqualToString:@"iPhone1,1"])    return @"iPhone 2G";
    
    if ([platform isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    
    if ([platform isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    
    if ([platform isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    
    if ([platform isEqualToString:@"iPhone3,2"])    return @"iPhone 4";
    
    if ([platform isEqualToString:@"iPhone3,3"])    return @"iPhone 4";
    
    if ([platform isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    
    if ([platform isEqualToString:@"iPhone5,1"])    return @"iPhone 5";
    
    if ([platform isEqualToString:@"iPhone5,2"])    return @"iPhone 5";
    
    if ([platform isEqualToString:@"iPhone5,3"])    return @"iPhone 5c";
    
    if ([platform isEqualToString:@"iPhone5,4"])    return @"iPhone 5c";
    
    if ([platform isEqualToString:@"iPhone6,1"])    return @"iPhone 5s";
    
    if ([platform isEqualToString:@"iPhone6,2"])    return @"iPhone 5s";
    
    if ([platform isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
    
    if ([platform isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    
    if ([platform isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
    
    if ([platform isEqualToString:@"iPhone8,2"])    return @"iPhone 6s Plus";
    
    if ([platform isEqualToString:@"iPhone8,4"])    return @"iPhone SE";
    
    if ([platform isEqualToString:@"iPhone9,1"])    return @"iPhone 7";
    
    if ([platform isEqualToString:@"iPhone9,2"])    return @"iPhone 7 Plus";
    
    if ([platform isEqualToString:@"iPod1,1"])  return @"iPod Touch 1G";
    
    if ([platform isEqualToString:@"iPod2,1"])  return @"iPod Touch 2G";
    
    if ([platform isEqualToString:@"iPod3,1"])  return @"iPod Touch 3G";
    
    if ([platform isEqualToString:@"iPod4,1"])  return @"iPod Touch 4G";

    if ([platform isEqualToString:@"iPod5,1"])  return @"iPod Touch 5G";
    
    if ([platform isEqualToString:@"iPad1,1"])  return @"iPad 1G";
    
    if ([platform isEqualToString:@"iPad2,1"])  return @"iPad 2";
    
    if ([platform isEqualToString:@"iPad2,2"])  return @"iPad 2";
    
    if ([platform isEqualToString:@"iPad2,3"])  return @"iPad 2";
    
    if ([platform isEqualToString:@"iPad2,4"])  return @"iPad 2";
    
    if ([platform isEqualToString:@"iPad2,5"])  return @"iPad Mini 1G";
    
    if ([platform isEqualToString:@"iPad2,6"])  return @"iPad Mini 1G";
    
    if ([platform isEqualToString:@"iPad2,7"])  return @"iPad Mini 1G";
    
    if ([platform isEqualToString:@"iPad3,1"])  return @"iPad 3";
    
    if ([platform isEqualToString:@"iPad3,2"])  return @"iPad 3";
    
    if ([platform isEqualToString:@"iPad3,3"])  return @"iPad 3";
    
    if ([platform isEqualToString:@"iPad3,4"])  return @"iPad 4";
    
    if ([platform isEqualToString:@"iPad3,5"])  return @"iPad 4";
    
    if ([platform isEqualToString:@"iPad3,6"])  return @"iPad 4";
    
    if ([platform isEqualToString:@"iPad4,1"])  return @"iPad Air";
    
    if ([platform isEqualToString:@"iPad4,2"])  return @"iPad Air";
    
    if ([platform isEqualToString:@"iPad4,3"])  return @"iPad Air";
    
    if ([platform isEqualToString:@"iPad4,4"])  return @"iPad Mini 2G";
    
    if ([platform isEqualToString:@"iPad4,5"])  return @"iPad Mini 2G";
    
    if ([platform isEqualToString:@"iPad4,6"])  return @"iPad Mini 2G";
    
    if ([platform isEqualToString:@"i386"]) return @"iPhone Simulator";
    
    if ([platform isEqualToString:@"x86_64"])   return @"iPhone Simulator";
    
    return platform;
}

#pragma mark —— 判断当前机型是否是iphone6 及其以上机型,过滤掉对ipad的判断
+(BOOL)judgement{
    
    NSString *str = [Judgement_Environment iphoneType];
    
    if ([str isEqualToString:@"iPhone 2G"]) return NO;
    
    if ([str isEqualToString:@"iPhone 3G"]) return NO;
    
    if ([str isEqualToString:@"iPhone 3GS"]) return NO;
    
    if ([str isEqualToString:@"iPhone 4"]) return NO;
    
    if ([str isEqualToString:@"iPhone 4S"]) return NO;
    
    if ([str isEqualToString:@"iPhone 5"]) return NO;
    
    if ([str isEqualToString:@"iPhone 5c"]) return NO;
    
    if ([str isEqualToString:@"iPhone 5s"]) return NO;
    
    if ([str isEqualToString:@"iPhone Simulator"]) return NO;//test
    
    return YES;
}

+(BOOL)isSimulator{
    
    NSString *str = [Judgement_Environment iphoneType];
    
    return [str isEqualToString:@"iPhone Simulator"]?YES:NO;
}

@end
