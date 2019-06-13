//
//  ViewController@2.m
//  My_BaseProj
//
//  Created by Administrator on 04/06/2019.
//  Copyright © 2019 Administrator. All rights reserved.
//

#import "ViewController@2.h"
#import "HistoryDataListTBV.h"
#import "HistoryDataListTBVCell.h"

@interface ViewController_2 (){
}

@property(nonatomic,strong)UIButton *btn;
@property(nonatomic,strong)UIView *mainView;
@property(nonatomic,strong)HistoryDataListTBV *historyDataListTBV;
@property(nonatomic,strong)NSMutableArray *dataMutArr;

@end


@implementation ViewController_2

- (void)dealloc {
    
    NSLog(@"Running self.class = %@;NSStringFromSelector(_cmd) = '%@';__FUNCTION__ = %s", self.class, NSStringFromSelector(_cmd),__FUNCTION__);
}

#pragma mark - Lifecycle
-(instancetype)init{
    
    if (self = [super init]) {
        
        [self value];
        
    }return self;
}

-(void)value{
    
    [self.dataMutArr addObject:@"111"];
    
    [self.dataMutArr addObject:@"222"];
    
    [self.dataMutArr addObject:@"333"];
    
    [self.dataMutArr addObject:@"444"];
}

-(void)viewDidLoad{
    
    self.view.backgroundColor = RandomColor;
    
    [self setView:self.mainView];
    
    [self.mainView addSubview:self.btn];
    
    [self.btn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.mainView).offset(SCALING_RATIO(30));
        
        make.top.equalTo(self.mainView).offset(SCALING_RATIO(30) + rectOfStatusbar + rectOfNavigationbar);
        
        make.right.equalTo(self.mainView).offset(-SCALING_RATIO(30));
        
        make.height.mas_equalTo((SCALING_RATIO(100)));
    }];
    
    UIBarButtonItem *editBarBtnItems = [[UIBarButtonItem alloc]initWithTitle:@"编辑"
                                                                       style:UIBarButtonItemStylePlain
                                                                      target:self
                                                                      action:@selector(action_EditBtn:)];
    
    
    
    self.navigationController.navigationItem.rightBarButtonItem = editBarBtnItems;
}

-(void)btnClickEvent:(UIButton *)sender{
    
    if (self.dataMutArr.count > 0) {
        //添加到父视图上
        [self.mainView addSubview:self.historyDataListTBV];
        
        self.historyDataListTBV.frame = CGRectMake(self.btn.mj_x,
                                                   self.btn.mj_y + self.btn.mj_h,
                                                   self.btn.mj_w,
                                                   [HistoryDataListTBVCell cellHeightWithModel:Nil] * self.dataMutArr.count);
        
        [self.historyDataListTBV reloadData];
    }
}

#pragma mark ======== LazyLoad ======
-(UIView *)mainView{
    
    if (!_mainView) {
        
        _mainView = UIView.new;
        
        _mainView.frame = kAPPDelegate.window.frame;
    }
    
    return _mainView;
}

-(UIButton *)btn{
    
    if (!_btn) {
        
        _btn = UIButton.new;
        
        [_btn setTitle:@"我是Btn"
              forState:UIControlStateNormal];
        
        [_btn setTitleColor:kBlackColor
                   forState:UIControlStateNormal];
        
        [_btn addTarget:self
                 action:@selector(btnClickEvent:)
       forControlEvents:UIControlEventTouchUpInside];
        
        [UIView cornerCutToCircleWithView:_btn
                          AndCornerRadius:4];
        
        [UIView colourToLayerOfView:_btn
                         WithColour:kRedColor
                     AndBorderWidth:1.0f];
    }
    
    return _btn;
}

-(NSMutableArray *)dataMutArr{
    
    if (!_dataMutArr) {
        
        _dataMutArr = NSMutableArray.array;
    }
    
    return _dataMutArr;
}

-(HistoryDataListTBV *)historyDataListTBV{
    
    if (!_historyDataListTBV) {
        
        _historyDataListTBV = [HistoryDataListTBV initWithRequestParams:self.dataMutArr];
        
        kWeakSelf(self);
        
        [_historyDataListTBV deleteData:^(id  _Nullable data) {
            
            kStrongSelf(self);
            
            NSLog(@"%@",data);
            
            [self.dataMutArr removeObject:data];
            
            [self->_historyDataListTBV reloadData];
        }];
        
        [_historyDataListTBV showSelectedData:^(id data) {
            
            kStrongSelf(self);
            
            [self.btn setTitle:(NSString *)data
                      forState:UIControlStateNormal];
            
            [self.historyDataListTBV removeFromSuperview];
            
            self->_historyDataListTBV = Nil;
        }];
        
        _historyDataListTBV.tableFooterView = UIView.new;
    }
    
    return _historyDataListTBV;
}

@end
