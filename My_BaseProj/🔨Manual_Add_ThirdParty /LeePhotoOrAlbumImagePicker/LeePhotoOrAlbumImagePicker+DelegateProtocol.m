//
//  LeePhotoOrAlbumImagePicker+DelegateProtocol.m
//  ShengAi
//
//  Created by 刘赓 on 2018/12/18.
//  Copyright © 2018 刘赓. All rights reserved.
//

#import "LeePhotoOrAlbumImagePicker+DelegateProtocol.h"

@implementation LeePhotoOrAlbumImagePicker (DelegateProtocol)

-(void)UIImagePickerControllerDelegateProtocol{

    self.picker.delegate = self;
}

#pragma mark - UIImagePickerControllerDelegate
// 点击完成按钮的选取图片的回掉
-(void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    // 获取编辑后的图片
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    // 如果裁剪的图片不符合标准 就会为空，直接使用原图
    image == nil    ?  image = [info objectForKey:UIImagePickerControllerOriginalImage] : nil;
    self.photoBlock ?  self.photoBlock(image): nil;
    [picker dismissViewControllerAnimated:YES completion:^{
        // 这个部分代码 视情况而定
        if (@available(iOS 11.0, *)){
            [[UIScrollView appearance] setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
        }
    }];
}


-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:^{
        // 这个部分代码 视情况而定
        if (@available(iOS 11.0, *)){
            [[UIScrollView appearance] setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
        }
    }];
}


@end
