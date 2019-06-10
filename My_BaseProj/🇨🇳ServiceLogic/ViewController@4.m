//
//  ViewController@4.m
//  My_BaseProj
//
//  Created by Administrator on 04/06/2019.
//  Copyright © 2019 Administrator. All rights reserved.
//

#import "ViewController@4.h"
#import "ArcTBVCell.h"

@interface ViewController_4 ()<UITableViewDelegate,UITableViewDataSource>{
    
    
}
@property(nonatomic,strong)UITableView *tbv;

@end

@implementation ViewController_4

-(void)viewDidLoad{
    
    self.view.backgroundColor = KGreenColor;
    
    [self.view addSubview:self.tbv];
    
    [self.tbv mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view).offset(164);
        
        make.left.right.equalTo(self.view);
        
        make.height.mas_equalTo(MAINSCREEN_HEIGHT / 2);
    }];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ArcTBVCell *cell = [ArcTBVCell cellWith:tableView];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 3;
}

-(UITableView *)tbv{
    
    if (!_tbv) {
        
        _tbv = UITableView.new;
        
        _tbv.dataSource = self;
        
        _tbv.delegate = self;
        
        _tbv.backgroundColor = kRedColor;
        
    }
    
    return _tbv;
}


@end
