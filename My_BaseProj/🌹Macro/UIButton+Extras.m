//
//  UIButton+DragButton.m
//  SegmentController
//
//  Created by mamawang on 14-6-23.
//  Copyright (c) 2014年 Aalto. All rights reserved.
//

#import "UIButton+Extras.h"
#import <objc/runtime.h>
//#define PADDING     5
//static void *DragEnableKey = &DragEnableKey;
//static void *AdsorbEnableKey = &AdsorbEnableKey;
@implementation UIButton (Extras)

#pragma mark - DragButton
//-(void)setDragEnable:(BOOL)dragEnable
//{
//    objc_setAssociatedObject(self, DragEnableKey,@(dragEnable), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//}
//
//-(BOOL)isDragEnable
//{
//    return [objc_getAssociatedObject(self, DragEnableKey) boolValue];
//}
//
//-(void)setAdsorbEnable:(BOOL)adsorbEnable
//{
//    objc_setAssociatedObject(self, AdsorbEnableKey,@(adsorbEnable), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//}
//
//-(BOOL)isAdsorbEnable
//{
//    return [objc_getAssociatedObject(self, AdsorbEnableKey) boolValue];
//}
//
//CGPoint beginPoint;
//
//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    self.highlighted = YES;
//    if (![objc_getAssociatedObject(self, DragEnableKey) boolValue]) {
//        return;
//    }
//
//    UITouch *touch = [touches anyObject];
//
//    beginPoint = [touch locationInView:self];
//}
//
//
//- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    self.highlighted = NO;
//    if (![objc_getAssociatedObject(self, DragEnableKey) boolValue]) {
//        return;
//    }
//
//    UITouch *touch = [touches anyObject];
//
//    CGPoint nowPoint = [touch locationInView:self];
//
//    float offsetX = nowPoint.x - beginPoint.x;
//    float offsetY = nowPoint.y - beginPoint.y;
//
//    self.center = CGPointMake(self.center.x + offsetX, self.center.y + offsetY);
//}
//
//-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    if (self.highlighted) {
//        [self sendActionsForControlEvents:UIControlEventTouchUpInside];
//        self.highlighted = NO;
//    }
//
//    if (self.superview && [objc_getAssociatedObject(self,AdsorbEnableKey) boolValue] ) {
//        float marginLeft = self.frame.origin.x;
//        float marginRight = self.superview.frame.size.width - self.frame.origin.x - self.frame.size.width;
//        float marginTop = self.frame.origin.y;
//        float marginBottom = self.superview.frame.size.height - self.frame.origin.y - self.frame.size.height;
//        [UIView animateWithDuration:0.125 animations:^(void){
//            if (marginTop<60) {
//                self.frame = CGRectMake(marginLeft<marginRight?marginLeft<PADDING?PADDING:self.frame.origin.x:marginRight<PADDING?self.superview.frame.size.width -self.frame.size.width-PADDING:self.frame.origin.x,
//                                        PADDING,
//                                        self.frame.size.width,
//                                        self.frame.size.height);
//            }
//            else if (marginBottom<60) {
//                self.frame = CGRectMake(marginLeft<marginRight?marginLeft<PADDING?PADDING:self.frame.origin.x:marginRight<PADDING?self.superview.frame.size.width -self.frame.size.width-PADDING:self.frame.origin.x,
//                                        self.superview.frame.size.height - self.frame.size.height-PADDING,
//                                        self.frame.size.width,
//                                        self.frame.size.height);
//
//            }
//            else {
//                self.frame = CGRectMake(marginLeft<marginRight?PADDING:self.superview.frame.size.width - self.frame.size.width-PADDING,
//                                        self.frame.origin.y,
//                                        self.frame.size.width,
//                                        self.frame.size.height);
//            }
//        }];
//
//    }
//}


+ (UIButton*)customButton:(id)target actionMethod:(SEL)actionMethod
                    Image:(UIImage *)image
                    Title:(NSString *)title
               TitleColor:(UIColor*)color{
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setFrame:CGRectMake(0, 0, 54, 54)];
    [leftButton setImage:image forState:UIControlStateNormal];
    [leftButton setTitle:title forState:UIControlStateNormal];
    
    leftButton.titleLabel.font  = kFontSize(17);
    [leftButton setTitleColor:color forState:UIControlStateNormal] ;
    leftButton.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    leftButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    leftButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    [leftButton addTarget:target action:actionMethod forControlEvents:UIControlEventTouchUpInside];
    
    return leftButton;
}
#pragma mark -UIButton 中image 和 title位置
- (void)layoutButtonWithEdgeInsetsStyle:(MKButtonEdgeInsetsStyle)style
                        imageTitleSpace:(CGFloat)space
{
    //    self.backgroundColor = [UIColor cyanColor];
    
    /**
     *  前置知识点：titleEdgeInsets是title相对于其上下左右的inset，跟tableView的contentInset是类似的，
     *  如果只有title，那它上下左右都是相对于button的，image也是一样；
     *  如果同时有image和label，那这时候image的上左下是相对于button，右边是相对于label的；title的上右下是相对于button，左边是相对于image的。
     */
    
    
    // 1. 得到imageView和titleLabel的宽、高
    CGFloat imageWith = self.imageView.frame.size.width;
    CGFloat imageHeight = self.imageView.frame.size.height;
    
    CGFloat labelWidth = 0.0;
    CGFloat labelHeight = 0.0;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
        // 由于iOS8中titleLabel的size为0，用下面的这种设置
        labelWidth = self.titleLabel.intrinsicContentSize.width;
        labelHeight = self.titleLabel.intrinsicContentSize.height;
    } else {
        labelWidth = self.titleLabel.frame.size.width;
        labelHeight = self.titleLabel.frame.size.height;
    }
    
    // 2. 声明全局的imageEdgeInsets和labelEdgeInsets
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;
    
    // 3. 根据style和space得到imageEdgeInsets和labelEdgeInsets的值
    switch (style) {
        case MKButtonEdgeInsetsStyleTopNoSelected3charctors://ch left
        {
            imageEdgeInsets = UIEdgeInsetsMake(-labelHeight-space/2.0, 0, 0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith-3, -imageHeight-space/2.0, 0);
        }
            break;
        case MKButtonEdgeInsetsStyleTop:
        {
            imageEdgeInsets = UIEdgeInsetsMake(-labelHeight-space/2.0, 0, 0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith-0, -imageHeight-space/2.0, 0);
        }
            break;
        case MKButtonEdgeInsetsStyleLeft:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, -space/2.0, 0, space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, space/2.0, 0, -space/2.0);
        }
            break;
        case MKButtonEdgeInsetsStyleBottom:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, 0, -labelHeight-space/2.0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(-imageHeight-space/2.0, -imageWith, 0, 0);
        }
            break;
        case MKButtonEdgeInsetsStyleRight:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth+space/2.0, 0, -labelWidth-space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith-space/2.0, 0, imageWith+space/2.0);
        }
            break;
        default:
            break;
    }
    
    // 4. 赋值
    self.titleEdgeInsets = labelEdgeInsets;
    self.imageEdgeInsets = imageEdgeInsets;
}

//- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent*)event
//{
//    CGRect bounds = self.bounds;
//    //若原热区小于44x44，则放大热区，否则保持原大小不变
//    CGFloat widthDelta = MAX(44.0 - bounds.size.width, 0);
//    CGFloat heightDelta = MAX(44.0 - bounds.size.height, 0);
//    bounds = CGRectInset(bounds, -0.5 * widthDelta, -0.5 * heightDelta);
//    return CGRectContainsPoint(bounds, point);
//}
@end
