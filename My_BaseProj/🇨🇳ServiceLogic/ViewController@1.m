//
//  ViewController@1.m
//  My_BaseProj
//
//  Created by Administrator on 04/06/2019.
//  Copyright © 2019 Administrator. All rights reserved.
//

#import "ViewController@1.h"

@implementation ViewController_1

-(void)viewDidLoad{
    
    self.view.backgroundColor = RandomColor;
    
    
}

//实现 输入框 记录历史输入的数据
-(void)ddd{
    
//    https://kemchenj.github.io/2017-08-06/
    
    //登录成功保存用户名
    
    SetUserDefaultKeyWithObject(@"userName", @"");//增 改
    
//    DeleUserDefaultWithKey(@"userName");//删
    
//    GetUserDefaultWithKey(@"userName");//查
    
    UserDefaultSynchronize;
}

@end
