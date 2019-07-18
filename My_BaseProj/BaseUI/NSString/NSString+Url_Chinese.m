//
//  NSString+Url_Chinese.m
//  ShengAi
//
//  Created by 刘赓 on 2018/11/25.
//  Copyright © 2018 刘赓. All rights reserved.
//

#import "NSString+Url_Chinese.h"

@implementation NSString (Url_Chinese)

- (NSURL *)Url_Chinese{
    
#pragma clang diagnostic push
    
#pragma clang diagnostic ignored"-Wdeprecated-declarations"
    
    return [NSURL URLWithString:(NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)self, (CFStringRef)@"!$&'()*+,-./:;=?@_~%#[]", NULL,kCFStringEncodingUTF8))];
    
#pragma clang diagnostic pop
    
}

@end
