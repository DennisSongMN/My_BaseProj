//
//  ZYTextField.m
//  gt
//
//  Created by Administrator on 09/05/2019.
//  Copyright © 2019 GT. All rights reserved.
//

#import "ZYTextField_01.h"

@interface ZYTextField_01 (){
}

@property(nonatomic,copy)NSString *documentName;//数据文件名
@property(nonatomic,strong)NSMutableSet *mutSet;

@end

@implementation ZYTextField_01

//通过代码创建
- (instancetype)initWithFrame:(CGRect)frame
                 documentName:(NSString *)docName
           isStoreHistoryInfo:(isStoreHistoryInfo)isStoreHistoryInfo{
    
    if (self = [super initWithFrame:frame]) {
        self.documentName = docName;
        [self setUpUI];
        if (isStoreHistoryInfo) {
            [self setUpData];
        }
    }return self;
}

-(void)setUpData{
    self.dataMutArr = [[NSMutableArray alloc]initWithContentsOfFile:[self getPlistPath]];//开始读取plist文件
}

- (void)setUpUI{
    self.font = [UIFont systemFontOfSize:15];//字体大小
    self.textColor = RGBCOLOR(77,
                              150,
                              132);//字体颜色
    self.tintColor = self.textColor;//光标颜色
    
    UILabel *placeholderLabel = object_getIvar(self, class_getInstanceVariable([UITextField class], "_placeholderLabel"));
    placeholderLabel.textColor = RGBCOLOR(167,
                                          167,
                                          167);
    placeholderLabel.font = [UIFont boldSystemFontOfSize:15];
    
    [self resignFirstResponder];// 不成为第一响应者
}
/**
 * 当前文本框聚焦时就会调用
 */
- (BOOL)becomeFirstResponder{
    // 修改占位文字颜色
    UILabel *placeholderLabel = object_getIvar(self, class_getInstanceVariable([UITextField class], "_placeholderLabel"));
    placeholderLabel.textColor = self.textColor;
    if (self.dataMutArr.count > 0) {
        //添加到父视图上
        [self.superview addSubview:self.historyDataListTBV];
        self.historyDataListTBV.frame = CGRectMake(self.mj_x,
                                                   self.mj_y + self.mj_h,
                                                   self.mj_w,
                                                   [HistoryDataListTBVCell cellHeightWithModel:Nil] * self.dataMutArr.count);
        [self.historyDataListTBV reloadData];
    }return [super becomeFirstResponder];
}
/**
 * 当前文本框失去焦点时就会调用
 */
- (BOOL)resignFirstResponder{
    UILabel *placeholderLabel = object_getIvar(self, class_getInstanceVariable([UITextField class], "_placeholderLabel"));
    placeholderLabel.textColor = [UIColor grayColor];// 修改占位文字颜色
    if (_historyDataListTBV) {//关闭
        [self.historyDataListTBV removeFromSuperview];
        _historyDataListTBV = Nil;
    }return [super resignFirstResponder];
}
//控制placeHolder的位置
-(CGRect)placeholderRectForBounds:(CGRect)bounds{
    CGRect inset = CGRectMake(bounds.origin.x + 15,
                              bounds.origin.y,
                              bounds.size.width - 15,
                              bounds.size.height);
    
    return inset;
}
//控制显示文本的位置
-(CGRect)textRectForBounds:(CGRect)bounds{
    CGRect inset = CGRectMake(bounds.origin.x + 15,
                              bounds.origin.y,
                              bounds.size.width - 15,
                              bounds.size.height);
    
    return inset;
}
//控制编辑文本的位置
-(CGRect)editingRectForBounds:(CGRect)bounds{
    CGRect inset = CGRectMake(bounds.origin.x + 15,
                              bounds.origin.y,
                              bounds.size.width - 15,
                              bounds.size.height);
    return inset;
}
//存取路径
-(NSString *)getPlistPath{
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                             NSUserDomainMask,
                                                             YES);
    NSString *path = [pathArray objectAtIndex:0];
    return [path stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.plist",self.documentName]];
}
//存方法
-(void)store:(NSString *)str{
    //为空不存
    if (![NSString isEmptyStr:str]) {
        if (self.dataMutArr.count != 0) {//本地有数据
            [self.mutSet addObjectsFromArray:self.dataMutArr];
        }
        [self.mutSet addObject:str];
        [[self.mutSet allObjects] writeToFile:[self getPlistPath]
                                   atomically:YES];
        [self.dataMutArr removeAllObjects];
        self.dataMutArr = [NSMutableArray arrayWithArray:[self.mutSet allObjects]];
    }else return;
}

#pragma mark —— lazyLoad
-(HistoryDataListTBV *)historyDataListTBV{
    if (!_historyDataListTBV) {
        _historyDataListTBV = [HistoryDataListTBV initWithRequestParams:self.dataMutArr];
        @weakify(self)
//        [_historyDataListTBV dele];
        
//        [_historyDataListTBV deleteData:^(id  _Nullable data) {
//            @strongify(self)
//            NSLog(@"%@",data);
//            [self.dataMutArr removeObject:data];
//            [self->_historyDataListTBV reloadData];
//        }];
//        [_historyDataListTBV showSelectedData:^(id data) {
//            @strongify(self)
//            self.text = data;
//        }];
        _historyDataListTBV.tableFooterView = UIView.new;
    }return _historyDataListTBV;
}

-(NSMutableSet *)mutSet{
    if (!_mutSet) {
        _mutSet = NSMutableSet.set;
    }return _mutSet;
}

@end
