//
//  UILabel+TextAlign.h
//  ShengAi
//
//  Created by 刘赓 on 2018/11/5.
//  Copyright © 2018 刘赓. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  UILabel文字的调整
 *  实现：利用往文字后面活前面下面添加”\n”来实现文字填充满整个UILable控件实现置顶/置顶效果
 */
NS_ASSUME_NONNULL_BEGIN

@interface UILabel (TextAlign)

@property (nonatomic, assign) BOOL isTop;

@property (nonatomic, assign) BOOL isBottom;


@end

NS_ASSUME_NONNULL_END
