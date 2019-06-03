//
//  DHAreaPickerView+DelegateProtocal.h
//  ShengAi
//
//  Created by 刘赓 on 2018/11/7.
//  Copyright © 2018 刘赓. All rights reserved.
//

#import "DHAreaPickerView.h"

NS_ASSUME_NONNULL_BEGIN

@interface DHAreaPickerView (DelegateProtocal)<UIPickerViewDelegate,UIPickerViewDataSource>
/**
 *  设置pickerView的列数
 *  @return pickerView的列数
 */
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;

/**
 *  设置每一列显示的行数
 *  @param component  列
 *  @return 每列的行数
 */
- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component;

/**
 *  设置每一列的宽度
 *  @param component  列
 *  @return 每列的宽度
 */
- (CGFloat)pickerView:(UIPickerView *)pickerView
    widthForComponent:(NSInteger)component;

/**
 *  设置每一行的高度
 *  @param component  列
 *  @return 每一行的高度
 */
- (CGFloat)pickerView:(UIPickerView *)pickerView
rowHeightForComponent:(NSInteger)component;

/**
 *  设置每一行的title
 *  @param component  列
 *  @return 每一行的title
 */
- (nullable NSString *)pickerView:(UIPickerView *)pickerView
                      titleForRow:(NSInteger)row
                     forComponent:(NSInteger)component;

/**
 *  pickerView选中代理
 *  @param row        选中的row
 *  @param component  列
 */
- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component;

-(void)DelegateProtocal;

@end

NS_ASSUME_NONNULL_END
