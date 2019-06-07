//
//  ViewController@3.m
//  My_BaseProj
//
//  Created by Administrator on 04/06/2019.
//  Copyright © 2019 Administrator. All rights reserved.
//

#import "ViewController@3.h"
#import "WaterMark.h"

@interface ViewController_3 (){
    
}

@property(nonatomic,strong)WaterMark *waterMark;

@end

@implementation ViewController_3

-(void)viewDidLoad{
    
    self.view.backgroundColor = RandomColor;
    
    [self makeWaterMark];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES
                                             animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO
                                             animated:animated];
}

-(void)makeWaterMark{
    
    [self.view addSubview:self.waterMark];
    
//    self.waterMark.frame = CGRectMake(0, 0, MAINSCREEN_WIDTH * 2, MAINSCREEN_HEIGHT * 2);
    
    [self.waterMark mas_makeConstraints:^(MASConstraintMaker *make) {

        make.edges.equalTo(self.view);
    }];
    
//    self.waterMark.transform = CGAffineTransformMakeRotation(M_PI * -40/180);
}

-(WaterMark *)waterMark{
    
    if (!_waterMark) {
        
        _waterMark = [[WaterMark alloc]initWithLableWidth:50
                                              LableHeight:30
                                        LableOffset_level:10
                                     LableOffset_vertical:5];
        
        
    }
    
    return _waterMark;
}

@end
