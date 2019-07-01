//
//  FMHttpConstant.h
//  ZFMRACNetwork
//
//  Created by todriver02 on 2018/7/31.
//  Copyright © 2018年 zhufaming. All rights reserved.
//

/**
 *  网络请求相关 宏定义
 */

#ifndef FMHttpConstant_h
#define FMHttpConstant_h

/*******URL******/
#define BaseUrl @"http://googshoping.colors8.com.cn/"
/********ImgBaseURL*****/
#define ImgBaseURL @""
//api
//获取文章
#define GettingArticle @"api/index/getArticle" //POST 参数：category=1(1赛事相关4战队动态5娱乐周围)   page=1
//获取轮播
#define GettingCarouselPic @"api/index/getArticle"
//文章详情
#define GettingArticleDetail @"portal/article/index/id/{id}"//?
//用户登录信息
#define GettingUserLoginInfo @"api/index/center?uid=1159"
//视频
#define GettingVedio @"portal/list/index/id/8"
//开黑
#define GettingGangUp @"portal/list/index/id/7"
//二维码
#define GettingQRCode @"api/index/erweima"
//官网连接
#define GettingOfficialWebsite @"portal/article/index/id/30"
//个人资料
#define Personaldata @"portal/article/index/id/32"
//我的评论
#define MyComment @"portal/article/index/id/33"
//关于我们
#define AboutUs @"portal/article/index/id/34"
//注册
#define SignIn @"user/register/doRegister" //POST 参数：password  username
//登录
#define Login @"user/login/dologin" //参数：password  username

#pragma mark - api拼接
#define API(DomainName,api) [NSString stringWithFormat:@"%@%@",BaseUrl,api]

/********如果需要存储，相应的的 key 宏定义********/
/// 服务器相关
#define HTTPRequestTokenKey @"token"
/// 签名key
#define HTTPServiceSignKey @"sign"

/// 私钥key
#define HTTPServiceKey  @"privatekey"
/// 私钥Value
#define HTTPServiceKeyValue @"/** 你的私钥 **/"

/// 状态码key
#define HTTPServiceResponseCodeKey @"code"
/// 消息key
#define HTTPServiceResponseMsgKey @"msg"
/// 数据data
#define HTTPServiceResponseDataKey  @"data"

#endif /* FMHttpConstant_h */
