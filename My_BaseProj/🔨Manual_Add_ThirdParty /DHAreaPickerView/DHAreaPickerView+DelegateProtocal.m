//
//  DHAreaPickerView+DelegateProtocal.m
//  ShengAi
//
//  Created by 刘赓 on 2018/11/7.
//  Copyright © 2018 刘赓. All rights reserved.
//

#import "DHAreaPickerView+DelegateProtocal.h"

@implementation DHAreaPickerView(DelegateProtocal)

-(void)DelegateProtocal{
    
    self.pickerView.delegate = self;
    
    self.pickerView.dataSource = self;
}

/**
 *  设置pickerView的列数
 *  @return pickerView的列数
 */
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 3;
}

/**
 *  设置每一列显示的行数
 *  @param component  列
 *  @return 每列的行数
 */
- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component{
    
    if (component == 0) {
        
        return self.provinceArray.count;
        
    }else if (component == 1){
        
        return self.cityArray.count;
        
    }else{
        
        return self.countryArray.count;
    }
}

/**
 *  设置每一列的宽度
 *  @param component  列
 *  @return 每列的宽度
 */
- (CGFloat)pickerView:(UIPickerView *)pickerView
    widthForComponent:(NSInteger)component{
    
    return MAINSCREEN_WIDTH / 3;
}

/**
 *  设置每一行的高度
 *  @param component  列
 *  @return 每一行的高度
 */
- (CGFloat)pickerView:(UIPickerView *)pickerView
rowHeightForComponent:(NSInteger)component{
    
    return 40;
}

/**
 *  设置每一行的title
 *  @param component  列
 *  @return 每一行的title
 */
- (nullable NSString *)pickerView:(UIPickerView *)pickerView
                      titleForRow:(NSInteger)row
                     forComponent:(NSInteger)component{
    
    if (component == 0) {
        
        return self.provinceArray[row].name;
        
    }else if (component == 1){
        
        return self.cityArray[row].name;
        
    }else{
        
        return self.countryArray[row].name;
    }
}

/**
 *  pickerView选中代理
 *  @param row        选中的row
 *  @param component  列
 */
- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component{
    
    if(component == 0){
        
        self.selectRow0 = row;
        self.selectRow1 = 0;
        self.selectRow2 = 0;
        
        self.provinceArray = (NSMutableArray <DHAreasProvinceModel *> *)self.areasModel.content;
        self.cityArray =  (NSMutableArray <DHAreasCityModel*>*)self.provinceArray[row].childList;
        self.countryArray = (NSMutableArray<DHAreasCountryModel*>*)self.cityArray[0].childList;
        
        [pickerView reloadComponent:1];
        [pickerView selectRow:0
                  inComponent:1
                     animated:YES];//默认选择row 0
        
        [pickerView reloadComponent:2];
        [pickerView selectRow:0
                  inComponent:2
                     animated:YES];
        
    }else if(component == 1){
        
        self.selectRow1 = row;
        self.selectRow2 = 0;
        
        self.countryArray = (NSMutableArray<DHAreasCountryModel*>*)self.cityArray[row].childList;
        
        [pickerView reloadComponent:2];
        [pickerView selectRow:0
                  inComponent:2
                     animated:YES];
        
    }else if(component == 2){
        
        self.selectRow2 = row;
    }
}

@end
