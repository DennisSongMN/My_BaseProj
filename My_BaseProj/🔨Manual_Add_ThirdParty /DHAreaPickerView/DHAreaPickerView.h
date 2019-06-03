//
//  DHAreaPickerView.h
//  AreaPickerView
//
//  Created by Harriet on 2018/7/9.
//  Copyright © 2018年 Harriet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DHAreasModel.h"

#import "DHAreaPickerViewDelegate.h"

@interface DHAreaPickerView : UIButton

@property (nonatomic, weak) id<DHAreaPickerViewDelegate> delegate;
@property (nonatomic, strong) DHAreasModel *areasModel;
@property (nonatomic,strong,readwrite) __kindof UIView *inputView;
@property (nonatomic,strong,readwrite) __kindof UIView *inputAccessoryView;
@property (nonatomic,strong,readwrite) __kindof UIPickerView *pickerView;//此控件高度是只读,若要修改此高度,需要修改此CALayer

@property (nonatomic, copy) NSString *provinceId;
@property (nonatomic, copy) NSString *cityId;
@property (nonatomic, copy) NSString *countryId;

@property (nonatomic, strong) NSMutableArray <DHAreasProvinceModel *>*provinceArray;
@property (nonatomic, strong) NSMutableArray <DHAreasCityModel *>*cityArray;
@property (nonatomic, strong) NSMutableArray<DHAreasCountryModel *> *countryArray;

@property (nonatomic, assign) NSInteger selectRow0;
@property (nonatomic, assign) NSInteger selectRow1;
@property (nonatomic, assign) NSInteger selectRow2;

@property(nonatomic,strong)RACSubject *removePickerTypeViewSignal;

@end
