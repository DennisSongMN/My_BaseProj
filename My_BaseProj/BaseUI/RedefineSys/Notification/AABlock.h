//
//  AABlock.h

//
//  Created by Aalto on 2018/10/27.
//  Copyright © 2018年 NickJackson. All rights reserved.
//


typedef void (^ActionBlock)(id data);
typedef void (^DataBlock)(id data);

typedef void (^TwoDataBlock)(id data,id data2);

typedef void (^DataTypeBlock)(NSInteger types,id data);

typedef void (^TableViewDataBlock)(id data,id data2,UIView* view,UITableView* tableView,NSMutableArray *dataSource,NSIndexPath* indexPath);
typedef void (^ThreeDataBlock)(id data,id data2,id data3);
typedef void (^EightDataBlock)(id data,id data2,id data3,id data4,id data5,id data6,id data7,id data8);
typedef void (^DataActionBlock)(id data, BOOL action);

typedef void (^TypeBlock)(NSInteger type);
typedef void (^IntegerBlock)(NSInteger type);


typedef void (^NoResultBlock)(void);
typedef void (^KeyboardBlock)(id view);

typedef void (^CheckBlock)(BOOL finish, NSInteger errorType);

typedef void (^RequestResultBlock)(id object, NSError *error);


typedef void (^FilmDetailBlock)(id data,BOOL failFlag);

typedef void (^GoodsDeleteBlock)(NSInteger section);

typedef void (^CountDownBlock)(NSTimer *timer, NSTimeInterval remindTime, NSString *tip);


