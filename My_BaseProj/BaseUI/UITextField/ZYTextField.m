//
//  ZYTextField.m
//  gt
//
//  Created by Administrator on 09/05/2019.
//  Copyright © 2019 GT. All rights reserved.
//

#import "ZYTextField.h"

@implementation ZYTextField

//通过代码创建
- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        [self setUpUI];
    }
    return self;
}
//通过xib创建
-(void)awakeFromNib{
    
    [super awakeFromNib];
    
    [self setUpUI];
}

- (void)setUpUI{

    //字体大小
    self.font = [UIFont systemFontOfSize:15];
    //字体颜色
    self.textColor = RGBCOLOR(77, 150, 132);
    //光标颜色
    self.tintColor = self.textColor;
    //占位符的颜色和大小
    [self setValue:RGBCOLOR(167, 167, 167) forKeyPath:@"_placeholderLabel.textColor"];
    
    [self setValue:[UIFont boldSystemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
    // 不成为第一响应者
    [self resignFirstResponder];
}
/**
 * 当前文本框聚焦时就会调用
 */
- (BOOL)becomeFirstResponder{
    
    // 修改占位文字颜色
    [self setValue:self.textColor forKeyPath:@"_placeholderLabel.textColor"];
    
    return [super becomeFirstResponder];
}

/**
 * 当前文本框失去焦点时就会调用
 */
- (BOOL)resignFirstResponder{
    
    // 修改占位文字颜色
    [self setValue:[UIColor grayColor] forKeyPath:@"_placeholderLabel.textColor"];
    
    return [super resignFirstResponder];
}
//控制placeHolder的位置
-(CGRect)placeholderRectForBounds:(CGRect)bounds{
    
    CGRect inset = CGRectMake(bounds.origin.x+15, bounds.origin.y, bounds.size.width -15, bounds.size.height);
    
    return inset;
}

//控制显示文本的位置
-(CGRect)textRectForBounds:(CGRect)bounds{
    
    CGRect inset = CGRectMake(bounds.origin.x+15, bounds.origin.y, bounds.size.width -15, bounds.size.height);
    
    return inset;
}

//控制编辑文本的位置
-(CGRect)editingRectForBounds:(CGRect)bounds{
    
    CGRect inset = CGRectMake(bounds.origin.x +15, bounds.origin.y, bounds.size.width -15, bounds.size.height);
    
    return inset;
}

@end
