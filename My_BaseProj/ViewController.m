//
//  ViewController.m
//  My_BaseProj
//
//  Created by Administrator on 03/06/2019.
//  Copyright © 2019 Administrator. All rights reserved.
//

#import "ViewController.h"
#import "ZYTextField.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)dealloc {
    
    NSLog(@"Running self.class = %@;NSStringFromSelector(_cmd) = '%@';__FUNCTION__ = %s", self.class, NSStringFromSelector(_cmd),__FUNCTION__);
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
//    UITextField *tf = [[UITextField alloc]initWithFrame:CGRectMake(100, 100, 400, 100)];
//
//    tf.placeholder = @"12345";
//
//    [self.view addSubview:tf];
    
    ZYTextField *tf = [[ZYTextField alloc]initWithFrame:CGRectMake(100, 100, 400, 100)];

//    tf.textColor = kClearColor;

    tf.placeholder = @"12345";

    [self.view addSubview:tf];

}


@end
