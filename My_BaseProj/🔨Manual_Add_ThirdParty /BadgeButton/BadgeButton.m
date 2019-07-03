//
//  BadgeButton.m
//  ShengAi
//
//  Created by 刘赓 on 2018/11/30.
//  Copyright © 2018 刘赓. All rights reserved.
//

#import "BadgeButton.h"

@interface BadgeButton()

@property (nonatomic, strong) UILabel *badgeLabel;

@end

@implementation BadgeButton

-(instancetype)initWithFrame:(CGRect)frame
                   StyleType:(BadgeButtonType)type{
    
    if (self = [super initWithFrame:frame]) {

        self.clipsToBounds = NO;

        [self.titleLabel setFont:[UIFont systemFontOfSize:15]];

        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        if (type == BadgeButtonType_Hollow) {//空心
            
            self.badgeLabel = [[UILabel alloc]init];
            
            [self addSubview:self.badgeLabel];
            
            self.badgeLabel.backgroundColor = [UIColor clearColor];
            
            self.badgeLabel.font = [UIFont systemFontOfSize:10];
            
            self.badgeLabel.layer.borderWidth = 1;
            
            self.badgeLabel.layer.borderColor = [[UIColor greenColor] CGColor];
            
            self.badgeLabel.textColor = [UIColor redColor];
            
            self.badgeLabel.layer.cornerRadius = 6;
            
            self.badgeLabel.clipsToBounds = YES;

        }
        else if (type == BadgeButtonType_Solid){//实心
            
            self.badgeLabel = [[UILabel alloc]init];
            
            [self addSubview:self.badgeLabel];
            
            self.badgeLabel.backgroundColor = [UIColor redColor];
            
            self.badgeLabel.font = [UIFont systemFontOfSize:10];
            
            self.badgeLabel.textColor = [UIColor whiteColor];
            
            self.badgeLabel.layer.cornerRadius = 6;
            
            self.badgeLabel.clipsToBounds = YES;
        }

        //建立约束
        [self.badgeLabel mas_makeConstraints:^(MASConstraintMaker *make) {

            make.left.mas_equalTo(self.titleLabel.mas_right).mas_offset(-5);

            make.bottom.mas_equalTo(self.titleLabel.mas_top).mas_offset(5);

            make.size.mas_equalTo(CGSizeMake(12, 12));
        }];
        
        [self layoutIfNeeded];
    }

    return self;
}

#pragma mark ======== 显示角标 ======
-(void)showBadgeWithNumber:(NSInteger)badgeNumber{

    self.badgeLabel.hidden = NO;
    
    self.badgeLabel.text = [NSString stringWithFormat:@" %ld ",badgeNumber];
}

#pragma mark ======== 隐藏角标 ======
-(void)hideBadge{

    self.badgeLabel.hidden = YES;
    
}



@end




