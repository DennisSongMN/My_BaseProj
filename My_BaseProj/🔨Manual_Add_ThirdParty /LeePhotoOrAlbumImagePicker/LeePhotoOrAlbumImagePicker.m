//
//  LeePhotoOrAlbumImagePicker.m
//  ShengAi
//
//  Created by 刘赓 on 2018/12/18.
//  Copyright © 2018 刘赓. All rights reserved.
//

#import "LeePhotoOrAlbumImagePicker.h"

#import <AssetsLibrary/AssetsLibrary.h>
#import <Photos/PhotosDefines.h>
#import <Photos/PHPhotoLibrary.h>
#import <AVFoundation/AVFoundation.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import "LeePhotoOrAlbumImagePicker+DelegateProtocol.h"

@interface LeePhotoOrAlbumImagePicker ()

@end

@implementation LeePhotoOrAlbumImagePicker

- (void)getPhotoAlbumOrTakeAPhotoWithController:(UIViewController *)controller
                                     photoBlock:(LeePhotoOrAlbumImagePickerBlock)photoBlock{
    self.photoBlock = photoBlock;

    self.viewController = controller;

    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil
                                                                             message:nil
                                                                      preferredStyle:UIAlertControllerStyleActionSheet];

    UIAlertAction *photoAlbumAction = [UIAlertAction actionWithTitle:@"从相册选择"
                                                               style:UIAlertActionStyleDefault
                                                             handler:^(UIAlertAction * _Nonnull action) {
        [self getAlertActionType:1];
    }];

    UIAlertAction *cemeraAction = [UIAlertAction actionWithTitle:@"拍照"
                                                           style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * _Nonnull action) {
        [self getAlertActionType:2];
    }];

    UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"取消"
                                                           style:UIAlertActionStyleCancel
                                                         handler:^(UIAlertAction * _Nonnull action) {
        [self getAlertActionType:0];
    }];

    [alertController addAction:photoAlbumAction];

    [alertController addAction:cancleAction];

    // 判断是否支持拍照
    [self imagePickerControlerIsAvailabelToCamera] ? [alertController addAction:cemeraAction]:nil;

    [self.viewController presentViewController:alertController
                                      animated:YES
                                    completion:nil];
}

/**
 UIAlertController 点击事件 确定选择的媒体来源（相册/相机）

 @param type 点击的类型
 */
- (void)getAlertActionType:(NSInteger)type {

    NSInteger sourceType = UIImagePickerControllerSourceTypePhotoLibrary;

    if (type == 1) {

        sourceType = UIImagePickerControllerSourceTypePhotoLibrary;

    }else if (type == 2){

        sourceType = UIImagePickerControllerSourceTypeCamera;
    }

    [self creatUIImagePickerControllerWithAlertActionType:sourceType];
}

/**
 点击事件出发的方法

 @param type 媒体库来源 （相册/相机）
 */
- (void)creatUIImagePickerControllerWithAlertActionType:(NSInteger)type {

    self.sourceType = type;
    // 获取不同媒体类型下的授权类型
    NSInteger cameragranted = [self AVAuthorizationStatusIsGranted];

    // 如果确定未授权 cameragranted ==0 弹框提示；如果确定已经授权 cameragranted == 1；如果第一次触发授权 cameragranted == 2，这里不处理
    if (cameragranted == 0) {

        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示"
                                                                                 message:@"请到设置-隐私-相机/相册中打开授权设置"
                                                                          preferredStyle:UIAlertControllerStyleAlert];

        UIAlertAction *comfirmAction = [UIAlertAction actionWithTitle:@"确定"
                                                                style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * _Nonnull action) {
            // 无权限 引导去开启
            NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];

            if ([[UIApplication sharedApplication]canOpenURL:url]) {

                [[UIApplication sharedApplication]openURL:url
                                                  options:@{}
                                        completionHandler:nil];
            }
        }];

        [alertController addAction:comfirmAction];

        [self.viewController presentViewController:alertController
                                          animated:YES
                                        completion:nil];

    }else if (cameragranted == 1) {

        [self presentPickerViewController];
    }
}


// 判断硬件是否支持拍照
- (BOOL)imagePickerControlerIsAvailabelToCamera {

    return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
}

#pragma mark - 照机/相册 授权判断
- (NSInteger)AVAuthorizationStatusIsGranted{

    kWeakSelf(self);

    NSString *mediaType = AVMediaTypeVideo;

    AVAuthorizationStatus authStatusVedio = [AVCaptureDevice authorizationStatusForMediaType:mediaType];  // 相机授权

    PHAuthorizationStatus authStatusAlbm  = [PHPhotoLibrary authorizationStatus];                         // 相册授权

    NSInteger authStatus = self.sourceType == UIImagePickerControllerSourceTypePhotoLibrary ? authStatusAlbm:authStatusVedio;

    switch (authStatus) {

        case 0: { //第一次使用，则会弹出是否打开权限，如果用户第一次同意授权，直接执行再次调起

            if (self.sourceType == UIImagePickerControllerSourceTypePhotoLibrary) {

                [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {

                    if (status == PHAuthorizationStatusAuthorized) { //授权成功

                        [weakself presentPickerViewController];
                    }
                }];
            }else{
                [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo
                                         completionHandler:^(BOOL granted) {

                    if (granted) { //授权成功
                        
                        [weakself presentPickerViewController];
                    }
                }];
            }
        }
            return 2;   //-> 不提示
        case 1: return 0; //-> 还未授权
        case 2: return 0; //-> 主动拒绝授权
        case 3: return 1; //-> 已授权
        default:return 0;
    }
}

/**
 如果第一次访问用户是否是授权，如果用户同意 直接再次执行
 */
-(void)presentPickerViewController{

    self.picker = UIImagePickerController.new;

    if (@available(iOS 11.0, *)){

        [[UIScrollView appearance] setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentAlways];
    }

    [self UIImagePickerControllerDelegateProtocol];

    self.picker.allowsEditing = YES;          //-> 是否允许选取的图片可以裁剪编辑

    self.picker.sourceType = self.sourceType; //-> 媒体来源（相册/相机）
    
    [self.viewController presentViewController:self.picker
                                      animated:YES
                                    completion:nil];
}



@end

