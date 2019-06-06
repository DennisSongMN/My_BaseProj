//
//  HistoryDataListTBV.h
//  My_BaseProj
//
//  Created by Administrator on 05/06/2019.
//  Copyright © 2019 Administrator. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^deleteBlockinTBV)(id _Nullable data);

NS_ASSUME_NONNULL_BEGIN

@interface HistoryDataListTBV : UITableView

+(instancetype)initWithRequestParams:(id)requestParams;

-(void)deleteData:(deleteBlockinTBV)block;

@end

NS_ASSUME_NONNULL_END
