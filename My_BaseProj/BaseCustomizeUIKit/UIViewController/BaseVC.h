//
//  BaseVC.h
//  gtp
//
//  Created by GT on 2019/1/8.
//  Copyright © 2019 GT. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseVC : GKNavigationBarViewController
<
UIGestureRecognizerDelegate
,UINavigationControllerDelegate
>

@property(nonatomic,strong)MJRefreshAutoGifFooter *tableViewFooter;
@property(nonatomic,strong)MJRefreshGifHeader *tableViewHeader;

@property(nonatomic,assign)BOOL isRequestFinish;//数据请求是否完毕
@property(nonatomic,copy)void (^UnknownNetWorking)(void);
@property(nonatomic,copy)void (^NotReachableNetWorking)(void);
@property(nonatomic,copy)void (^ReachableViaWWANNetWorking)(void);
@property(nonatomic,copy)void (^ReachableViaWiFiNetWorking)(void);

-(void)AFNReachability;
-(void)showLoginAlertView;
-(void)showAlertViewTitle:(NSString *)title
                  message:(NSString *)message
              btnTitleArr:(NSArray <NSString*>*)btnTitleArr
           alertBtnAction:(NSArray <NSString*>*)alertBtnActionArr;

-(void)locateTabBar:(NSInteger)index;
-(void)setStatusBarBackgroundColor:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END
