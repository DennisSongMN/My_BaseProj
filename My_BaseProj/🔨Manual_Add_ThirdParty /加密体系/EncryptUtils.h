//
//  EncryptUtils.h
//  TogetherInvest
//
//  Created by Hope on 3/10/15.

//

#import <Foundation/Foundation.h>

@interface EncryptUtils : NSString

+ (NSString *)getSysTimeStamp;//获取系统时间戳


+(NSString *)sha1_64bits:(NSString *)str;//64位SHA1加密
+(NSString *)sha1_20bits:(NSString *)str;//20位SHA1加密
+(NSString *)md5_32bits:(NSString *)str;//32位MD5加密
+(NSString *)md5_64bits:(NSString *)str;//64位MD5加密
+(NSString *)shuffledAlphabet:(int)bits;//生成?位随机字符串

@end
