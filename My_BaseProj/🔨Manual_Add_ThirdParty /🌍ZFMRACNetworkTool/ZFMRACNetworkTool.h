//
//  ZFMRACNetworkTool.h
//  ZFMRACNetwork
//
//  Created by todriver02 on 2018/8/1.
//  Copyright © 2018年 zhufaming. All rights reserved.
//

#ifndef ZFMRACNetworkTool_h
#define ZFMRACNetworkTool_h

#import "FMHttpConstant.h"
#import "FMHttpResonse.h"
#import "FMHttpRequest.h"
#import "FMARCNetwork.h"

#endif /* ZFMRACNetworkTool_h */

/* 使用示例:

- (void)test{
 
    /// 1. 配置参数
    NSMutableDictionary *easyDict = [NSMutableDictionary dictionary];
    /// 2. 配置参数模型 #define MH_GET_LIVE_ROOM_LIST  @"Room/GetHotLive_v2"
    FMHttpRequest *req = [FMHttpRequest urlParametersWithMethod:HTTTP_METHOD_POST path:@"Room/GetHotLive_v2" parameters:easyDict];
    
    
    _reqSignal = [[FMARCNetwork sharedInstance] requestNetworkData:req];
    
    [_reqSignal subscribeNext:^(FMHttpResonse *response) {
        
        if (response.isSuccess) {
            
            NSLog(@"%p",response.reqResult);
            
            NSLog(@"--%@",response.reqResult);
            
            NSData *jsonData = [NSJSONSerialization dataWithJSONObject:response.reqResult options:NSJSONWritingPrettyPrinted error:nil];
            
            NSString * str = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
            
            self.textV.text = str;
        }
        
    }];
}

*/
