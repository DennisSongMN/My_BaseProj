//
//  SearchVC+VM.h
//  Feidegou
//
//  Created by Kite on 2019/11/23.
//  Copyright © 2019 朝花夕拾. All rights reserved.
//

#import "SearchVC.h"
#import "SearchModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SearchVC (VM)

-(void)networking_type:(NSString *)inputStr;//按输入的订单号搜索

@end

NS_ASSUME_NONNULL_END
