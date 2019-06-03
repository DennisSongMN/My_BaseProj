//
//  UIScrollView+YBGeneral.h
//  Aa
//
//  Created by Aalto on 2018/11/20.
//  Copyright © 2018 Aalto. All rights reserved.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface UIScrollView (YBGeneral)

- (void)YBGeneral_addRefreshHeader:(void(^)(void))block;
- (void)YBGeneral_addRefreshFooter:(void(^)(void))block;
- (void)YBGeneral_addRefreshHeader:(void(^)(void))blockH footer:(void(^)(void))blockF;

@end

NS_ASSUME_NONNULL_END
