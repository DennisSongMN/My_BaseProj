//
//  NSData+Base64.m
//  Gurpartap Singh
//
//  Created by Gurpartap Singh on 06/05/12.
//  Copyright (c) 2012 Gurpartap Singh. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NSString;

NS_ASSUME_NONNULL_BEGIN

@interface NSData (Base64Additions)

+ (NSData *)base64DataFromString:(NSString *)string;

@end

NS_ASSUME_NONNULL_END
