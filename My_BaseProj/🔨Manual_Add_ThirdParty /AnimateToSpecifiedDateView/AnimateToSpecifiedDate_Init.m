//
//  AnimateToSpecifiedDate_Init.m
//  JinXian Finance
//
//  Created by 刘赓 on 2017/7/6.
//  Copyright © 2017年 刘赓. All rights reserved.
//

#import "AnimateToSpecifiedDate_Init.h"

@implementation AnimateToSpecifiedDate_Init

-(instancetype)init{

    if (self = [super init]) {
        
    }
    
    return self;
}

-(UICountingLabel *)yearLab{

    if (!_yearLab) {
        
        _yearLab = [[UICountingLabel alloc]init];
    }

    return _yearLab;
}

-(UICountingLabel *)monthLab{

    if (!_monthLab) {
        
        _monthLab = [[UICountingLabel alloc]init];
    }
    
    return _monthLab;
}

-(UICountingLabel *)dayLab{

    if (!_dayLab) {
        
        _dayLab = [[UICountingLabel alloc]init];
    }
    
    return _dayLab;
}

@end
