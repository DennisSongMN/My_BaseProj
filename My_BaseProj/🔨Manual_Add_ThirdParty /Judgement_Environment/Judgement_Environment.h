//
//  Judgement_Environment.h
//  JinXian Finance
//
//  Created by 刘赓 on 2017/7/13.
//  Copyright © 2017年 刘赓. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <sys/utsname.h>

/**
 *作者：天明依旧
 *链接：http://www.jianshu.com/p/02bba9419df8
 *來源：简书
 *著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处
 */

NS_ASSUME_NONNULL_BEGIN

@interface Judgement_Environment : NSObject

+ (NSString *)iphoneType;

/**
 *  判断当前机型是否是iphone6 及其以上机型,过滤掉对ipad的判断
 */
+(BOOL)judgement;

/**
 校验是否为Xcode模拟器
 */
+(BOOL)isSimulator;

@end

NS_ASSUME_NONNULL_END
