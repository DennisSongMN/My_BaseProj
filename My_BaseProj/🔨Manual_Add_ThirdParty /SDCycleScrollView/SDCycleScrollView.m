//
//  SDCycleScrollView.m
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

#import "SDCycleScrollView.h"

#import "UIView+SDExtension.h"

#import "SDCycleScrollView+UICollectionViewDataSource.h"

#import "SDCycleScrollView+UIScrollViewDelegate.h"

@interface SDCycleScrollView ()

@end

@implementation SDCycleScrollView

-(instancetype)init{

    if (self = [super init]) {
        
    }

    return self;
}

// 设置显示图片的collectionView
- (void)setupMainView{
    
    if (!self.flowLayout) {
        
        self.flowLayout = [[UICollectionViewFlowLayout alloc] init];
    }
    
    self.flowLayout.itemSize = self.frame.size;
    
    self.flowLayout.minimumLineSpacing = 0;
    
    self.flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    if (!self.mainView) {
        
        self.mainView = [[UICollectionView alloc] initWithFrame:self.frame
                                           collectionViewLayout:self.flowLayout];
    }
    
    self.mainView.backgroundColor = [UIColor lightGrayColor];
    
    self.mainView.pagingEnabled = YES;
    
    self.mainView.showsHorizontalScrollIndicator = NO;
    
    self.mainView.showsVerticalScrollIndicator = NO;
    
    [self.mainView registerClass:[SDCollectionViewCell class] forCellWithReuseIdentifier:ReuseIdentifier];
    
    [self UICollectionViewDataSource];
    
    [self addSubview:self.mainView];
}

- (void)setImagesGroup:(NSMutableArray *)imagesGroup{
    
    _imagesGroup = imagesGroup;
    
    if (imagesGroup.count != 0) {
        
        _totalItemsCount = imagesGroup.count * 100;
    }

    [self setupTimer];
    
    [self setupPageControl];
}

- (void)setupPageControl{
    
    if (!self.pageControl) {
        
        self.pageControl = [[TAPageControl alloc] init];
    }

    self.pageControl.numberOfPages = self.imagesGroup.count;
    
    [self addSubview:self.pageControl];
}

- (void)automaticScroll{
    
    int currentIndex = _mainView.contentOffset.x / _flowLayout.itemSize.width;
    
    int targetIndex = currentIndex + 1;
    
    if (self.imagesGroup.count != 0) {
        
        if (targetIndex == _totalItemsCount) {
            
            targetIndex = _totalItemsCount * 0.5;
            
            [_mainView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:targetIndex inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
        }
        
        [_mainView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:targetIndex inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
    }
}

- (void)setupTimer{
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:self.autoScrollTimeInterval
                                              target:self
                                            selector:@selector(automaticScroll)
                                            userInfo:nil
                                             repeats:YES];
    
    [[NSRunLoop mainRunLoop] addTimer:_timer
                              forMode:NSRunLoopCommonModes];
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    _mainView.frame = self.bounds;
    
    if (_mainView.contentOffset.x == 0) {
        
        if (_totalItemsCount != 0) {
            
            [_mainView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:_totalItemsCount * 0.5 inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
        }

    }
    
    CGSize size = [_pageControl sizeForNumberOfPages:self.imagesGroup.count];
    
    CGFloat x = (self.sd_width - size.width) * 0.5;
    
    if (self.pageControlAliment == SDCycleScrollViewPageContolAlimentRight) {
        
        x = self.mainView.sd_width - size.width - 10;
    }
    
    CGFloat y = self.mainView.sd_height - size.height - 10;
    
    _pageControl.frame = CGRectMake(x, y, size.width, size.height);
    
    [_pageControl sizeToFit];
}

- (void)setFrame:(CGRect)frame{
    
    [super setFrame:frame];
    
    _flowLayout.itemSize = self.frame.size;
}

- (void)setAutoScrollTimeInterval:(CGFloat)autoScrollTimeInterval{
    
    _autoScrollTimeInterval = autoScrollTimeInterval;
    
    [_timer invalidate];
    
    _timer = nil;
    
    [self setupTimer];
}


@end
