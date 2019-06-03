//
//  UITableView+YBGeneral.m
//  Aa
//
//  Created by Aalto on 2018/11/20.
//  Copyright © 2018 Aalto. All rights reserved.
//

#import "UITableView+YBGeneral.h"
#import "YBGeneralColor.h"

@implementation UITableView (YBGeneral)

- (void)YBGeneral_configuration {
    self.estimatedRowHeight = 44;
    self.estimatedSectionFooterHeight = 0;
    self.estimatedSectionHeaderHeight = 0;
    
    self.separatorInset = UIEdgeInsetsMake(0, 15, 0, 0);
    [self setSeparatorColor:YBGeneralColor.seperaterColor];
    
    if (@available(iOS 11.0, *)) {
        self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
}

@end
