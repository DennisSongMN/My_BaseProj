//
//  SDCycleScrollView.h
//  SDCycleScrollView
//
//  Created by aier on 15-3-22.
//  Copyright (c) 2015年 GSD. All rights reserved.
//

/**
 
 *******************************************************
 *                                                      *
 * 感谢您的支持， 如果下载的代码在使用过程中出现BUG或者其他问题    *
 * 您可以发邮件到gsdios@126.com 或者 到                       *
 * https://github.com/gsdios?tab=repositories 提交问题     *
 *                                                      *
 *******************************************************
 
 */

#import <UIKit/UIKit.h>

#import "SDCollectionViewCell.h"

#import "TAPageControl.h"

typedef enum {
    
    SDCycleScrollViewPageContolAlimentRight,
    
    SDCycleScrollViewPageContolAlimentCenter
    
} SDCycleScrollViewPageContolAliment;

@class SDCycleScrollView;

@protocol SDCycleScrollViewDelegate <NSObject>

- (void)cycleScrollView:(SDCycleScrollView *_Null_unspecified)cycleScrollView
   didSelectItemAtIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_BEGIN

@interface SDCycleScrollView : UIView

@property(nonatomic,assign)CGFloat autoScrollTimeInterval;

@property(nonatomic,assign)SDCycleScrollViewPageContolAliment pageControlAliment;

@property(nonatomic,weak)id<SDCycleScrollViewDelegate> delegate;

@property(nonatomic,assign)NSInteger totalItemsCount;

@property(nonatomic,strong)UICollectionView *mainView; //显示图片的collectionView

@property(nonatomic,strong)TAPageControl *pageControl;

@property(nonatomic,strong,nullable)NSTimer *timer;

@property(nonatomic,strong)UICollectionViewFlowLayout *flowLayout;

@property(nonatomic,strong)SDCollectionViewCell *cell;

#pragma mark —— data

@property(nonatomic,strong)NSMutableArray *imagesGroup;

@property(nonatomic,strong)NSMutableArray *titlesGroup;

- (void)setupTimer;

- (void)setupMainView;

@end

NS_ASSUME_NONNULL_END
