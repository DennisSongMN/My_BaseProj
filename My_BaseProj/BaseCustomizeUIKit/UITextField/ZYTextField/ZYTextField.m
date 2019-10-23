
#import "ZYTextField.h"

@implementation ZYTextField
//通过代码创建
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUpUI];
    }return self;
}
//通过xib创建
-(void)awakeFromNib{
    [super awakeFromNib];
    [self setUpUI];
}

- (void)setUpUI{
//    设置border
//    self.layer.masksToBounds = YES;
//    self.layer.cornerRadius = 22;
//    self.backgroundColor = Default_FontColor;
//    self.layer.borderColor = [UIColor blackColor].CGColor;
//    self.layer.borderWidth = 1;
    //字体大小
    self.font = [UIFont systemFontOfSize:15];
    //字体颜色
    self.textColor = RGBCOLOR(77,
                              150,
                              132);
    //光标颜色
    self.tintColor = self.textColor;
    //占位符的颜色和大小
    UILabel *placeholderLabel = object_getIvar(self, class_getInstanceVariable([UITextField class], "_placeholderLabel"));
    placeholderLabel.textColor = RGBCOLOR(167,
                                          167,
                                          167);
    placeholderLabel.font = [UIFont boldSystemFontOfSize:15];
    
    // 不成为第一响应者
    [self resignFirstResponder];
}
/**
 * 当前文本框聚焦时就会调用
 */
- (BOOL)becomeFirstResponder{
    // 修改占位文字颜色
    UILabel *placeholderLabel = object_getIvar(self, class_getInstanceVariable([UITextField class], "_placeholderLabel"));
    placeholderLabel.textColor = self.textColor;
    return [super becomeFirstResponder];
}
/**
 * 当前文本框失去焦点时就会调用
 */
- (BOOL)resignFirstResponder{
    // 修改占位文字颜色
    UILabel *placeholderLabel = object_getIvar(self, class_getInstanceVariable([UITextField class], "_placeholderLabel"));
    placeholderLabel.textColor = [UIColor grayColor];
    return [super resignFirstResponder];
}
//控制placeHolder的位置
-(CGRect)placeholderRectForBounds:(CGRect)bounds{
    CGRect inset = CGRectMake(bounds.origin.x + 15,
                              bounds.origin.y,
                              bounds.size.width -15,
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
#pragma mark —— 子类需要覆写
// 下拉刷新
-(void)pullToRefresh{
    NSLog(@"下拉刷新");
}
//上拉加载更多
- (void)loadMoreRefresh{
    NSLog(@"上拉加载更多");
}
#pragma mark —— lazyLoad
-(MJRefreshGifHeader *)tableViewHeader{
    if (!_tableViewHeader) {
        _tableViewHeader =  [MJRefreshGifHeader headerWithRefreshingTarget:self
                                                          refreshingAction:@selector(pullToRefresh)];
        // 设置普通状态的动画图片
        [_tableViewHeader setImages:@[kIMG(@"猫粮")]
                           forState:MJRefreshStateIdle];
        // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
        [_tableViewHeader setImages:@[kIMG(@"猫咪")]
                           forState:MJRefreshStatePulling];
        // 设置正在刷新状态的动画图片
        [_tableViewHeader setImages:@[kIMG(@"猫爪")]
                           forState:MJRefreshStateRefreshing];
        // 设置文字
        [_tableViewHeader setTitle:@"Click or drag down to refresh" forState:MJRefreshStateIdle];
        [_tableViewHeader setTitle:@"Loading more ..." forState:MJRefreshStateRefreshing];
        [_tableViewHeader setTitle:@"No more data" forState:MJRefreshStateNoMoreData];
        // 设置字体
        _tableViewHeader.stateLabel.font = [UIFont systemFontOfSize:17];
        // 设置颜色
        _tableViewHeader.stateLabel.textColor = KLightGrayColor;
    }return _tableViewHeader;
}

-(MJRefreshAutoGifFooter *)tableViewFooter{
    if (!_tableViewFooter) {
        _tableViewFooter = [MJRefreshAutoGifFooter footerWithRefreshingTarget:self
                                                                refreshingAction:@selector(loadMoreRefresh)];
        // 设置普通状态的动画图片
        [_tableViewFooter setImages:@[kIMG(@"猫粮")]
                           forState:MJRefreshStateIdle];
        // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
        [_tableViewFooter setImages:@[kIMG(@"猫咪")]
                           forState:MJRefreshStatePulling];
        // 设置正在刷新状态的动画图片
        [_tableViewFooter setImages:@[kIMG(@"猫爪")]
                           forState:MJRefreshStateRefreshing];
        // 设置文字
        [_tableViewFooter setTitle:@"Click or drag up to refresh" forState:MJRefreshStateIdle];
        [_tableViewFooter setTitle:@"Loading more ..." forState:MJRefreshStateRefreshing];
        [_tableViewFooter setTitle:@"No more data" forState:MJRefreshStateNoMoreData];
        // 设置字体
        _tableViewFooter.stateLabel.font = [UIFont systemFontOfSize:17];
        // 设置颜色
        _tableViewFooter.stateLabel.textColor = KLightGrayColor;
        _tableViewFooter.hidden = YES;
    }return _tableViewFooter;
}

@end
