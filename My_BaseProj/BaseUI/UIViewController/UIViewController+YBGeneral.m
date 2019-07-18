//
//  UIViewController+YBGeneral.m
//  Aa
//
//  Created by Aalto on 2018/11/19.
//  Copyright © 2018 Aalto. All rights reserved.
//

#import "UIViewController+YBGeneral.h"

@implementation UIViewController (YBGeneral)

- (void)YBGeneral_baseConfig{
    
    self.view.backgroundColor = [UIColor whiteColor];
//    self.automaticallyAdjustsScrollViewInsets = NO;
}

@end

@implementation UIViewController (YBGeneralBackItem)

+ (void)popGestureClose:(UIViewController *)VC
{
    // 禁用侧滑返回手势
    if ([VC.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        //这里对添加到右滑视图上的所有手势禁用
        for (UIGestureRecognizer *popGesture in VC.navigationController.interactivePopGestureRecognizer.view.gestureRecognizers) {
            popGesture.enabled = NO;
        }
        //若开启全屏右滑，不能再使用下面方法，请对数组进行处理
        //VC.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
}

+ (void)popGestureOpen:(UIViewController *)VC
{
    // 启用侧滑返回手势
    if ([VC.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        //这里对添加到右滑视图上的所有手势启用
        for (UIGestureRecognizer *popGesture in VC.navigationController.interactivePopGestureRecognizer.view.gestureRecognizers) {
            popGesture.enabled = YES;
        }
        //若开启全屏右滑，不能再使用下面方法，请对数组进行处理
        //VC.navigationController.interactivePopGestureRecognizer.enabled = YES;
    }
}

+(UIGestureRecognizer *)Gesture:(UIViewController *)VC{

    UIGestureRecognizer *popGesture = Nil;
    // 启用侧滑返回手势
    if ([VC.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        //这里对添加到右滑视图上的所有手势启用
        for (popGesture in VC.navigationController.interactivePopGestureRecognizer.view.gestureRecognizers) {
            
            return popGesture;
        }
    }
    
    return popGesture;
}

- (void)YBGeneral_configBackItem {
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:nil
                                                                 style:UIBarButtonItemStylePlain
                                                                target:self
                                                                action:@selector(YBGeneral_clickBackItem:)];
    
    backItem.image = [[UIImage imageNamed:@"naviBackItem"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    self.navigationItem.leftBarButtonItem = backItem;
}

- (void)YBGeneral_clickBackItem:(UIBarButtonItem *)item {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)navigationController:(UINavigationController*)navigationController
      willShowViewController:(UIViewController*)viewController animated:(BOOL)animated {
    
    if(viewController == self){
        
        [navigationController setNavigationBarHidden:YES
                                            animated:YES];
    }else{
        
        //系统相册继承自 UINavigationController 这个不能隐藏 所有就直接return
        if ([navigationController isKindOfClass:[UIImagePickerController class]]) {
            return;
        }
        
        //不在本页时，显示真正的navbar
        [navigationController setNavigationBarHidden:NO
                                            animated:YES];
        //当不显示本页时，要么就push到下一页，要么就被pop了，那么就将delegate设置为nil，防止出现BAD ACCESS
        //之前将这段代码放在viewDidDisappear和dealloc中，这两种情况可能已经被pop了，self.navigationController为nil，这里采用手动持有navigationController的引用来解决
        if(navigationController.delegate == self){
            //如果delegate是自己才设置为nil，因为viewWillAppear调用的比此方法较早，其他controller如果设置了delegate就可能会被误伤
            navigationController.delegate = nil;
        }
    }
}

@end

