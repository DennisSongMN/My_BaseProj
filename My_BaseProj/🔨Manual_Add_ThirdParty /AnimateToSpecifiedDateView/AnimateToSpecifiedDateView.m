//
//  AnimateToSpecifiedDate.m
//  JinXian Finance
//
//  Created by 刘赓 on 2017/7/6.
//  Copyright © 2017年 刘赓. All rights reserved.
//

#import "AnimateToSpecifiedDateView.h"

@interface AnimateToSpecifiedDateView (){
    
}


@end

@implementation AnimateToSpecifiedDateView

-(instancetype)init{

    if (self = [super init]) {
        
        [self AnimateToSpecifiedDate_Init];
        
        [self connection];

        [self configurationAboutDayLab];
        
        [self configurationAboutMonthLab];
        
        [self configurationAboutYearLab];

//        [self testColor];
    }

    return self;
}


-(void)AnimateToSpecifiedDate_Init{

    if (!_animateToSpecifiedDate_Init) {
        
        _animateToSpecifiedDate_Init = [[AnimateToSpecifiedDate_Init alloc]init];
    }
}

-(void)connection{

    self.yearLab = self.animateToSpecifiedDate_Init.yearLab;
    
    self.monthLab = self.animateToSpecifiedDate_Init.monthLab;
    
    self.dayLab = self.animateToSpecifiedDate_Init.dayLab;
}

-(void)configurationAboutDayLab{
    
    [self addSubview:self.dayLab];
    
    [self.dayLab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(self.mas_right);
        
        make.top.bottom.equalTo(self);
    }];
}

-(void)configurationAboutMonthLab{
    
    [self addSubview:self.monthLab];
    
    [self.monthLab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.bottom.equalTo(self);
        
        make.right.equalTo(self.dayLab.mas_left);
    }];
}

-(void)configurationAboutYearLab{
    
    [self addSubview:self.yearLab];
    
    [self.yearLab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(self.monthLab.mas_left);
        
        make.top.bottom.equalTo(self);
    }];
}

#pragma mark —— set方法赋值
-(void)setYear_oldValueStr:(NSString *)year_oldValueStr{

    _year_oldValueStr = year_oldValueStr;
    
    self.yearLab.text = _year_oldValueStr;
}

-(void)setMonth_oldValueStr:(NSString *)month_oldValueStr{

    _month_oldValueStr = month_oldValueStr;
    
    self.monthLab.text = _month_oldValueStr;
}

-(void)setDay_oldValueStr:(NSString *)day_oldValueStr{

    _day_oldValueStr = day_oldValueStr;
    
    self.dayLab.text = _day_oldValueStr;
}

//从设置新值开始变化
-(void)setYear_newValueStr:(NSString *)year_newValueStr{

    _year_newValueStr = year_newValueStr;

    if ([_year_oldValueStr intValue] != [_year_newValueStr intValue]) {
        
        [self.yearLab countFrom:[_year_oldValueStr intValue]
                             to:[_year_newValueStr intValue]
                   withDuration:_time];
        
        self.yearLab.format = @"%d";
        
    }else return;
}

-(void)setMonth_newValueStr:(NSString *)month_newValueStr{

    _month_newValueStr = month_newValueStr;
    
    [self.monthLab countFrom:1
                          to:[_month_newValueStr intValue]
                withDuration:_time];

    self.monthLab.format = @"-%d";
}

-(void)setDay_newValueStr:(NSString *)day_newValueStr{

    _day_newValueStr = day_newValueStr;
    
    [self.dayLab countFrom:1
                        to:[_day_newValueStr intValue]
              withDuration:_time];
    
    self.dayLab.format = @"-%d";

}

-(void)setTime:(float)time{

    _time = time;
}

-(void)testColor{

    self.dayLab.backgroundColor = [UIColor lightGrayColor];
    
    self.monthLab.backgroundColor = [UIColor redColor];
    
    self.yearLab.backgroundColor = [UIColor brownColor];
}


@end
