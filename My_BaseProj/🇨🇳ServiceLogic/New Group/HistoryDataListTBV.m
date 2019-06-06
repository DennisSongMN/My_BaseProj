//
//  HistoryDataListTBV.m
//  My_BaseProj
//
//  Created by Administrator on 05/06/2019.
//  Copyright © 2019 Administrator. All rights reserved.
//

#import "HistoryDataListTBV.h"
#import "HistoryDataListTBVCell.h"

@interface HistoryDataListTBV ()<UITableViewDelegate,UITableViewDataSource>{
}

@property(nonatomic,strong)NSArray *dataArr;
@property(nonatomic,copy)deleteBlockinTBV block;

@end

@implementation HistoryDataListTBV

- (void)dealloc {
    
    NSLog(@"Running self.class = %@;NSStringFromSelector(_cmd) = '%@';__FUNCTION__ = %s", self.class, NSStringFromSelector(_cmd),__FUNCTION__);
}

+(instancetype)initWithRequestParams:(id)requestParams{
    
    HistoryDataListTBV *tbv = [[HistoryDataListTBV alloc]initWithFrame:CGRectZero
                                                                 style:UITableViewStylePlain];
    
    if ([requestParams isKindOfClass:[NSArray class]]) {
        
        tbv.dataArr = requestParams;
    }
    
    return tbv;
}

-(instancetype)initWithFrame:(CGRect)frame
                       style:(UITableViewStyle)style{
    
    if (self = [super initWithFrame:frame
                              style:style]) {
        
        self.delegate = self;
        
        self.dataSource = self;
    }
    
    return self;
}

-(void)deleteData:(deleteBlockinTBV)block{
    
    self.block = block;
}

#pragma mark —— UITableViewDelegate,UITableViewDataSource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return [HistoryDataListTBVCell cellHeightWithModel:NULL];;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HistoryDataListTBVCell *cell = [HistoryDataListTBVCell cellWith:tableView];
    
    [cell richElementsInCellWithModel:self.dataArr[indexPath.row]];
    
    kWeakSelf(self);
    
    [cell deleteData:^(id data) {
        
        kStrongSelf(self);
        
        if (self.block) {
            
            self.block(data);
        } 
    }];
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}


@end
