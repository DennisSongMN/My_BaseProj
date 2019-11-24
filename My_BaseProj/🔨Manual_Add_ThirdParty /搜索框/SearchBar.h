//
//  SearchBar.h
//  Feidegou
//
//  Created by Kite on 2019/11/24.
//  Copyright © 2019 朝花夕拾. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CJTextField.h"

NS_ASSUME_NONNULL_BEGIN

@interface SearchBar : UIView

@property(nonatomic,strong)CJTextField *textField;
@property(nonatomic,copy)NSString *placeholderStr;

-(void)actionBlock:(FourDataBlock)block;//在外部启动数据源 textField,self


@end

NS_ASSUME_NONNULL_END
