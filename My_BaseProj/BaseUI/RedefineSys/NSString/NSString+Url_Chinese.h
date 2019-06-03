//
//  NSString+Url_Chinese.h
//  ShengAi
//
//  Created by 刘赓 on 2018/11/25.
//  Copyright © 2018 刘赓. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  有时候我们加载的URL中可能会出现中文,需要我们手动进行转码,但是同时又要保证URL中的特殊字符保持不变,那么我们就可以使用下面的方法
 */
NS_ASSUME_NONNULL_BEGIN

@interface NSString (Url_Chinese)

- (NSURL *)Url_Chinese;

@end

NS_ASSUME_NONNULL_END
