//
//  LeePhotoOrAlbumImagePicker.h
//  ShengAi
//
//  Created by 刘赓 on 2018/12/18.
//  Copyright © 2018 刘赓. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^LeePhotoOrAlbumImagePickerBlock)(UIImage *image);

@interface LeePhotoOrAlbumImagePicker : NSObject

@property(nonatomic,copy)LeePhotoOrAlbumImagePickerBlock photoBlock;   //-> 回调

@property(nonatomic,strong)UIImagePickerController *picker; //-> 多媒体选择控制器

@property(nonatomic,weak)UIViewController *viewController; //-> 一定是weak 避免循环引用

@property(nonatomic,assign)NSInteger sourceType;            //-> 媒体来源 （相册/相机）

// 必须创建一个对象才行，才不会释放指针
// 必须先在使用该方法的控制器中初始化 创建这个属性，然后在对象调用如下方法

/**
 公共方法 选择图片后的图片回掉

 @param controller 使用这个工具的控制器
 @param photoBlock 选择图片后的回掉
 */
- (void)getPhotoAlbumOrTakeAPhotoWithController:(UIViewController *)controller
                                     photoBlock:(LeePhotoOrAlbumImagePickerBlock)photoBlock;


@end

NS_ASSUME_NONNULL_END
