//
//  BadgeButton.h
//  ShengAi
//
//  Created by 刘赓 on 2018/11/30.
//  Copyright © 2018 刘赓. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, BadgeButtonType) {
    
    BadgeButtonType_Hollow,//空心状态
    BadgeButtonType_Solid//实心状态
};

typedef NS_ENUM(NSInteger, BadgeButtonLocationType) {
    
    BadgeButtonLocationType_leftTop,//左上
    BadgeButtonLocationType_rightTop//右上
};

@interface BadgeButton : UIButton

-(instancetype)initWithFrame:(CGRect)frame
                LocationType:(BadgeButtonLocationType)locationType
     BadgeLabBackgroundColor:(nullable UIColor *)backgroundColor
           BadgeLabTextColor:(nullable UIColor *)textColor
            BadgeborderColor:(nullable UIColor *)borderColor
            BadgeWithContent:(nullable NSString *)contentStr;

-(void)hideBadge;

@end

NS_ASSUME_NONNULL_END

