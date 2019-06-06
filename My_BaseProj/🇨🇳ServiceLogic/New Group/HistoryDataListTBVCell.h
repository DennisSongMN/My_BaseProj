//
//  HistoryDataListTBVCell.h
//  My_BaseProj
//
//  Created by Administrator on 05/06/2019.
//  Copyright © 2019 Administrator. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^deleteBlockinCell)(id _Nullable data);

NS_ASSUME_NONNULL_BEGIN

@interface HistoryDataListTBVCell : UITableViewCell

+(instancetype)cellWith:(UITableView *)tableView;
+(CGFloat)cellHeightWithModel:(id _Nullable)model;
- (void)richElementsInCellWithModel:(id _Nullable)model;
-(void)deleteData:(deleteBlockinCell)block;


@end

NS_ASSUME_NONNULL_END
