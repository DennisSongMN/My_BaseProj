//
//  DHAreaPickerView.m
//  AreaPickerView
//
//  Created by Harriet on 2018/7/9.
//  Copyright © 2018年 Harriet. All rights reserved.
//

#import "DHAreaPickerView.h"
#import "DHAreasModel.h"
#import "DHAreaPickerView+DelegateProtocal.h"

@interface DHAreaPickerView ()

@end

@implementation DHAreaPickerView

-(instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {

        self.removePickerTypeViewSignal = [RACSubject subject];

    }

    return self;
}

- (BOOL)canBecomeFirstResponder {

//    if ([self.delegate respondsToSelector:@selector(pickViewWillBecomeFirstResponder:)]) {
//
//        [self.delegate pickViewWillBecomeFirstResponder:self];
//    }

    return YES;
}

- (UIToolbar*)inputAccessoryView {
    
    if (!_inputAccessoryView){
        
        UIToolbar * toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, MAINSCREEN_WIDTH, 44)];
        
        UIBarButtonItem * leftItem = [[UIBarButtonItem alloc]initWithTitle:@"取消"
                                                                     style:UIBarButtonItemStyleDone
                                                                    target:self
                                                                    action:@selector(leftBtnResignFirstResponder)];
        leftItem.tintColor = [UIColor redColor];//设置取消按钮字体颜色
        //空白
        UIBarButtonItem *btn4 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                             target:self
                                                                             action:nil];
        
        UIBarButtonItem * rightItem = [[UIBarButtonItem alloc]initWithTitle:@"确定"
                                                                      style:UIBarButtonItemStyleDone
                                                                     target:self
                                                                     action:@selector(rightBtnResignFirstResponder)];
        rightItem.tintColor = [UIColor redColor];//设置确定按钮字体颜色
        toolBar.items = @[leftItem,btn4,rightItem];
        
        return toolBar;
    }
    
    return _inputAccessoryView;
}

- (UIPickerView *)inputView{
    
    if (!_inputView) {
        //初始化数据
        self.selectRow0 = 0;
        self.selectRow1 = 0;
        self.selectRow2 = 0;
        
        self.provinceArray = (NSMutableArray <DHAreasProvinceModel *>*)self.areasModel.content;
        self.cityArray = (NSMutableArray <DHAreasCityModel *> *)self.provinceArray[0].childList;
        self.countryArray = (NSMutableArray <DHAreasCountryModel *> *)self.cityArray[0].childList;
        
        self.pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, MAINSCREEN_HEIGHT, MAINSCREEN_WIDTH, 220)];

        [self DelegateProtocal];
        
        self.pickerView.backgroundColor = kWhiteColor;//设置pickerView的背景颜色
        
        return self.pickerView;
    }
    
    return _inputView;
}

//确认按钮点击事件
- (void)rightBtnResignFirstResponder{
    
    NSString *appendString = @"";
    
    NSString *provinceTitle = self.provinceArray[self.selectRow0].name;
    
    self.provinceId = self.provinceArray[self.selectRow0].privinceId;
    
    NSString *cityTitle = self.cityArray[self.selectRow1].name;
    
    self.cityId = self.cityArray[self.selectRow1].cityId;
    
    NSString *countryTitle = self.countryArray[self.selectRow2].name;
    
    self.countryId = self.countryArray[self.selectRow2].countryId;
    
    appendString = [NSString stringWithFormat:@"%@ %@ %@",provinceTitle,cityTitle,countryTitle];
    
    if ([self.delegate respondsToSelector:@selector(selectType:)]){
        
        [self.delegate selectType:appendString];
    }

    [self.removePickerTypeViewSignal sendNext:nil];
    
    [self endEditing:YES];
}

//取消按钮点击事件
- (void)leftBtnResignFirstResponder{
    
    [self.removePickerTypeViewSignal sendNext:nil];
    
    [self endEditing:YES];
}

#pragma mark ======== 懒加载======
- (NSMutableArray *)provinceArray{
    
    if (!_provinceArray) {
        
        _provinceArray = [NSMutableArray array];
    }
    
    return _provinceArray;
}

- (NSMutableArray *)cityArray{
    
    if (!_cityArray) {
        
        _cityArray = [NSMutableArray array];
    }
    
    return _cityArray;
}

- (NSMutableArray *)countryArray{
    
    if (!_countryArray) {
        
        _countryArray = [NSMutableArray array];
    }
    
    return _countryArray;
}

@end
