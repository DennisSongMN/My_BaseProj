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

}


@end
