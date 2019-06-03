//
//  YBFrameTool.m
//  Aa
//
//  Created by Aalto on 2018/11/19.
//  Copyright © 2018 Aalto. All rights reserved.
//

#import "YBFrameTool.h"
#import "YBSystemTool.h"

@implementation YBFrameTool

+ (CGFloat)iphoneBottomHeight {
    return YBSystemTool.isIphoneX ? 34.0 : 0.0;
}

+ (CGFloat)tabBarHeight {
    return [self iphoneBottomHeight] + 49.0;
}

+ (CGFloat)statusBarHeight {
    return YBSystemTool.isIphoneX ? 44.0 : 20.0;
}

+ (CGFloat)navigationBarHeight {
    return YBSystemTool.isIphoneX ? 88.0 : 44.0;
}
+ (CGFloat)getNavigationHeight {
    return YBSystemTool.isIphoneX ? 88.0 : 64.0;
}

@end
