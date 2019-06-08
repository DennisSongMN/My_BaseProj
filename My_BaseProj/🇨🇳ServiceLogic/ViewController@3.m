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
@property(nonatomic,strong)UIImageView *imgView;


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
    
    self.waterMark.frame = CGRectMake(100, 100, 200, 400);//先要给个frame
    
    self.waterMark.backgroundColor = kRedColor;

    self.imgView.frame = CGRectMake(100, 500, 300, 300);
    
    self.imgView.backgroundColor = kBlueColor;
    
    [self.view addSubview:self.imgView];
    
    self.imgView.image = [UIView getImageFromView:self.waterMark];
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

-(UIImageView *)imgView{
    
    if (!_imgView) {
        
        _imgView = UIImageView.new;
    }
    
    return _imgView;
}

@end
