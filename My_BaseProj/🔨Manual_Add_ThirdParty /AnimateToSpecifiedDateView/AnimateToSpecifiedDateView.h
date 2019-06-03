//
//  AnimateToSpecifiedDate.h
//  JinXian Finance
//
//  Created by 刘赓 on 2017/7/6.
//  Copyright © 2017年 刘赓. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AnimateToSpecifiedDate_Init.h"

/**
 日期时间格式: xxxx-xx-xx
 */

NS_ASSUME_NONNULL_BEGIN

@interface AnimateToSpecifiedDateView : UIView

@property(nonatomic,strong)AnimateToSpecifiedDate_Init *animateToSpecifiedDate_Init;

@property(nonatomic,strong)UICountingLabel *yearLab;

@property(nonatomic,strong)UICountingLabel *monthLab;

@property(nonatomic,strong)UICountingLabel *dayLab;

@property(nonatomic,assign)float time;

#pragma mark —— data
@property(nonatomic,strong)NSString *year_oldValueStr;

@property(nonatomic,strong)NSString *month_oldValueStr;

@property(nonatomic,strong)NSString *day_oldValueStr;

@property(nonatomic,strong)NSString *year_newValueStr;

@property(nonatomic,strong)NSString *month_newValueStr;

@property(nonatomic,strong)NSString *day_newValueStr;

@end

NS_ASSUME_NONNULL_END
