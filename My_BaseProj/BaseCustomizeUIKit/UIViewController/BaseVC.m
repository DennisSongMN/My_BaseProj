
//
//  BaseVC.m
//  gtp
//
//  Created by GT on 2019/1/8.
//  Copyright © 2019 GT. All rights reserved.
//

#import "BaseVC.h"
//#import "NetworkingErrorView.h"
//#import "LoginVC.h"

@interface BaseVC ()
//@property(nonatomic,strong)NetworkingErrorView *netErrorView;
//@property(nonatomic)managerAFNetworkStatus lastNetStatus;
@end

@implementation BaseVC

- (void)dealloc{
    
    NSLog(@"Running self.class = %@;NSStringFromSelector(_cmd) = '%@';__FUNCTION__ = %s", self.class, NSStringFromSelector(_cmd),__FUNCTION__);
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setErrorViewDetial];
    [self bindViewModelRequest];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didNetworkStatusRefush:)
                                                 name:kNotify_NetWorkingStatusRefresh object:nil];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [SVProgressHUD dismiss];
}


-(void)setErrorViewDetial{
    
//    self.netErrorView = [[NetworkingErrorView alloc]init];
//
//    [self.view addSubview:self.netErrorView];
//
//    [self.netErrorView mas_makeConstraints:^(MASConstraintMaker *make) {
//
//        make.edges.equalTo(self.view);
//    }];
//
//    [self.netErrorView.refushBnt addTarget:self
//                                    action:@selector(didNetworkingErrorRefushClicked:)
//                          forControlEvents:UIControlEventTouchUpInside];
}
//重新加载点击事件
-(void)didNetworkingErrorRefushClicked:(UIButton *)sender{
    [self netwoekingErrorDataRefush];
}

-(void)netwoekingErrorDataRefush{
    
}

#pragma mark - 点击事件

-(void)didNetworkStatusRefush:(NSNotification *)noti{
    NSDictionary *dicaa = noti.object;
//    managerAFNetworkStatus status = [[dicaa objectForKey:@"status"] integerValue];
//    switch (status) {
//        case managerAFNetworkNotReachable:     // 无连线
//            self.netErrorView.hidden = NO;
//            [self.netErrorView setNetWorkingDetialWith:0];
//            [self.view bringSubviewToFront:self.netErrorView];
//            break;
//        case managerAFNetworkReachableViaWWAN: // 手机自带网络
//            if (self.lastNetStatus==managerAFNetworkNotReachable) {
//                [self netwoekingErrorDataRefush];
//            }
//            self.netErrorView.hidden = YES;
//            [self.view sendSubviewToBack:self.netErrorView];
//            break;
//        case managerAFNetworkReachableViaWiFi: // WiFi
//            if (self.lastNetStatus==managerAFNetworkNotReachable) {
//                [self netwoekingErrorDataRefush];
//            }
//            self.netErrorView.hidden = YES;
//            [self.view sendSubviewToBack:self.netErrorView];
//            break;
//        case managerAFNetworkOutTime: // 接口超时
//            self.netErrorView.hidden = NO;
//            [self.netErrorView setNetWorkingDetialWith:1];
//            [self.view bringSubviewToFront:self.netErrorView];
//            break;
//        case managerAFNetworkServiceError: // 接口报错
//            self.netErrorView.hidden = NO;
//            [self.netErrorView setNetWorkingDetialWith:1];
//            [self.view bringSubviewToFront:self.netErrorView];
//            break;
//        case managerAFNetworkUnknown:          // 未知网络
//        default:
//            self.netErrorView.hidden = YES;
//            [self.view sendSubviewToBack:self.netErrorView];
//            break;
//    }
//    self.lastNetStatus = status;
}

- (void)bindViewModelRequest{}

- (BOOL)isloginBlock {
    
    kWeakSelf(self);
    
    BOOL valueLogin = GetUserDefaultBoolForKey(kIsLogin);

    NSLog(@"%d",valueLogin);
    
    if(!valueLogin){
        
////        LoginVC *loginCon = [[LoginVC alloc]init];
////        loginCon.loginSuccessBlock = ^{
////            [weakSelf loginSuccessBlockMethod];
////        };
////        UINavigationController *reNavCon = [[UINavigationController alloc]initWithRootViewController:loginCon];
////        [self presentViewController:reNavCon animated:YES completion:nil];
//
////        [[ChangeURLEnvironment sharedInstance]changeEnvironment:^(id data) {
////            [LoginVC pushFromVC:self requestParams:@(0) success:^(id data) {
////                [weakSelf loginSuccessBlockMethod];
////            }];
////        }];
//
//        [LoginVC pushFromVC:self requestParams:@(0) success:^(id data) {
//            [weakSelf loginSuccessBlockMethod];
//        }];
        
        return YES;
    }
    
    return NO;
}

- (void)loginSuccessBlockMethod{
    
}

-(void)locateTabBar:(NSInteger)index{//backHome
    
    if (self.navigationController.tabBarController.selectedIndex == index) {
        
        [self.navigationController popToRootViewControllerAnimated:YES];
        
    }else{
        self.navigationController.tabBarController.hidesBottomBarWhenPushed = NO;
        
        self.navigationController.tabBarController.selectedIndex = index;
        
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}

//设置状态栏背景颜色
- (void)setStatusBarBackgroundColor:(UIColor *)color {
    
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = color;
    }
}

@end

