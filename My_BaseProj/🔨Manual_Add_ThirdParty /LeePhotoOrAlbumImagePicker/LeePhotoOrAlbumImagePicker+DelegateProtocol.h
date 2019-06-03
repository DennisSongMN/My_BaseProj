//
//  LeePhotoOrAlbumImagePicker+DelegateProtocol.h
//  ShengAi
//
//  Created by 刘赓 on 2018/12/18.
//  Copyright © 2018 刘赓. All rights reserved.
//

#import "LeePhotoOrAlbumImagePicker.h"

NS_ASSUME_NONNULL_BEGIN

@interface LeePhotoOrAlbumImagePicker (DelegateProtocol)<UINavigationControllerDelegate, UIImagePickerControllerDelegate>

-(void)UIImagePickerControllerDelegateProtocol;

@end

NS_ASSUME_NONNULL_END
