//
//  UIScrollView+YBGeneral.m
//  Aa
//
//  Created by Aalto on 2018/11/20.
//  Copyright © 2018 Aalto. All rights reserved.
//

#import "UIScrollView+YBGeneral.h"

@implementation UIScrollView (YBGeneral)

- (void)YBGeneral_addRefreshHeader:(void (^)(void))blockH footer:(void (^)(void))blockF {
    kWeakSelf(self);
    [self YBGeneral_addRefreshHeader:^{
        if (blockH) blockH();
    } endRefresh:^{
        kStrongSelf(self);
        if (!self.mj_footer) {
            [self YBGeneral_addRefreshFooter:^{
                if (blockF) blockF();
            }];
        }
    }];
}

- (void)YBGeneral_addRefreshHeader:(void (^)(void))block {
    
    [self YBGeneral_addRefreshHeader:block
                          endRefresh:nil];
}

- (void)YBGeneral_addRefreshHeader:(void (^)(void))block
                        endRefresh:(void (^)(void))endRefresh {
    
    kWeakSelf(self);
    MJRefreshNormalHeader *refreshHeader = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        kStrongSelf(self);
        BOOL isRefresh = self.mj_footer.state == MJRefreshStateRefreshing ||
        self.mj_footer.state == MJRefreshStateWillRefresh ||
        self.mj_footer.state == MJRefreshStatePulling;
        
        if (isRefresh) {
            
            [self.mj_header endRefreshing];
            return;
        }
        if (block) block();
    }];
    [refreshHeader setEndRefreshingCompletionBlock:^{
        if (endRefresh) endRefresh();
    }];
    
    refreshHeader.lastUpdatedTimeLabel.hidden = YES;
    refreshHeader.stateLabel.font = [UIFont systemFontOfSize:12];
    refreshHeader.stateLabel.textColor = [UIColor lightGrayColor];
    
    self.mj_header = refreshHeader;
}

- (void)YBGeneral_addRefreshFooter:(void (^)(void))block {
    
    kWeakSelf(self);
    MJRefreshAutoNormalFooter *refreshFooter = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        kStrongSelf(self);
        BOOL isRefresh = self.mj_header.state == MJRefreshStateRefreshing || self.mj_header.state == MJRefreshStateWillRefresh || self.mj_header.state == MJRefreshStatePulling;
        if (isRefresh) {
            [self.mj_footer endRefreshing];
            return;
        }
        if (block) block();
    }];
    
    refreshFooter.automaticallyChangeAlpha = YES;
    refreshFooter.stateLabel.font = [UIFont systemFontOfSize:12];
    refreshFooter.stateLabel.textColor = [UIColor lightGrayColor];
    [refreshFooter setTitle:@"别扯了，已经到底了~" forState:MJRefreshStateNoMoreData];
    
    self.mj_footer = refreshFooter;
}

@end
