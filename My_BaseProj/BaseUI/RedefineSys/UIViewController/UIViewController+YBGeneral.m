//
//  UIViewController+YBGeneral.m
//  Aa
//
//  Created by Aalto on 2018/11/19.
//  Copyright © 2018 Aalto. All rights reserved.
//

#import "UIViewController+YBGeneral.h"

#import <objc/runtime.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <Photos/PHPhotoLibrary.h>
#import <AVFoundation/AVCaptureDevice.h>

@implementation UIViewController (YBGeneral)

- (void)YBGeneral_baseConfig {
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

static void *kImagePickerCompletionHandlerKey = @"kImagePickerCompletionHandlerKey";
static void *kCameraPickerKey = @"kCameraPickerKey";
static void *kPhotoLibraryPickerKey = @"kPhotoLibraryPickerKey";
static void *kImageSizeKey = @"kimageSizeKey";
static void *isCut =  @"isCut"; //截取

@interface UIViewController()<UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) UIImagePickerController *cameraPicker;
@property (nonatomic, strong) UIImagePickerController *photoLibraryPicker;
@property (nonatomic, copy) ImagePickerCompletionHandler completionHandler;

@property (nonatomic, assign) BOOL isCutImageBool;
@property (nonatomic, assign) CGSize imageSize;

@end

@implementation UIViewController (ImagePicker)

- (void)pickImageWithCompletionHandler:(ImagePickerCompletionHandler)completionHandler {
    self.completionHandler = completionHandler;
    [self presentChoseActionSheet];
}

- (void)pickImageFromAlbumWithCompletionHandler:(ImagePickerCompletionHandler)completionHandler {
    self.completionHandler = completionHandler;
    [self presentAlbumChoseActionSheet];
}

- (void)pickImageWithpickImageCutImageWithImageSize:(CGSize)imageSize CompletionHandler:(ImagePickerCompletionHandler)completionHandler
{
    self.completionHandler = completionHandler;
    self.isCutImageBool = YES;
    self.imageSize = imageSize;
    [self presentChoseActionSheet];
}

- (void)setUpCameraPickControllerIsEdit:(BOOL)isEdit {
    self.cameraPicker = [[UIImagePickerController alloc] init];
    self.cameraPicker.allowsEditing = isEdit; //拍照选去是否可以截取，和代理中的获取截取后的方法配合使用
    self.cameraPicker.delegate = self;
    self.cameraPicker.sourceType = UIImagePickerControllerSourceTypeCamera;
}

- (void)setUpPhotoPickControllerIsEdit:(BOOL)isEdit {
    self.photoLibraryPicker = [[UIImagePickerController alloc] init];
    self.photoLibraryPicker.allowsEditing = isEdit; // 相册选取是否截图
    self.photoLibraryPicker.delegate = self;
    //去掉毛玻璃效果 否则在ios11 下 全局设置了UIScrollViewContentInsetAdjustmentNever 导致导航栏遮住了内容视图
    self.photoLibraryPicker.navigationBar.translucent = NO;
    self.photoLibraryPicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
}
- (void)presentAlbumChoseActionSheet{
    //先创建好 不然调用的时候 第一次创建很慢 有2秒的延迟
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        //判断相机可用
        [self setUpCameraPickControllerIsEdit:self.isCutImageBool];
    }
    [self setUpPhotoPickControllerIsEdit:self.isCutImageBool];
    
    UIAlertController * actionController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    UIAlertAction * takePhotoAction = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
            if (granted) {
                [self presentViewController:self.cameraPicker animated:YES completion:nil];
            }
            else {
                UIAlertController * noticeAlertController = [UIAlertController alertControllerWithTitle:@"未开启相机权限，请到设置界面开启" message:nil preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                    
                }];
                
                UIAlertAction * okAction = [UIAlertAction actionWithTitle:@"现在就去" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    //跳转到设置界面
                    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString] options:@{} completionHandler:^(BOOL success) {
                        
                    }];
                }];
                
                [noticeAlertController addAction:cancelAction];
                [noticeAlertController addAction:okAction];
                [self presentViewController:noticeAlertController animated:YES completion:^{
                    
                }];
            }
        }];
        
    }];
    
    UIAlertAction * choseFromAlbumAction = [UIAlertAction actionWithTitle:@"从相册选取" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //判断相册权限
        [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
            if (status == PHAuthorizationStatusNotDetermined || status == PHAuthorizationStatusAuthorized) {
                //未知的   第一次访问
                
                [self presentViewController:self.photoLibraryPicker animated:YES completion:nil];
                
            }
            else {
                UIAlertController * noticeAlertController = [UIAlertController alertControllerWithTitle:@"未开启相册权限，请到设置界面开启" message:nil preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                    
                }];
                
                UIAlertAction * okAction = [UIAlertAction actionWithTitle:@"现在就去" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    //跳转到设置界面
                    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString] options:@{} completionHandler:^(BOOL success) {
                        
                    }];
                }];
                
                [noticeAlertController addAction:cancelAction];
                [noticeAlertController addAction:okAction];
                [self presentViewController:noticeAlertController animated:YES completion:^{
                    
                }];
            }
        }];
        
    }];
    
    [actionController addAction:cancelAction];
    //    [actionController addAction:takePhotoAction];
    [actionController addAction:choseFromAlbumAction];
    
    [self presentViewController:actionController animated:YES completion:^{
        
    }];
}
- (void)presentChoseActionSheet {
    
    //先创建好 不然调用的时候 第一次创建很慢 有2秒的延迟
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        //判断相机可用
        [self setUpCameraPickControllerIsEdit:self.isCutImageBool];
    }
    [self setUpPhotoPickControllerIsEdit:self.isCutImageBool];
    
    UIAlertController * actionController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    UIAlertAction * takePhotoAction = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
            if (granted) {
                [self presentViewController:self.cameraPicker animated:YES completion:nil];
            }
            else {
                UIAlertController * noticeAlertController = [UIAlertController alertControllerWithTitle:@"未开启相机权限，请到设置界面开启" message:nil preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                    
                }];
                
                UIAlertAction * okAction = [UIAlertAction actionWithTitle:@"现在就去" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    //跳转到设置界面
                    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString] options:@{} completionHandler:^(BOOL success) {
                        
                    }];
                }];
                
                [noticeAlertController addAction:cancelAction];
                [noticeAlertController addAction:okAction];
                [self presentViewController:noticeAlertController animated:YES completion:^{
                    
                }];
            }
        }];
        
    }];
    
    UIAlertAction * choseFromAlbumAction = [UIAlertAction actionWithTitle:@"从相册选取" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //判断相册权限
        [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
            if (status == PHAuthorizationStatusNotDetermined || status == PHAuthorizationStatusAuthorized) {
                //未知的   第一次访问
                
                [self presentViewController:self.photoLibraryPicker animated:YES completion:nil];
                
            }
            else {
                UIAlertController * noticeAlertController = [UIAlertController alertControllerWithTitle:@"未开启相册权限，请到设置界面开启" message:nil preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                    
                }];
                
                UIAlertAction * okAction = [UIAlertAction actionWithTitle:@"现在就去" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    //跳转到设置界面
                    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString] options:@{} completionHandler:^(BOOL success) {
                        
                    }];
                }];
                
                [noticeAlertController addAction:cancelAction];
                [noticeAlertController addAction:okAction];
                [self presentViewController:noticeAlertController animated:YES completion:^{
                    
                }];
            }
        }];
        
    }];
    
    [actionController addAction:cancelAction];
    [actionController addAction:takePhotoAction];
    [actionController addAction:choseFromAlbumAction];
    
    [self presentViewController:actionController animated:YES completion:^{
        
    }];
}

#pragma mark <UIImagePickerControllerDelegate>

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [picker dismissViewControllerAnimated:YES completion:nil];
    UIImage *editedimage = [[UIImage alloc] init];
    if(self.isCutImageBool){
        //获取裁剪的图
        editedimage = info[@"UIImagePickerControllerEditedImage"]; //获取裁剪的图
        CGSize imageSize = CGSizeMake(413, 626);
        if (self.imageSize.height>0) {
            imageSize = self.imageSize;
        }
        editedimage = [self reSizeImage:editedimage toSize:imageSize];
    }
    else{
        editedimage = info[@"UIImagePickerControllerOriginalImage"];
    }
    NSData *imageData = UIImageJPEGRepresentation(editedimage, 0.0001);//首次进行压缩
    UIImage *image = [UIImage imageWithData:imageData];
    //图片限制大小不超过 1M     CGFloat  kb =   data.lenth / 1000;  计算kb方法 os 按照千进制计算
    while (imageData.length/1000 > 1024) {
        NSLog(@"图片超过1M 压缩");
        imageData = UIImageJPEGRepresentation(image, 0.5);
        image = [UIImage imageWithData:imageData];
    }
    self.completionHandler(imageData, image);
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)reSize
{
    UIGraphicsBeginImageContext(CGSizeMake(reSize.width, reSize.height));
    [image drawInRect:CGRectMake(0, 0, reSize.width, reSize.height)];
    UIImage *reSizeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return reSizeImage;
}

#pragma mark - setters & getters

- (void)setCompletionHandler:(ImagePickerCompletionHandler)completionHandler {
    objc_setAssociatedObject(self, kImagePickerCompletionHandlerKey, completionHandler, OBJC_ASSOCIATION_COPY);
}

- (ImagePickerCompletionHandler)completionHandler {
    return objc_getAssociatedObject(self, kImagePickerCompletionHandlerKey);
}

- (void)setCameraPicker:(UIImagePickerController *)cameraPicker {
    objc_setAssociatedObject(self, kCameraPickerKey, cameraPicker, OBJC_ASSOCIATION_RETAIN);
}

- (UIImagePickerController *)cameraPicker {
    return objc_getAssociatedObject(self, kCameraPickerKey);;
}

- (void)setPhotoLibraryPicker:(UIImagePickerController *)photoLibraryPicker {
    objc_setAssociatedObject(self, kPhotoLibraryPickerKey, photoLibraryPicker, OBJC_ASSOCIATION_RETAIN);
}

- (UIImagePickerController *)photoLibraryPicker {
    return objc_getAssociatedObject(self, kPhotoLibraryPickerKey);
}

- (void)setIsCutImageBool:(BOOL)isCutImageBool {
    return objc_setAssociatedObject(self, isCut, @(isCutImageBool), OBJC_ASSOCIATION_RETAIN);
}

- (BOOL)isCutImageBool {
    return [objc_getAssociatedObject(self, isCut) boolValue];
}

- (void)setImageSize:(CGSize)imageSize {
    return objc_setAssociatedObject(self, kImageSizeKey, [NSValue valueWithCGSize:imageSize], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGSize)imageSize {
    NSValue * value = objc_getAssociatedObject(self, kImageSizeKey);
    return  value.CGSizeValue;
}

@end
