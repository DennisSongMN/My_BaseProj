//
//  SDCycleScrollView+UIScrollViewDelegate.m
//  JinXian Finance
//
//  Created by 刘赓 on 2017/7/14.
//  Copyright © 2017年 刘赓. All rights reserved.
//

#import "SDCycleScrollView+UIScrollViewDelegate.h"

#import "UIView+SDExtension.h"

@implementation SDCycleScrollView (UIScrollViewDelegate)

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    int itemIndex = (scrollView.contentOffset.x + self.mainView.sd_width * 0.5) / self.mainView.sd_width;
    
    int indexOnPageControl = itemIndex % self.imagesGroup.count;
    
    self.pageControl.currentPage = indexOnPageControl;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
    [self.timer invalidate];
    
    self.timer = Nil;
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    [self setupTimer];
}

@end
