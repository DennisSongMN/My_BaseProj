//
//  isLogin.m
//  ShengAi
//
//  Created by 刘赓 on 2018/11/27.
//  Copyright © 2018 刘赓. All rights reserved.
//

#import "IsLogin.h"

@implementation IsLogin

//登陆成功,保存用户名、Member_id（以手机号绑定，唯一）、User_token（需要加在请求头上）、IsVip（会员身份）
+(void)recordLoginInfoWithUserName:(NSString *)username
                         Member_id:(NSNumber *)member_id
                        User_token:(NSString *)user_token
                             IsVip:(NSNumber *)isVip{

    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];

    [userDefaults setObject:username
                     forKey:@"name"];

    [userDefaults setObject:member_id
                     forKey:@"member_id"];

    [userDefaults setObject:user_token
                     forKey:@"user_token"];

    [userDefaults setObject:isVip
                     forKey:@"isVip"];

    [userDefaults synchronize];
}

//登录成功,获取用户名
+(NSString *)getUserName{

    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];

    NSString *userName = [userDefault objectForKey:@"name"];

    return userName;
}

//登录成功,获取Member_id
+(NSNumber *)getMember_id{

    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];

    NSNumber *member_id = [userDefault objectForKey:@"member_id"];

    return member_id;
}

//登录成功,获取User_token
+(NSString *)getUser_token{

    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];

    NSString *user_token = [userDefault objectForKey:@"user_token"];

    return user_token;
}

//登录成功,获取IsVip
+(NSString *)getIsVip{

    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];

    NSString *isVip = [userDefault objectForKey:@"isVip"];

    return isVip;
}

//退出登录
+(void)logout{

    //退出的时候删除UserDefaults单例中的用户信息

    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];

    [userDefaults removeObjectForKey:@"name"];

    [userDefaults removeObjectForKey:@"member_id"];

    [userDefaults removeObjectForKey:@"user_token"];

    [userDefaults removeObjectForKey:@"isVip"];

    [userDefaults synchronize];
}

/**
 是否登录判断
 执行标准:获取不到用户名即视作未登录

 @return NO;//未登录   &   YES;//已登录
 */
+(BOOL)isLogin{

    NSLog(@"[IsLogin getUserName] = %@",[IsLogin getUserName]);

    if ([NSString isEmptyStr:[IsLogin getUserName]]) {//为空返回 YES

        return NO;//未登录
    }

    return YES;//已登录
}

@end
