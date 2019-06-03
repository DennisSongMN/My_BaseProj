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

@interface BadgeButton : UIButton

-(instancetype)initWithFrame:(CGRect)frame
                   StyleType:(BadgeButtonType)type;

-(void)showBadgeWithNumber:(NSInteger)badgeNumber;

-(void)hideBadge;

@end

NS_ASSUME_NONNULL_END

