//
//  NavigationViewController.m
//  ShengAi
//
//  Created by 刘赓 on 2018/10/29.
//  Copyright © 2018年 刘赓. All rights reserved.
//

#import "NavigationViewController.h"

@interface NavigationViewController ()

@end

@implementation NavigationViewController

- (void)dealloc {
    
    NSLog(@"%s",__FUNCTION__);
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self configBackgroundImage];
    
    [self configTitleTextStyle];
    
//    [self setupEditBtn];
}

/**
 *  设置NavgationBar的背景图片，红色背景
 */
-(void)configBackgroundImage{
    
    if ([self.navigationBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics: )]) {
        
        [self.navigationBar setBarTintColor:[UIColor colorWithHexString:@"#00A7FF"]];
        
        self.navigationBar.tintColor = [UIColor whiteColor];
    }
}

/**
 *  设置导航上的title显示样式，白色文
 字
 */
-(void)configTitleTextStyle{
    
    NSShadow *shadow = [[NSShadow alloc] init];
    
    shadow.shadowColor = [UIColor colorWithRed:0.0
                                         green:0.0
                                          blue:0.0
                                         alpha:0.8];
    
    shadow.shadowOffset = CGSizeMake(0, 0);
    
    UIColor *textColor = [UIColor whiteColor];

    [self.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                textColor, NSForegroundColorAttributeName,shadow, NSShadowAttributeName,[UIFont fontWithName:@"PingFang SC" size:18.0f], NSFontAttributeName,
                                                nil]];
    
}

- (void)pushViewController:(UIViewController *)viewController
                  animated:(BOOL)animated{
    
   
    if (self.childViewControllers.count > 0) { // 不是根控制器
        
        viewController.hidesBottomBarWhenPushed = YES;//push 的时候 吧tabBar 隐藏了
    }

    [super pushViewController:viewController animated:animated];//只能写在后面
}

//-(void)setupEditBtn{
//
//    
////    UIBarButtonItem *editBarBtnItems = [[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(action_EditBtn:)];
////    
////    self.navigationController.navigationItem.rightBarButtonItem = editBarBtnItems;
//}

//-(UIButton *)editBtn{
//
//    if (!_editBtn) {
//        
//        _editBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//        
//        _editBtn.uxy_acceptEventInterval = 0.5f;
//        
//        [_editBtn setTitle:@"编辑"
//                  forState:UIControlStateNormal];
//        
//        _editBtn.backgroundColor = [UIColor clearColor];
//        
//        [_editBtn setTitleColor:[UIColor whiteColor]
//                       forState:UIControlStateNormal];
//        
//        [_editBtn addTarget:self
//                     action:@selector(action_EditBtn:)
//           forControlEvents:UIControlEventTouchUpInside];
//    }
//
//    return _editBtn;
//}
//
//-(void)action_EditBtn:(UIButton *)sender{
//
//
//
//}







@end
