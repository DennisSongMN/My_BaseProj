//
//  UIButton+DragButton.h
//  SegmentController
//
//  Created by mamawang on 14-6-23.
//  Copyright (c) 2014年 Aalto. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, MKButtonEdgeInsetsStyle) {
    MKButtonEdgeInsetsStyleTopNoSelected3charctors,
    MKButtonEdgeInsetsStyleTop, // image在上，label在下
    MKButtonEdgeInsetsStyleLeft, // image在左，label在右
    MKButtonEdgeInsetsStyleBottom, // image在下，label在上
    MKButtonEdgeInsetsStyleRight // image在右，label在左
};
@interface UIButton (Extras)

/**
 *  设置button的titleLabel和imageView的布局样式，及间距
 *
 *  @param style titleLabel和imageView的布局样式
 *  @param space titleLabel和imageView的间距
 */
- (void)layoutButtonWithEdgeInsetsStyle:(MKButtonEdgeInsetsStyle)style
                        imageTitleSpace:(CGFloat)space;
+ (UIButton*)customButton:(id)target actionMethod:(SEL)actionMethod Image:(UIImage *)image Title:(NSString *)title TitleColor:(UIColor*)color;
//- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent*)event;
//@property(nonatomic,assign,getter = isDragEnable)   BOOL dragEnable;
//@property(nonatomic,assign,getter = isAdsorbEnable) BOOL adsorbEnable;
@end
