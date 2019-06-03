//
//  VerifyCodeButton.m
//  ShengAi
//
//  Created by 刘赓 on 2018/12/12.
//  Copyright © 2018 刘赓. All rights reserved.
//

#import "VerifyCodeButton.h"

@interface VerifyCodeButton ()

@property(nonatomic,assign)long count;

@end

//获取验证码 —— 倒计时
@implementation VerifyCodeButton

//倒计时方法:
- (void)timeFailBeginFrom:(NSInteger)timeCount {

    self.count = timeCount;
    self.enabled = NO;
    // 加1个计时器
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1
                                                  target:self
                                                selector:@selector(timerFired)
                                                userInfo:nil
                                                 repeats:YES];
}

//计时器方法:
- (void)timerFired {

    if (self.count != 1) {

        self.count -= 1;

        self.enabled = NO;

        [self setTitle:[NSString stringWithFormat:@"剩余%ld秒", self.count]
              forState:UIControlStateNormal];
        
        self.backgroundColor = _bgBeginColor;

        //      [self setTitle:[NSString stringWithFormat:@"剩余%ld秒", self.count] forState:UIControlStateDisabled];
    } else {

        self.enabled = YES;

        [self setTitle:self.titleEndStr
              forState:UIControlStateNormal];
        
        self.backgroundColor = self.bgEndColor;
        
        [self.timer invalidate];
    }
}
#pragma mark —— Set方法赋值
-(void)setTitleColor:(UIColor *)titleColor{
    
    _titleColor = titleColor;
    
    [self setTitleColor:_titleColor
               forState:UIControlStateNormal];
}

-(void)setBgBeginColor:(UIColor *)bgColor{
    
    _bgBeginColor = bgColor;
    
    self.backgroundColor = _bgBeginColor;
}

-(void)setLayerBorderColor:(UIColor *)layerBorderColor{
    
    _layerBorderColor = layerBorderColor;
    
    self.layer.borderColor = _layerBorderColor.CGColor;
}

-(void)setTitleLabelFont:(UIFont *)titleLabelFont{
    
    _titleLabelFont = titleLabelFont;
 
    self.titleLabel.font = _titleLabelFont;
}

-(void)setLayerCornerRadius:(CGFloat)layerCornerRadius{
    
    _layerCornerRadius = layerCornerRadius;
    
    self.layer.cornerRadius = _layerCornerRadius;
}

-(void)setLayerBorderWidth:(CGFloat)layerBorderWidth{
    
    _layerBorderWidth = layerBorderWidth;
    
    self.layer.borderWidth = _layerBorderWidth;
}

-(void)setIsClipsToBounds:(BOOL)isClipsToBounds{
    
    _isClipsToBounds = isClipsToBounds;
    
    self.clipsToBounds = _isClipsToBounds;
}

-(void)setTitleBeginStr:(NSString *)titleStr{
    
    _titleBeginStr = titleStr;
    
    [self setTitle:_titleBeginStr
          forState:UIControlStateNormal];
}

-(void)setTitleEndStr:(NSString *)titleEndStr{
    
    _titleEndStr = titleEndStr;
}

-(void)setBgEndColor:(UIColor *)bgEndColor{
    
    _bgEndColor = bgEndColor;
}

@end
