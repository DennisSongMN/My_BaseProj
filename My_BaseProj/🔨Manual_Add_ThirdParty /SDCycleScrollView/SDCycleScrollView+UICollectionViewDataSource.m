//
//  SDCycleScrollView+UICollectionViewDataSource.m
//  JinXian Finance
//
//  Created by 刘赓 on 2017/7/14.
//  Copyright © 2017年 刘赓. All rights reserved.
//

#import "SDCycleScrollView+UICollectionViewDataSource.h"

@implementation SDCycleScrollView (UICollectionViewDataSource)

-(void)UICollectionViewDataSource{

    self.mainView.dataSource = self;
    
    self.mainView.delegate = self;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.totalItemsCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    self.cell = [collectionView dequeueReusableCellWithReuseIdentifier:ReuseIdentifier
                                                          forIndexPath:indexPath];
    
    NSInteger itemIndex = indexPath.item % self.imagesGroup.count;

    self.cell.imageView.image = self.imagesGroup[itemIndex];
    
    self.cell.title = self.titlesGroup[itemIndex];
    
    return self.cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([self.delegate respondsToSelector:@selector(cycleScrollView:didSelectItemAtIndex:)]) {
        
        [self.delegate cycleScrollView:self
                  didSelectItemAtIndex:indexPath.item % self.imagesGroup.count];
    }
}

@end
