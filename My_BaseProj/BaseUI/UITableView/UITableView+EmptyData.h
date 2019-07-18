//
//  UITableView+EmptyData.h
//  ShengAi
//
//  Created by 刘赓 on 2018/12/3.
//  Copyright © 2018 刘赓. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
    UITableView 无数据时，显示“暂无数据”背景的实现
 */
NS_ASSUME_NONNULL_BEGIN

@interface UITableView (EmptyData)

- (void) tableViewDisplayWitMsg:(NSString *) message
         ifNecessaryForRowCount:(NSUInteger) rowCount;

@end

NS_ASSUME_NONNULL_END
