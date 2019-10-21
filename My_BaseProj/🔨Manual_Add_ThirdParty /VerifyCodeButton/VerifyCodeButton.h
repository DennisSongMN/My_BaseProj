//
//  VerifyCodeButton.h
//  ShengAi
//
//  Created by 刘赓 on 2018/12/12.
//  Copyright © 2018 刘赓. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VerifyCodeButton : UIButton

@property(nonatomic,strong)NSTimer *timer;
@property(nonatomic,copy)NSString *titleBeginStr;
@property(nonatomic,copy)NSString *titleEndStr;
@property(nonatomic,strong)UIColor *titleColor;
@property(nonatomic,strong)UIColor *bgBeginColor;
@property(nonatomic,strong)UIColor *bgEndColor;
@property(nonatomic,strong)UIColor *layerBorderColor;
@property(nonatomic,strong)UIFont *titleLabelFont;
@property(nonatomic,assign)CGFloat layerCornerRadius;
@property(nonatomic,assign)CGFloat layerBorderWidth;
@property(nonatomic,assign)BOOL isClipsToBounds;

- (void)timeFailBeginFrom:(NSInteger)timeCount;//倒计时时间次数

@end

NS_ASSUME_NONNULL_END
