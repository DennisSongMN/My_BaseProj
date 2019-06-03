//
//  DHAreaPickerViewDelegate.h
//  ShengAi
//
//  Created by 刘赓 on 2018/11/8.
//  Copyright © 2018 刘赓. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DHAreaPickerView;

NS_ASSUME_NONNULL_BEGIN

@protocol DHAreaPickerViewDelegate <NSObject>

- (void)selectType:(NSString*)selectTitle;

- (void)pickViewWillBecomeFirstResponder:(DHAreaPickerView *)pickView;

@end

NS_ASSUME_NONNULL_END
