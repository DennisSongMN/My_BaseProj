//
//  SDCycleScrollView+UICollectionViewDataSource.h
//  JinXian Finance
//
//  Created by 刘赓 on 2017/7/14.
//  Copyright © 2017年 刘赓. All rights reserved.
//

#import "SDCycleScrollView.h"

NS_ASSUME_NONNULL_BEGIN

@interface SDCycleScrollView (UICollectionViewDataSource)<UICollectionViewDataSource, UICollectionViewDelegate>

-(void)UICollectionViewDataSource;

@end

NS_ASSUME_NONNULL_END
