//
//  BaseVC.h
//  gtp
//
//  Created by GT on 2019/1/8.
//  Copyright © 2019 GT. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseVC : UIViewController
- (void)loginSuccessBlockMethod;
- (BOOL)isloginBlock;
-(void)locateTabBar:(NSInteger)index;
- (void)setStatusBarBackgroundColor:(UIColor *)color;
@end

NS_ASSUME_NONNULL_END
