//
//  WJItemsControlView.h
//  SliderSegment
//
//  Created by silver on 15/11/3.
//  Copyright (c) 2015年 Fsilver. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark ======== WJItemsConfig ======

typedef NS_ENUM(NSInteger, WJItemsControlViewType) {
    
    XZBtnType_Standard,//标准
    
    XZBtnType_Button//按钮
};

@interface WJItemsConfig : NSObject

@property(nonatomic,assign)float itemWidth;        //default is 0

@property(nonatomic,strong)UIFont *itemFont;       //default is 16

@property(nonatomic,strong)UIColor *textColor;     //default is COLOR_Gray_Dark

@property(nonatomic,strong)UIColor *selectedColor; //default is COLOR_Green

@property(nonatomic,strong)UIColor *backGroundColor_normal;

@property(nonatomic,strong)UIColor *backGroundColor_selected;

@property(nonatomic,assign)float linePercent;  //default is 0.8

@property(nonatomic,assign)float lineHieght;   //default is 2.5

@property(nonatomic,assign)WJItemsControlViewType  type;

@end


typedef void (^WJItemsControlViewTapBlock)(NSInteger index,BOOL animation);

#pragma mark ======== WJItemsControlView ======
@interface WJItemsControlView : UIScrollView

@property(nonatomic,strong)WJItemsConfig *config;

@property(nonatomic,strong)NSArray *titleArray;

@property(nonatomic,assign)BOOL tapAnimation;//default is YES;

@property(nonatomic,readonly)NSInteger currentIndex;

@property(nonatomic,copy)WJItemsControlViewTapBlock tapItemWithIndex;

@property(nonatomic,strong)UIView *line;

@property(nonatomic,strong)NSMutableArray *btnMutArr;

-(void)moveToIndex:(float)index; //called in scrollViewDidScroll
/*
 首次出现，需要高亮显示第二个元素,scroll: 是外部关联的scroll
 [self endMoveToIndex:2];
 [scroll scrollRectToVisible:CGRectMake(2*w, 0.0, w,h) animated:NO];
 */
-(void)endMoveToIndex:(float)index;  //called in scrollViewDidEndDecelerating

- (void)clickBtnWithIndex:(NSInteger)index;

@end
