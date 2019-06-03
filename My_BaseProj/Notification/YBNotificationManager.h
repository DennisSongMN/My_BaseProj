//
//  YBNotificationManager.h
//  Created by Aalto on 2018/12/19.
//  Copyright © 2018 Aalto. All rights reserved.
//

#import <Foundation/Foundation.h>
FOUNDATION_EXTERN NSString * const kNotify_IsBackExchangeRefresh;
FOUNDATION_EXTERN NSString * const kNotify_IsLoginRefresh;
FOUNDATION_EXTERN NSString * const kNotify_IsLoginOutRefresh;
FOUNDATION_EXTERN NSString * const kNotify_editAccount_01;
//FOUNDATION_EXTERN NSString * const kNotify_editAccount_02;

FOUNDATION_EXTERN NSString * const kNotify_IsRegisterSuccessBindingGoogleSuccessRefresh;

FOUNDATION_EXTERN NSString * const kNotify_IsSelectedNoTransactionTabarRefresh;
FOUNDATION_EXTERN NSString * const kNotify_IsPayCellInPostAdsRefresh;

FOUNDATION_EXTERN NSString * const kNotify_jumpAssetVC;
FOUNDATION_EXTERN NSString * const kNotify_IsStopTimeRefresh;
FOUNDATION_EXTERN NSString * const kNotify_IsPayStopTimeRefresh;
FOUNDATION_EXTERN NSString * const kNotify_NetWorkingStatusRefresh;
extern NSString* const kUserAssert;
extern NSString* const kIsBuyTip;
extern NSString* const kIsScanTip;

extern NSString* const KNotToRemindWhenNext;

extern NSString* const kIsLogin;

extern NSString* const kUserName;
extern NSString* const kUserPW;
extern NSString* const kUserInfo;

extern NSString* const kFixedAccountsInTransactions;

extern NSString* const kPayMethodesInPostAds;
extern NSString* const kLimitAccountsInPostAds;
extern NSString* const kFixedAccountsInPostAds;

extern NSString* const kFixedAccountsSelectedItemInPostAds;

extern NSString* const kControlNumberInPostAds;
extern NSString* const kControlTimeInPostAds;

extern NSString* const kNumberAndTimeInPostAds;
extern NSString* const kPaymentWaysInPostAds;
extern NSString* const kCheckNoOpenPayMethodesInPostAds;

extern NSString* const kIndexSection;
extern NSString* const kIndexInfo;
extern NSString* const kIndexRow;

extern NSString* const kType ;
extern NSString* const kIsOn ;
extern NSString* const kImg;
extern NSString* const kTip;
extern NSString* const kSubTip;
extern NSString* const kUrl;
extern NSString* const kArr;
extern NSString* const kData;

extern NSString* const kHomeCoinListDataKey;
extern NSString* const kHomeBannerDataKey;

extern NSString* const kNotify_HomeRootVC;


typedef NS_ENUM(NSUInteger,IndexSectionType){
    IndexSectionZero = 0 ,
    IndexSectionOne ,
    IndexSectionTwo ,
    IndexSectionThree ,
    IndexSectionFour ,
    IndexSectionFive ,
};

typedef NS_ENUM(NSUInteger,EnumActionTag){
    EnumActionTag0 = 0 ,
    EnumActionTag1  ,
    EnumActionTag2  ,
    EnumActionTag3  ,
    EnumActionTag4  ,
    EnumActionTag5  ,
    EnumActionTag6  ,
    EnumActionTag7  ,
    EnumActionTag8  ,
    EnumActionTag9  ,
    EnumActionTag10  ,
    EnumActionTag11  ,
    EnumActionTag12  ,
    EnumActionTag13
};

//typedef NS_ENUM(NSUInteger,PostAdsType){
//    PostAdsTypeCreate = 0 ,
//    PostAdsTypeEdit,
//};

typedef NS_ENUM(NSUInteger,OccurAdsType){
    OccurAdsTypeTypeAll = 0 ,
    OccurAdsTypeTypeOnline  ,
    OccurAdsTypeTypeOutline  ,
    OccurAdsTypeTypeSellOut ,
    
};

typedef NS_ENUM(NSUInteger,PostAdsDetailType){
    PostAdsDetailTypeSuccess = 0 ,
    
};

typedef NS_ENUM(NSUInteger,TransferDetailType){
    TransferDetailTypeSuccess = 0 ,
    
};
typedef NS_ENUM(NSUInteger,TransferWayType){
    TransferWayTypeNone = 0 ,
    TransferWayTypeScan  ,
    TransferWayTypeH5 ,
    TransferWayTypeApp
};
typedef NS_ENUM(NSUInteger,TransferRecordType){
    TransferRecordTypeAll = 0 ,
    TransferRecordTypeIn  ,
    TransferRecordTypeOut ,
};

typedef NS_ENUM(NSUInteger,UserAssetsType){
    UserAssetsTypeAll = 0 ,
    UserAssetsTypeTransferIn  ,
    UserAssetsTypeTransferOut ,
    UserAssetsTypeBuyIn  ,
    UserAssetsTypeSellOut ,
    UserAssetsTypeExchange ,
};

typedef NS_ENUM(NSUInteger,TransactionAmountType){
    TransactionAmountTypeNone = 0 ,
    TransactionAmountTypeLimit  ,//单笔限额
    TransactionAmountTypeFixed ,//单笔固额
    
};

typedef NS_ENUM(NSUInteger,MsgType){
    MsgTypeNone = 0 ,
    MsgTypeOrder  ,
    MsgTypeSystem ,
    MsgTypeService
};

typedef NS_ENUM(NSUInteger,SeniorAuthType){
    SeniorAuthTypeFinished = 1 ,
    SeniorAuthTypeUndone  ,
    
};

typedef NS_ENUM(NSUInteger,IdentityAuthType){
    IdentityAuthTypeNone = 0 ,
    IdentityAuthTypeHandling  ,
    IdentityAuthTypeRefuse  ,
    IdentityAuthTypeFinished ,
    
};

typedef NS_ENUM(NSUInteger,OccurOrderType){
    OccurOrderTypeNone = 0 ,
    
    OccurOrderTypeBuy  ,
    OccurOrderTypeSell
};

typedef NS_ENUM(NSUInteger,UserType){
    UserTypeNone = 0 ,
    UserTypeBuyer  , // 买家
    UserTypeSeller   // 卖家
};

typedef NS_ENUM(NSUInteger,Schedule){
    
    Schedule_all = 0 ,
    Schedule_1st ,//1、提交订单(买)；买家下单(卖)
    Schedule_2nd ,//2、向卖家转账(买)；买家付款(卖)
    Schedule_3rd ,//3、等待放行(买)；订单放行(卖)
    Schedule_4th//4、交易完成(买)；交易完成(卖)
};

typedef NS_ENUM(NSUInteger,OrderType){
    BuyerOrderTypeAllPay = 0 ,
    
    BuyerOrderTypeNotYetPay,//买方_订单还未支付 (向卖家转账) //联系卖家 点击确认付款 ？？？？？
    BuyerOrderTypeHadPaidWaitDistribute,//买方_订单已经支付待放行 (等待放行)//K
    BuyerOrderTypeHadPaidNotDistribute,//买方_订单已经支付不放行 (等待放行)//K
    BuyerOrderTypeFinished,//买方_订单结束 (交易已完成)//K
    BuyerOrderTypeCancel,//买方_订单取消 (向卖家转账)//K
    BuyerOrderTypeClosed,//买方_订单关闭 (付款已超时 / 已取消)(向卖家转账)  已超时 // 已超时页面//K
    BuyerOrderTypeAppealing,//买方_订单申诉 (向卖家转账 提供错误的讯息无法转账导致订单超时 / 等待放行 已付款未放行) 向卖家转账 / 等待放行//K
    
    SellerOrderTypeNotYetPay,//卖方_订单还未支付 (买家付款)
    SellerOrderTypeWaitDistribute,//卖方_订单等待放行 (放行订单)
    SellerOrderTypeAppealing ,//卖方_订单申诉 (放行订单)
    SellerOrderTypeFinished ,//卖方_订单完成 (交易完成)
    SellerOrderTypeCancel,//卖方_订单取消 (买家付款)
    SellerOrderTypeTimeOut,//卖方_订单超时 (买家付款)
};

typedef NS_ENUM(NSUInteger,ExchangeType){
    ExchangeTypeAll = 0,
    
    ExchangeTypeHandling,
    
    ExchangeTypePayed,
    
    ExchangeTypeRefused,
    
    ExchangeTypeBack,
};

typedef NS_ENUM(NSUInteger,PaywayType){
    PaywayTypeNone = 0,
    
    PaywayTypeWX,//微信
    
    PaywayTypeZFB,//支付宝
    
    PaywayTypeCard,//银行卡
};

typedef NS_ENUM(NSUInteger,PaywayOccurType){
    PaywayOccurTypeCreate = 0 ,
    
    PaywayOccurTypeEdit,
};

typedef NS_ENUM(NSUInteger,LongPwdTypes){
    longRegister = 0 , // 注册
    longForgetPW, // 重设密码等
};

typedef NS_ENUM(NSUInteger,IsSelected){
    
    IsSelect_No = 0, // 未选中
    IsSelected_Yes // 选中
};

NS_ASSUME_NONNULL_BEGIN

@interface YBNotificationManager : NSObject
@end

NS_ASSUME_NONNULL_END
