//
//  UIView+Extension.m
//  MJRefreshExample
//
//  Created by Aalto on 14-5-28.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "UIView+Extras.h"

static const void *leftLittleButtonEventBlockKey = &leftLittleButtonEventBlockKey;
static const void *leftButtonEventBlockKey = &leftButtonEventBlockKey;
static const void *rightButtonEventBlockKey = &rightButtonEventBlockKey;

@implementation UIView (Extras)
/*
 objc_AssociationPolicy参数使用的策略：
 OBJC_ASSOCIATION_ASSIGN;            //assign策略
 OBJC_ASSOCIATION_COPY_NONATOMIC;    //copy策略
 OBJC_ASSOCIATION_RETAIN_NONATOMIC;  // retain策略
 
 OBJC_ASSOCIATION_RETAIN;
 OBJC_ASSOCIATION_COPY;
 */

- (ActionBlock)leftLittleButtonEventBlock {
    return objc_getAssociatedObject(self, leftLittleButtonEventBlockKey);
}

- (void)setLeftLittleButtonEventBlock:(ActionBlock)leftLittleButtonEventBlock {
    objc_setAssociatedObject(self, leftLittleButtonEventBlockKey, leftLittleButtonEventBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (ActionBlock)leftButtonEventBlock {
    return objc_getAssociatedObject(self, leftButtonEventBlockKey);
}

- (void)setLeftButtonEventBlock:(ActionBlock)leftButtonEventBlock {
    objc_setAssociatedObject(self, leftButtonEventBlockKey, leftButtonEventBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (ActionBlock)rightButtonEventBlock {
    return objc_getAssociatedObject(self, rightButtonEventBlockKey);
}

- (void)setRightButtonEventBlock:(ActionBlock)rightButtonEventBlock {
    objc_setAssociatedObject(self, rightButtonEventBlockKey, rightButtonEventBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}
- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}
- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}
- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}
-(void)setRight:(CGFloat)right{
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}
- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGPoint)origin
{
    return self.frame.origin;
}

-(void)removeAllSubViews{
    for (UIView *view in [self subviews]) {
        [view removeFromSuperview];
    }
}

- (void)gradientLayerAboveView:(UIView*)view withShallowColor:(UIColor*)shallowC withDeepColor:(UIColor*)deepC isVerticalOrHorizontal:(BOOL)isVertical{
    CAGradientLayer *gradientLayer  = [CAGradientLayer layer];
    gradientLayer.frame = view.bounds;
    if (isVertical){
        gradientLayer.startPoint = CGPointMake(0, 0);
        gradientLayer.endPoint = CGPointMake(0, 1);
    }else{
        gradientLayer.startPoint = CGPointMake(0, .5);
        gradientLayer.endPoint = CGPointMake(1, .5);
    }
    gradientLayer.colors = @[(id)shallowC.CGColor, (id)deepC.CGColor];
    gradientLayer.locations = @[@(0.5f) ,@(1.0f)];
    [view.layer insertSublayer:gradientLayer atIndex:0];
    view.layer.masksToBounds = YES;
}

//runtime 底部功能键
- (void)loginRightButtonInSuperView:(UIView*)superView withTitle:(NSString*)title rightButtonEvent:(ActionBlock)rightButtonEventBlock{
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.tag = EnumActionTag1;
    [superView addSubview:leftButton];
    
    //    [leftButton setImage:[UIImage imageNamed:@"icon_back_white"] forState:UIControlStateNormal];
    [leftButton setTitle:title forState:UIControlStateNormal];
    leftButton.adjustsImageWhenHighlighted = YES;
    leftButton.titleLabel.font  = kFontSize(17);
    [leftButton setTitleColor:kWhiteColor forState:UIControlStateNormal] ;
    leftButton.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    leftButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    leftButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    [leftButton addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
    leftButton.frame = CGRectMake(MAINSCREEN_WIDTH-95, 0, MAINSCREEN_WIDTH/2, 54+2*36);
    //    [leftButton layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleLeft imageTitleSpace:9];
    self.rightButtonEventBlock = rightButtonEventBlock;
}
- (void)goBackButtonInSuperView:(UIView*)superView leftButtonEvent:(ActionBlock)leftButtonEventBlock{
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [superView addSubview:leftButton];
    
    [leftButton setImage:[UIImage imageNamed:@"Close"] forState:UIControlStateNormal];
    //    [leftButton setTitle:@"返回" forState:UIControlStateNormal];
    leftButton.adjustsImageWhenHighlighted = YES;
    leftButton.titleLabel.font  = kFontSize(17);
    [leftButton setTitleColor:kWhiteColor forState:UIControlStateNormal] ;
    leftButton.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    leftButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    leftButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    [leftButton addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
    float top = YBSystemTool.isIphoneX? -5: -20;
    leftButton.frame = CGRectMake(25, top, MAINSCREEN_WIDTH/2-25, 54+2*36);
    [leftButton layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleLeft imageTitleSpace:9];
    self.leftButtonEventBlock = leftButtonEventBlock;
}

- (void)regiestBackButtonInSuperView:(UIView*)superView leftButtonEvent:(ActionBlock)leftButtonEventBlock{
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [superView addSubview:leftButton];
    [leftButton setImage:[UIImage imageNamed:@"returnXir"] forState:UIControlStateNormal];
    leftButton.adjustsImageWhenHighlighted = YES;
    leftButton.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    leftButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    leftButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    [leftButton addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
    float top =  YBSystemTool.isIphoneX ? 40 : 25;
    leftButton.frame = CGRectMake(25, top, 50, 54);
    self.leftButtonEventBlock = leftButtonEventBlock;
}


-(void)goBackBlackButtonInSuperView:(UIView*)superView leftButtonEvent:(ActionBlock)leftButtonEventBlock{
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [superView addSubview:leftButton];
    
    [leftButton setImage:[UIImage imageNamed:@"icon_back_black"] forState:UIControlStateNormal];
    [leftButton setTitle:@"返回" forState:UIControlStateNormal];
    leftButton.adjustsImageWhenHighlighted = YES;
    leftButton.titleLabel.font  = kFontSize(17);
    [leftButton setTitleColor:kBlackColor forState:UIControlStateNormal];
    leftButton.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    leftButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    leftButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    [leftButton addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
    leftButton.frame = CGRectMake(25, 0, MAINSCREEN_WIDTH/2-25, 54+2*36);
    [leftButton layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleLeft imageTitleSpace:9];
    self.leftButtonEventBlock = leftButtonEventBlock;
}

- (void)goBackEmptyContentButtonInSuperView:(UIView*)superView leftButtonEvent:(ActionBlock)leftButtonEventBlock{
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [superView addSubview:leftButton];
    
    [leftButton setImage:[UIImage imageNamed:@"icon_back_black"] forState:UIControlStateNormal];
    [leftButton setTitle:@"" forState:UIControlStateNormal];
    leftButton.adjustsImageWhenHighlighted = YES;
    leftButton.titleLabel.font  = kFontSize(17);
    [leftButton setTitleColor:kBlackColor forState:UIControlStateNormal] ;
    leftButton.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    leftButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    leftButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    [leftButton addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
    leftButton.frame = CGRectMake(25, 0, MAINSCREEN_WIDTH/2-25, 54+2*36);
    [leftButton layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleLeft imageTitleSpace:9];
    self.leftButtonEventBlock = leftButtonEventBlock;
}

- (UIView*)setDataEmptyViewInSuperView:(UIView*)superView withTopMargin:(NSInteger)topMargin withCustomTitle:(NSString*)customTitle{// leftButtonEvent:(ActionBlock)leftButtonEventBlock
    UIView* view = [[UIView alloc]init];
    view.hidden = YES;
    view.userInteractionEnabled = YES;
    view.backgroundColor = kTableViewBackgroundColor;
    [superView addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(superView);
        //        make.leading.trailing.equalTo(superView).offset(0);
        //        make.centerY.mas_equalTo(superView);
        //        make.height.mas_equalTo(118);//保证列表下啦
        //        make.top.equalTo(superView.mas_top).offset(topMargin);
        //        make.bottom.equalTo(superView);
    }];
    
    UIButton* button0 = [UIButton buttonWithType:UIButtonTypeCustom];
    button0.adjustsImageWhenHighlighted = NO;
    button0.titleLabel.numberOfLines = 0;
    button0.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    button0.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [view addSubview:button0];
    //    button.backgroundColor = [UIColor redColor];
    [button0 mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.edges.mas_equalTo(view);
        
        
        make.height.mas_equalTo(200);
        make.top.equalTo(view.mas_top).offset(134);
        //        make.left.mas_equalTo(0);
        //        make.right.mas_equalTo(0);
        make.width.mas_equalTo(197);
        //        make.centerY.mas_equalTo(view);
        make.centerX.mas_equalTo(view);
    }];
    [button0 setAttributedTitle:[NSString attributedStringWithString:customTitle stringColor:HEXCOLOR(0x717171) stringFont:kFontSize(16) subString:@"" subStringColor:HEXCOLOR(0x4C7FFF) subStringFont:kFontSize(13)] forState:UIControlStateNormal];
    [button0 setImage:kIMG(@"icon_dataEmpty") forState:UIControlStateNormal];
    [button0 layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleTop imageTitleSpace:35];
    //    [button0 addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
    
    
    //    self.leftButtonEventBlock = leftButtonEventBlock;
    
    return view;
}

- (UIView*)setDataEmptyViewInSuperView:(UIView*)superView withTopMargin:(NSInteger)topMargin {// leftButtonEvent:(ActionBlock)leftButtonEventBlock
    UIView* view = [[UIView alloc]init];
    view.hidden = YES;
    view.userInteractionEnabled = YES;
    view.backgroundColor = kTableViewBackgroundColor;
    [superView addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.edges.equalTo(self);
        make.leading.bottom.trailing.equalTo(superView).offset(0);
        make.top.equalTo(superView.mas_top).offset(topMargin);
        //        make.centerY.mas_equalTo(superView);
        //        make.height.mas_equalTo(118);//保证列表下啦
        //        make.top.equalTo(superView.mas_top).offset(topMargin);
        //        make.bottom.equalTo(superView);
    }];
    
    UIButton* button0 = [UIButton buttonWithType:UIButtonTypeCustom];
    button0.adjustsImageWhenHighlighted = NO;
    button0.titleLabel.numberOfLines = 0;
    button0.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    button0.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [view addSubview:button0];
    //    button.backgroundColor = [UIColor redColor];
    [button0 mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.edges.mas_equalTo(view);
        
        
        make.height.mas_equalTo(200);
        make.top.equalTo(view.mas_top).offset(134);
        //        make.left.mas_equalTo(0);
        //        make.right.mas_equalTo(0);
        make.width.mas_equalTo(177);
        //        make.centerY.mas_equalTo(view);
        make.centerX.mas_equalTo(view);
    }];
    [button0 setAttributedTitle:[NSString attributedStringWithString:@"页面空空如也" stringColor:HEXCOLOR(0x717171) stringFont:kFontSize(16) subString:@"" subStringColor:HEXCOLOR(0x4C7FFF) subStringFont:kFontSize(13)] forState:UIControlStateNormal];
    [button0 setImage:kIMG(@"icon_dataEmpty") forState:UIControlStateNormal];
    [button0 layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleTop imageTitleSpace:35];
    //    [button0 addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
    
    
    //    self.leftButtonEventBlock = leftButtonEventBlock;
    
    return view;
}

- (UIView*)setServiceErrorViewInSuperView:(UIView*)superView leftButtonEvent:(ActionBlock)leftButtonEventBlock {
    UIView* view = [[UIView alloc]init];
    view.backgroundColor = kWhiteColor;
    view.hidden = YES;
    view.userInteractionEnabled = YES;
    view.backgroundColor = kTableViewBackgroundColor;
    [superView addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    
    UIButton* button0 = [UIButton buttonWithType:UIButtonTypeCustom];
    button0.adjustsImageWhenHighlighted = NO;
    button0.titleLabel.numberOfLines = 0;
    button0.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    button0.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [view addSubview:button0];
    //    button.backgroundColor = [UIColor redColor];
    [button0 mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.edges.mas_equalTo(view);
        
        
        make.height.mas_equalTo(200);
        make.top.equalTo(view.mas_top).offset(134);
        //        make.left.mas_equalTo(0);
        //        make.right.mas_equalTo(0);
        make.width.mas_equalTo(177);
        //        make.centerY.mas_equalTo(view);
        make.centerX.mas_equalTo(view);
    }];
    [button0 setAttributedTitle:[NSString attributedStringWithString:@"抱歉，服务器开小差了" stringColor:HEXCOLOR(0x717171) stringFont:kFontSize(16) subString:@"" subStringColor:HEXCOLOR(0x4C7FFF) subStringFont:kFontSize(13)] forState:UIControlStateNormal];
    [button0 setImage:kIMG(@"icon_serviceError") forState:UIControlStateNormal];
    [button0 layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleTop imageTitleSpace:35];
    [button0 addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.adjustsImageWhenHighlighted = NO;
    button.titleLabel.numberOfLines = 0;
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    button.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [view addSubview:button];
    
    button.titleLabel.font =
    [UIFont fontWithName:@"PingFangSC-Medium" size:15.0];//kFontSize(15);
    
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 6;
    button.layer.borderWidth = 1;
    button.layer.borderColor = HEXCOLOR(0x4c7fff).CGColor;
    button.backgroundColor = HEXCOLOR(0x4c7fff);
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.edges.mas_equalTo(view);
        
        
        make.height.mas_equalTo(40);
        make.top.equalTo(button0.mas_bottom).offset(72);
        //        make.left.mas_equalTo(0);
        //        make.right.mas_equalTo(0);
        make.width.mas_equalTo(191);
        //        make.centerY.mas_equalTo(view);
        make.centerX.mas_equalTo(view);
    }];
    [button setAttributedTitle:[NSString attributedStringWithString:@"点击重试" stringColor:HEXCOLOR(0xffffff) stringFont:kFontSize(16) subString:@"" subStringColor:HEXCOLOR(0x4C7FFF) subStringFont:kFontSize(13)] forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
    
    self.leftButtonEventBlock = leftButtonEventBlock;
    
    return view;
}

- (UIView*)setNetworkErrorViewInSuperView:(UIView*)superView leftButtonEvent:(ActionBlock)leftButtonEventBlock {
    UIView* view = [[UIView alloc]init];
    view.backgroundColor = kWhiteColor;
    view.hidden = YES;
    view.userInteractionEnabled = YES;
    view.backgroundColor = kTableViewBackgroundColor;
    [superView addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    
    UIButton* button0 = [UIButton buttonWithType:UIButtonTypeCustom];
    button0.adjustsImageWhenHighlighted = NO;
    button0.titleLabel.numberOfLines = 0;
    button0.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    button0.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [view addSubview:button0];
    //    button.backgroundColor = [UIColor redColor];
    [button0 mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.edges.mas_equalTo(view);
        
        
        make.height.mas_equalTo(200);
        make.top.equalTo(view.mas_top).offset(134);
        //        make.left.mas_equalTo(0);
        //        make.right.mas_equalTo(0);
        make.width.mas_equalTo(177);
        //        make.centerY.mas_equalTo(view);
        make.centerX.mas_equalTo(view);
    }];
    [button0 setAttributedTitle:[NSString attributedStringWithString:@"网络错误，请重试" stringColor:HEXCOLOR(0x717171) stringFont:kFontSize(16) subString:@"" subStringColor:HEXCOLOR(0x4C7FFF) subStringFont:kFontSize(13)] forState:UIControlStateNormal];
    [button0 setImage:kIMG(@"icon_networkError") forState:UIControlStateNormal];
    [button0 layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleTop imageTitleSpace:35];
    [button0 addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.adjustsImageWhenHighlighted = NO;
    button.titleLabel.numberOfLines = 0;
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    button.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [view addSubview:button];
    
    button.titleLabel.font =
    [UIFont fontWithName:@"PingFangSC-Medium" size:15.0];//kFontSize(15);
    
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 6;
    button.layer.borderWidth = 1;
    button.layer.borderColor = HEXCOLOR(0x4c7fff).CGColor;
    button.backgroundColor = HEXCOLOR(0x4c7fff);
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.edges.mas_equalTo(view);
        
        
        make.height.mas_equalTo(40);
        make.top.equalTo(button0.mas_bottom).offset(72);
        //        make.left.mas_equalTo(0);
        //        make.right.mas_equalTo(0);
        make.width.mas_equalTo(191);
        //        make.centerY.mas_equalTo(view);
        make.centerX.mas_equalTo(view);
    }];
    [button setAttributedTitle:[NSString attributedStringWithString:@"点击重试" stringColor:HEXCOLOR(0xffffff) stringFont:kFontSize(16) subString:@"" subStringColor:HEXCOLOR(0x4C7FFF) subStringFont:kFontSize(13)] forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
    
    self.leftButtonEventBlock = leftButtonEventBlock;
    
    return view;
}

- (void)bottomSingleButtonInSuperView:(UIView*)superView WithButtionTitles:(NSString*)btnTitle withBottomMargin:(NSInteger)bottomMargin isHidenLine:(BOOL)isHidenLine leftButtonEvent:(ActionBlock)leftButtonEventBlock {
    UIView* view = [[UIView alloc]init];
    view.backgroundColor = kWhiteColor;
    view.userInteractionEnabled = YES;
    [superView addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.equalTo(superView).offset(0);
        //        make.bottom.equalTo(superView.mas_bottom).offset([YBSystemTool isIphoneX]? -[YBFrameTool tabBarHeight]-bottomMargin:-bottomMargin);
        make.bottom.equalTo(superView.mas_bottom).offset(-bottomMargin);
        make.height.mas_equalTo(@48.5);
    }];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.adjustsImageWhenHighlighted = NO;
    button.tag =  EnumActionTag0;
    button.adjustsImageWhenHighlighted = NO;
    button.titleLabel.font =
    [UIFont fontWithName:@"PingFangSC-Medium" size:15.0];//kFontSize(15);
    
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 4;
    button.layer.borderWidth = 1;
    button.layer.borderColor = HEXCOLOR(0x4c7fff).CGColor;
    [button setTitle:btnTitle forState:UIControlStateNormal];
    [button setTitleColor:HEXCOLOR(0x333333) forState:UIControlStateNormal];
    button.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [button addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
    
    [view addSubview:button];
    
    //        [_fucBtns[i] layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleLeft imageTitleSpace:10];
    
    [button setBackgroundImage:[UIImage imageWithColor:HEXCOLOR(0x4c7fff)] forState:UIControlStateNormal];
    [button setTitleColor:HEXCOLOR(0xffffff) forState:UIControlStateNormal];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.top.equalTo(line1.mas_bottom).offset(3.5);
        make.leading.equalTo(@24);
        make.trailing.equalTo(@-24);
        make.bottom.equalTo(view.mas_bottom).offset(-3);
        
        make.height.mas_equalTo(@42);
    }];
    
    UIImageView* line1 = [[UIImageView alloc]init];
    line1.backgroundColor = HEXCOLOR(0xe6e6e6);
    line1.hidden = isHidenLine;
    [view addSubview:line1];
    [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.equalTo(view).offset(0);
        make.top.equalTo(button.mas_top).offset(-3);
        make.height.mas_equalTo(@.5);
    }];
    
    self.leftButtonEventBlock = leftButtonEventBlock;
}
- (void)bottomSingleButtonInSuperView:(UIView*)superView
                    WithButtionTitles:(NSString*)btnTitle
                      leftButtonEvent:(ActionBlock)leftButtonEventBlock {
    
    UIView* view = [[UIView alloc]init];
    view.backgroundColor = kWhiteColor;
    view.userInteractionEnabled = YES;
    [superView addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.equalTo(superView).offset(0);
        make.bottom.equalTo(superView.mas_bottom).offset([YBSystemTool isIphoneX]? -[YBFrameTool iphoneBottomHeight]:0);
        make.height.mas_equalTo(@48.5);
    }];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.adjustsImageWhenHighlighted = NO;
    button.tag =  EnumActionTag0;
    button.adjustsImageWhenHighlighted = NO;
    button.titleLabel.font =
    [UIFont fontWithName:@"PingFangSC-Medium" size:15.0];//kFontSize(15);
    
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 4;
    button.layer.borderWidth = 1;
    button.layer.borderColor = HEXCOLOR(0x4c7fff).CGColor;
    [button setTitle:btnTitle forState:UIControlStateNormal];
    [button setTitleColor:HEXCOLOR(0x333333) forState:UIControlStateNormal];
    button.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [button addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
    
    [view addSubview:button];
    
    //        [_fucBtns[i] layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleLeft imageTitleSpace:10];
    
    [button setBackgroundImage:[UIImage imageWithColor:HEXCOLOR(0x4c7fff)] forState:UIControlStateNormal];
    [button setTitleColor:HEXCOLOR(0xffffff) forState:UIControlStateNormal];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.top.equalTo(line1.mas_bottom).offset(3.5);
        make.leading.equalTo(@24);
        make.trailing.equalTo(@-24);
        make.bottom.equalTo(view.mas_bottom).offset(-3);
        
        make.height.mas_equalTo(@42);
    }];
    
    UIImageView* line1 = [[UIImageView alloc]init];
    line1.backgroundColor = HEXCOLOR(0xe6e6e6);
    [view addSubview:line1];
    [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.equalTo(view).offset(0);
        make.top.equalTo(button.mas_top).offset(-3);
        make.height.mas_equalTo(@.5);
    }];
    
    self.leftButtonEventBlock = leftButtonEventBlock;
}

- (void)bottomDoubleButtonInSuperView:(UIView*)superView WithButtionTitles:(NSArray*)btnTitles leftButtonEvent:(ActionBlock)leftButtonEventBlock rightButtonEvent:(ActionBlock)rightButtonEventBlock{
    UIView* view = [[UIView alloc]init];
    view.backgroundColor = kWhiteColor;
    view.userInteractionEnabled = YES;
    [superView addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.equalTo(superView).offset(0);
        make.bottom.equalTo(superView.mas_bottom).offset([YBSystemTool isIphoneX]? -[YBFrameTool tabBarHeight]:0);
        
        make.height.mas_equalTo(@48.5);
    }];
    NSMutableArray* funcBtns = [NSMutableArray array];
    
    NSArray* subtitleArray = btnTitles;
    for (int i = 0; i < subtitleArray.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.adjustsImageWhenHighlighted = NO;
        button.tag =  i;
        button.adjustsImageWhenHighlighted = NO;
        button.titleLabel.font =
        [UIFont fontWithName:@"PingFangSC-Medium" size:15.0];//kFontSize(15);
        
        button.layer.masksToBounds = YES;
        button.layer.cornerRadius = 4;
        button.layer.borderWidth = 1;
        button.layer.borderColor = HEXCOLOR(0x4c7fff).CGColor;
        [button setTitle:subtitleArray[i] forState:UIControlStateNormal];
        [button setTitleColor:HEXCOLOR(0x333333) forState:UIControlStateNormal];
        button.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        [button addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
        
        [view addSubview:button];
        [funcBtns addObject:button];
        //        [_fucBtns[i] layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleLeft imageTitleSpace:10];
    }
    UIButton* bt0 =funcBtns.firstObject;
    [bt0 setBackgroundImage:[UIImage imageWithColor:HEXCOLOR(0xffffff)] forState:UIControlStateNormal];
    [bt0 setTitleColor:HEXCOLOR(0x4c7fff) forState:UIControlStateNormal];
    
    
    
    UIButton* bt1 = funcBtns.lastObject;
    [bt1 setBackgroundImage:[UIImage imageWithColor:HEXCOLOR(0x4c7fff)] forState:UIControlStateNormal];
    [bt1 setTitleColor:HEXCOLOR(0xffffff) forState:UIControlStateNormal];
    
    [funcBtns mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:15 leadSpacing:16 tailSpacing:16];
    
    [funcBtns mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(view.mas_bottom).offset(-3);
        
        make.height.mas_equalTo(@42);
    }];
    
    UIImageView* line1 = [[UIImageView alloc]init];
    line1.backgroundColor = HEXCOLOR(0xe6e6e6);
    [view addSubview:line1];
    [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.equalTo(view).offset(0);
        make.top.equalTo(bt0.mas_top).offset(-3);
        make.height.mas_equalTo(@.5);
    }];
    
    self.leftButtonEventBlock = leftButtonEventBlock;
    self.rightButtonEventBlock = rightButtonEventBlock;
}
- (void)bottomDoubleButtonInSuperView:(UIView*)superView leftButtonEvent:(ActionBlock)leftButtonEventBlock rightButtonEvent:(ActionBlock)rightButtonEventBlock{
    UIView* view = [[UIView alloc]init];
    view.backgroundColor = kWhiteColor;
    view.userInteractionEnabled = YES;
    [superView addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.equalTo(superView).offset(0);
        make.bottom.equalTo(superView.mas_bottom).offset([YBSystemTool isIphoneX]? -[YBFrameTool tabBarHeight]:0);
        
        make.height.mas_equalTo(@48.5);
    }];
    NSMutableArray* funcBtns = [NSMutableArray array];
    
    NSArray* subtitleArray =@[@"取消",@"确定"];
    for (int i = 0; i < subtitleArray.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag =  i;
        button.adjustsImageWhenHighlighted = NO;
        button.titleLabel.font =
        [UIFont fontWithName:@"PingFangSC-Medium" size:15.0];//kFontSize(15);
        
        button.layer.masksToBounds = YES;
        button.layer.cornerRadius = 4;
        button.layer.borderWidth = 1;
        button.layer.borderColor = HEXCOLOR(0x4c7fff).CGColor;
        [button setTitle:subtitleArray[i] forState:UIControlStateNormal];
        [button setTitleColor:HEXCOLOR(0x333333) forState:UIControlStateNormal];
        button.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        [button addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
        
        [view addSubview:button];
        [funcBtns addObject:button];
        //        [_fucBtns[i] layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleLeft imageTitleSpace:10];
    }
    UIButton* bt0 =funcBtns.firstObject;
    [bt0 setBackgroundImage:[UIImage imageWithColor:HEXCOLOR(0xffffff)] forState:UIControlStateNormal];
    [bt0 setTitleColor:HEXCOLOR(0x4c7fff) forState:UIControlStateNormal];
    
    
    
    UIButton* bt1 = funcBtns.lastObject;
    [bt1 setBackgroundImage:[UIImage imageWithColor:HEXCOLOR(0x4c7fff)] forState:UIControlStateNormal];
    [bt1 setTitleColor:HEXCOLOR(0xffffff) forState:UIControlStateNormal];
    
    [funcBtns mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:15 leadSpacing:16 tailSpacing:16];
    
    [funcBtns mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(view.mas_bottom).offset(-3);
        make.height.mas_equalTo(@42);
    }];
    
    UIImageView* line1 = [[UIImageView alloc]init];
    line1.backgroundColor = HEXCOLOR(0xe6e6e6);
    [view addSubview:line1];
    [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.equalTo(view).offset(0);
        make.top.equalTo(bt0.mas_top).offset(-3);
        make.height.mas_equalTo(@.5);
    }];
    
    self.leftButtonEventBlock = leftButtonEventBlock;
    self.rightButtonEventBlock = rightButtonEventBlock;
}

- (void)bottomTripleButtonInSuperView:(UIView*)superView
                leftLittleButtonEvent:(ActionBlock)leftLittleButtonEventBlock
                      leftButtonEvent:(ActionBlock)leftButtonEventBlock
                     rightButtonEvent:(ActionBlock)rightButtonEventBlock{
    
    UIView* view = [[UIView alloc]init];
    view.backgroundColor = kWhiteColor;
    view.userInteractionEnabled = YES;
    [superView addSubview:view];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.leading.trailing.equalTo(superView).offset(0);
        
        make.bottom.equalTo(superView.mas_bottom).offset([YBSystemTool isIphoneX]? -[YBFrameTool iphoneBottomHeight]:0);
        
        //        make.bottom.equalTo(superView.mas_bottom);
        
        make.height.mas_equalTo(@48.5);
    }];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    button.tag =  EnumActionTag2;
    button.adjustsImageWhenHighlighted = NO;
    button.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:11.0];//kFontSize(15);
    [button setTitleColor:RGBCOLOR(76, 127, 255) forState:UIControlStateNormal];
    [button setTitle:@"联系买家" forState:UIControlStateNormal];
    [button setImage:kIMG(@"contactSellerXi") forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(@10);
        make.bottom.equalTo(view.mas_bottom).offset(-3);
        
        make.height.mas_equalTo(@48.5);
    }];
    [button layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleTop imageTitleSpace:0];
    
    //    UIView* verLine = [[UIView alloc]init];
    //    verLine.backgroundColor = HEXCOLOR(0x4c7fff);
    //    [view addSubview:verLine];
    //    [verLine mas_makeConstraints:^(MASConstraintMaker *make) {
    //        //        make.top.equalTo(line1.mas_bottom).offset(3.5);
    //    make.left.equalTo(view).offset(78.5);
    //        make.centerY.equalTo(button);
    //
    //        make.height.mas_equalTo(@20);
    //        make.width.mas_equalTo(@1);
    //    }];
    
    NSMutableArray* funcBtns = [NSMutableArray array];
    
    NSArray* subtitleArray =@[@"取消订单",@"已完成付款"];
    for (int i = 0; i < subtitleArray.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag =  i;
        button.adjustsImageWhenHighlighted = NO;
        button.titleLabel.font =
        [UIFont fontWithName:@"PingFangSC-Medium" size:15.0];//kFontSize(15);
        
        button.layer.masksToBounds = YES;
        button.layer.cornerRadius = 4;
        button.layer.borderWidth = 1;
        button.layer.borderColor = HEXCOLOR(0x4c7fff).CGColor;
        [button setTitle:subtitleArray[i] forState:UIControlStateNormal];
        [button setTitleColor:HEXCOLOR(0x333333) forState:UIControlStateNormal];
        button.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        [button addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
        
        [view addSubview:button];
        [funcBtns addObject:button];
        //        [_fucBtns[i] layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleLeft imageTitleSpace:10];
    }
    UIButton* bt0 =funcBtns.firstObject;
    [bt0 setBackgroundImage:[UIImage imageWithColor:HEXCOLOR(0xffffff)] forState:UIControlStateNormal];
    [bt0 setTitleColor:HEXCOLOR(0x4c7fff) forState:UIControlStateNormal];
    
    
    UIButton* bt1 = funcBtns.lastObject;
    [bt1 setBackgroundImage:[UIImage imageWithColor:HEXCOLOR(0x4c7fff)] forState:UIControlStateNormal];
    [bt1 setTitleColor:HEXCOLOR(0xffffff) forState:UIControlStateNormal];
    
    [funcBtns mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:15 leadSpacing:93 tailSpacing:16];
    
    [funcBtns mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(view.mas_bottom).offset(-3);
        make.height.mas_equalTo(@42);
    }];
    
    UIImageView* line1 = [[UIImageView alloc]init];
    line1.backgroundColor = HEXCOLOR(0xe6e6e6);
    [view addSubview:line1];
    [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.equalTo(view).offset(0);
        make.top.equalTo(bt0.mas_top).offset(-3);
        make.height.mas_equalTo(@.5);
    }];
    self.leftLittleButtonEventBlock = leftLittleButtonEventBlock;
    self.leftButtonEventBlock = leftButtonEventBlock;
    self.rightButtonEventBlock = rightButtonEventBlock;
}


- (void)clickItem:(UIButton*)button{
    if (button.tag == EnumActionTag0) {
        if (self.leftButtonEventBlock)
        {
            self.leftButtonEventBlock(button);
        }
    }else if (button.tag == EnumActionTag1){
        if (self.rightButtonEventBlock)
        {
            self.rightButtonEventBlock(button);
        }
    }
    else if (button.tag == EnumActionTag2){
        if (self.leftLittleButtonEventBlock)
        {
            self.leftLittleButtonEventBlock(button);
        }
    }
}

-(UIButton*)creatButtonWithTitle:(NSString *)title
              setTitleColor:(UIColor*)titleColor
                   setImage:(UIImage*)image
            backgroundColor:(UIColor*)backgroundColor
                    cornerRadius:(float)cornerRadius
                borderWidth:(float)borderWidth
                borderColor:(UIColor*)borderColor
                     action:(SEL)operationAction{
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    if (title) {
        [button setTitle:title forState:UIControlStateNormal];
    }
    if (titleColor) {
        [button setTitleColor:titleColor
                     forState:UIControlStateNormal];
    }
    if (image) {
        [button setImage:image forState:UIControlStateNormal];
    }
    button.titleLabel.font = kFontSize(15);
    if (cornerRadius && cornerRadius > 0.0) {
        button.layer.masksToBounds = YES;
        button.layer.cornerRadius = cornerRadius;
    }
    if (borderWidth && borderWidth > 0.0) {
        button.layer.masksToBounds = YES;
        button.layer.borderWidth = borderWidth;
    }
    if (borderColor) {
        button.layer.masksToBounds = YES;
        button.layer.borderColor = borderColor.CGColor;
    }
    if (backgroundColor) {
        button.backgroundColor = backgroundColor;
    }
    [button addTarget:self
               action:operationAction
     forControlEvents:UIControlEventTouchUpInside];
    return button;
}


- (void)setBorderWithView:(UIView *)view
              borderColor:(UIColor *)color
              borderWidth:(CGFloat)width
               borderType:(UIBorderSideType)borderType{
    /// 左
    if (borderType & UIBorderSideTypeLeft) {
        
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(0, 0, width, view.frame.size.height);
        layer.backgroundColor = color.CGColor;
        [view.layer addSublayer:layer];
    }
    /// 右
    if (borderType & UIBorderSideTypeRight){
        
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(view.frame.size.width - width, 0, width, view.frame.size.height);
        layer.backgroundColor = color.CGColor;
        [view.layer addSublayer:layer];
    }
    /// 上
    if (borderType & UIBorderSideTypeTop) {
        
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(0, 0, view.frame.size.width, width);
        layer.backgroundColor = color.CGColor;
        [view.layer addSublayer:layer];
    }
    /// 下
    if (borderType & UIBorderSideTypeBottom) {
        
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(0, view.frame.size.height - width, view.frame.size.width, width);
        layer.backgroundColor = color.CGColor;
        [view.layer addSublayer:layer];
    }
}


/**
 切角
 
 @param view TargetView
 @param cornerRadiusValue 切角参数
 */
+(void)cornerCutToCircleWithView:(UIView *)view
                 AndCornerRadius:(CGFloat)cornerRadiusValue{
    
    view.layer.cornerRadius = cornerRadiusValue;
    
    view.layer.masksToBounds = YES;
    
}

/**
 描边
 
 @param view TargetView
 @param colour 颜色
 @param WidthOfBorder 边线宽度
 */
+(void)colourToLayerOfView:(UIView *)view
                WithColour:(UIColor *)colour
            AndBorderWidth:(CGFloat)WidthOfBorder{
    
    view.layer.borderColor = colour.CGColor;
    
    view.layer.borderWidth = WidthOfBorder;
}


/**
 *  指定圆切角
 */
+(void)appointCornerCutToCircleWithTargetView:(UIView *)targetView
                         TargetCorner_TopLeft:(UIRectCorner)targetCorner_TopLeft
                        TargetCorner_TopRight:(UIRectCorner)targetCorner_TopRight
                      TargetCorner_BottomLeft:(UIRectCorner)targetCorner_BottomLeft
                     TargetCorner_BottomRight:(UIRectCorner)targetCorner_BottomRight{
    
    //设置切哪个直角
    //    UIRectCornerTopLeft     = 1 << 0,  左上角
    //    UIRectCornerTopRight    = 1 << 1,  右上角
    //    UIRectCornerBottomLeft  = 1 << 2,  左下角
    //    UIRectCornerBottomRight = 1 << 3,  右下角
    //    UIRectCornerAllCorners  = ~0UL     全部角
    
    //得到view的遮罩路径
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:targetView.bounds
                                                   byRoundingCorners:targetCorner_TopLeft | targetCorner_TopRight | targetCorner_BottomLeft | targetCorner_BottomRight
                                                         cornerRadii:CGSizeMake(10,10)];
    //创建 layer
    CAShapeLayer *maskLayer = [CAShapeLayer new];
    
    maskLayer.frame = targetView.bounds;
    
    //赋值
    maskLayer.path = maskPath.CGPath;
    
    targetView.layer.mask = maskLayer;
}


@end

