//
//  UIViewController+YBGeneral.h
//  Aa
//
//  Created by Aalto on 2018/11/19.
//  Copyright © 2018 Aalto. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (YBGeneral)<UINavigationControllerDelegate,UIGestureRecognizerDelegate>

/** 基础配置 */
- (void)YBGeneral_baseConfig;

@end

@interface UIViewController (YBGeneralBackItem)

/** 配置通用系统导航栏返回按钮 */
- (void)YBGeneral_configBackItem;

/** 重写该方法以自定义系统导航栏返回按钮点击事件 */
- (void)YBGeneral_clickBackItem:(UIBarButtonItem *)item;

+ (void)popGestureClose:(UIViewController *)VC;

+ (void)popGestureOpen:(UIViewController *)VC;

+ (UIGestureRecognizer *)Gesture:(UIViewController *)VC;

@end

typedef void(^ImagePickerCompletionHandler)(NSData *imageData, UIImage *image);

@interface UIViewController (ImagePicker)

- (void)pickImageFromAlbumWithCompletionHandler:(ImagePickerCompletionHandler)completionHandler;

- (void)pickImageWithCompletionHandler:(ImagePickerCompletionHandler)completionHandler;

- (void)pickImageWithpickImageCutImageWithImageSize:(CGSize)imageSize CompletionHandler:(ImagePickerCompletionHandler)completionHandler;

@end

NS_ASSUME_NONNULL_END
