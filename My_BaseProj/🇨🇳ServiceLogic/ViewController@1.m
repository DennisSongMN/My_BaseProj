//
//  ViewController@1.m
//  My_BaseProj
//
//  Created by Administrator on 04/06/2019.
//  Copyright © 2019 Administrator. All rights reserved.
//

#import "ViewController@1.h"

@interface ViewController_1 ()<UITextFieldDelegate>{

}

//@property (nonatomic, assign) BOOL isShowEmailSuffix;   //是否在输入@后显示email后缀
//@property (nonatomic, assign) BOOL isAutoCompleterEmailSuffix;  //是否自动补全email后缀
@property(nonatomic,strong)ZYTextField *textField;
@property(nonatomic,strong)UIView *mainView;

@end

@implementation ViewController_1

- (void)dealloc {
    
    NSLog(@"Running self.class = %@;NSStringFromSelector(_cmd) = '%@';__FUNCTION__ = %s", self.class, NSStringFromSelector(_cmd),__FUNCTION__);
}

#pragma mark - Lifecycle
-(instancetype)init{
    
    if (self = [super init]) {
        
    }return self;
}


-(void)viewDidLoad{
    
    self.view.backgroundColor = RandomColor;
    
//    [self ddd];
    
    [self setView:self.mainView];
    
    NSLog(@"%@",self.mainView);
    
    [self.mainView addSubview:self.textField];
    
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.mainView).offset(SCALING_RATIO(30));
        
        make.left.equalTo(self.mainView).offset(SCALING_RATIO(30) + rectOfStatusbar + rectOfNavigationbar);
        
        ///系统控件高度
//#define rectOfStatusbar [[UIApplication sharedApplication] statusBarFrame].size.height//获取状态栏的高
//#define rectOfNavigationbar self.navigationController.navigationBar.frame.size.height//获取导航栏的高
        
        make.right.equalTo(self.mainView).offset(-SCALING_RATIO(30));
        
        make.height.mas_equalTo((SCALING_RATIO(100)));
    }];
}

-(UIView *)mainView{
    
    if (!_mainView) {
        
        _mainView = UIView.new;
        
        _mainView.frame = kAPPDelegate.window.frame;
        
        _mainView.backgroundColor = kRedColor;
    }
    
    return _mainView;
}

-(ZYTextField *)textField{
    
    if (!_textField) {
        
        _textField = ZYTextField.new;
        
        [UIView cornerCutToCircleWithView:_textField
                          AndCornerRadius:4];
        
        [UIView colourToLayerOfView:_textField WithColour:kCyanColor
                     AndBorderWidth:1.0f];
        
        _textField.delegate = self;
    }
    
    return _textField;
}










//通过plist文件储存历史输入
//-(void)ddd{
//    ////对plist文件进行读写
//
//    //获取路径对象
//    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *path = [pathArray objectAtIndex:0];
//    //获取文件的完整路径
//    NSString *filePatch = [path stringByAppendingPathComponent:@"column.plist"];
//
//    NSLog(@"%@",filePatch);
//
//    //写入数据到plist文件
//    NSMutableDictionary *dic1 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"小小虎",@"name",@"5",@"age",@"boy",@"sex",nil];
//
//    NSMutableDictionary *dic2 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"小小兮",@"name",@"6",@"age",@"girl",@"sex",nil];
//
//    //将上面2个小字典保存到大字典里面
//    NSMutableDictionary *dataDic = [NSMutableDictionary dictionary];
//    [dataDic setObject:dic1 forKey:@"一年级"];
//    [dataDic setObject:dic2 forKey:@"二年级"];
//    //写入plist里面
//    [dataDic writeToFile:filePatch atomically:YES];
//
//
//    //读取plist文件的内容
//    NSMutableDictionary *dataDictionary = [[NSMutableDictionary alloc] initWithContentsOfFile:filePatch];
//    NSLog(@"---plist一开始保存时候的内容---%@",dataDictionary);
//
//    //////对pilst文件进行修改
//    //修改字典里面的内容,先按照结构取到你想修改内容的小字典
//    NSMutableDictionary *dd = [dataDictionary objectForKey:@"一年级"];
//    [dd setObject:@"我改名字了哦" forKey:@"name"];
//    [dd setObject:@"我添加的新内容" forKey:@"content"];
//    [dd removeObjectForKey:@"age"];
//
//    //修改成功以后，将这个小字典重新添加到大字典里面
//    [dataDictionary setObject:dd forKey:@"一年级"];
//
//    [dataDictionary writeToFile:filePatch atomically:YES];
//    NSLog(@"---plist做过操作之后的字典里面内容---%@",dataDictionary);
//
//
//    //////删除
//    //清除plist文件，可以根据我上面讲的方式进去本地查看plist文件是否被清除
//    NSFileManager *fileMger = [NSFileManager defaultManager];
//
//    NSString *xiaoXiPath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0]stringByAppendingPathComponent:@"xiaoxi.plist"];
//
//    //如果文件路径存在的话
//    BOOL bRet = [fileMger fileExistsAtPath:xiaoXiPath];
//
//    if (bRet) {
//
//        NSError *err;
//
//        [fileMger removeItemAtPath:xiaoXiPath error:&err];
//    }
//
//}

////初始化
//- (void)initialize{
//    
//    [self addNotification];
//    [self resetRightView];
//}
//
////添加通知监听
//- (void)addNotification{
//    
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(textFieldTextDidChangeNotification:)
//                                                 name:UITextFieldTextDidChangeNotification
//                                               object:self];
//    
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(textFieldTextDidEndEditingNotification:)
//                                                 name:UITextFieldTextDidEndEditingNotification
//                                               object:self];
//}
//
////重置右边按钮变为x
//- (void)resetRightView{
//    
//    UIButton *myButton = [[UIButton alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 20, 20)];
//    [myButton setImage:[UIImage imageNamed:@"com_txt_btn_clear"] forState:UIControlStateNormal];
////    [myButton addTarget:self action:@selector(whenClearBtnTapped:) forControlEvents:UIControlEventTouchUpInside];
//    myButton.userInteractionEnabled = YES;
//    
////    self.rightView = myButton;
////    self.rightViewMode = UITextFieldViewModeWhileEditing;
////    self.rightView.userInteractionEnabled = YES;
//}
//
//
//#pragma mark ---------------------
//#pragma mark - NSNotification
//
////通知：textfield文本改变时通知
//- (void)textFieldTextDidChangeNotification:(NSNotification *)notification
//{
////    if (notification.object && notification.object != [NSNull null] && notification.object == self) {  //如果文本改变通知是自己
//    
////        if (_isMarketHandle) {
////            _isMarketHandle = NO;
////            return;
////        }
//        
////        //如果在输入@后显示与文本有@符号,则显示
////        if (self.isShowEmailSuffix && [self.text rangeOfString:@"@"].location != NSNotFound) {
////            [self showSelectedEmailSuffix]; //显示
////        } else {
////            [self hideSelectedEmailSuffix]; //隐藏
////        }
////
////        //如果在输入@后显示与文本有@符号,则自动补全
////        if (self.isAutoCompleterEmailSuffix) {
////            if (self.color) {
////                self.textColor = self.color;
////            }
////            if ([self.text rangeOfString:@"@"].location != NSNotFound) {
////                [self showPlaceholderWithEmail];
////            } else if (self.autoCompleterText) {
////                self.text = [self.text stringByReplacingOccurrencesOfString:self.autoCompleterText withString:@""];
////                self.autoCompleterText = nil;
////            }
////        }
//        
////    } else {
////        [self hideSelectedEmailSuffix]; //隐藏
////    }
//}
//
//////通知：textfield文本结束编辑时通知
////- (void)textFieldTextDidEndEditingNotification:(NSNotification *)notification{
////
////    if (notification.object && notification.object != [NSNull null] && notification.object == self) {  //如果文本改变通知是自己
////        if (self.isAutoCompleterEmailSuffix) {
////            if (self.color) {
////                self.textColor = self.color;
////            }
////            self.autoCompleterText = nil;
////        }
////    }
////}
//
//
//////显示选择email后缀
////- (void)showSelectedEmailSuffix
////{
////    if (self.emailSuffixView) {
////        [self.emailSuffixView hide];
////        self.emailSuffixView = nil;
////    }
////
////    self.emailSuffixView = [[KBSelectedEmailSuffixView alloc] initWithTargerView:self withDelegate:self withCurrentText:self.text];
////    [self.emailSuffixView show];
////}
//
//////隐藏选择email后缀
////- (void)hideSelectedEmailSuffix
////{
////    if (self.emailSuffixView) {
////        [self.emailSuffixView hide];
////        self.emailSuffixView = nil;
////    }
////}
//
//
////提示email
//- (void)showPlaceholderWithEmail
////{
////    /*markedTextRange 和 selectedTextRange 是不同的 ，markedTextRange是高亮文字(比如中文输入法输入文字后的显示)  selectedTextRange是选中的文字*/
////    UITextRange *range = nil;
////    if ([[[UIDevice currentDevice] systemVersion] doubleValue] >= 8.0) {  //ios8系统下才需要判读,因为在ios8下才不正常
////        range = self.markedTextRange ? self.markedTextRange : self.selectedTextRange; //markedTextRange有高亮一段文字才有值，selectedTextRange的值都是在光标末尾
////    } else {
////        range = self.selectedTextRange;
////    }
////    UITextPosition *startTextPosition = range.start;
////    UITextPosition *endTextPosition = range.end;
////    NSInteger startPosition = [[startTextPosition valueForKey:@"offset"] integerValue];   //当前光标的开始位置
////    NSInteger endPosition = [[endTextPosition valueForKey:@"offset"] integerValue];   //当前光标的结束位置
////
////    NSString *language = [[UITextInputMode currentInputMode] primaryLanguage]; // 键盘输入模式
////
////    BOOL isChineseLanguage = [language isEqualToString:@"zh-Hans"]; //是否是简体中文输入，包括简体拼音，健体五笔，简体手写
////    if (isChineseLanguage &&
////        startPosition != endPosition
////        && !self.autoCompleterText) {    //如果在简体中文下有高亮文字范围，且当前没匹配过email，则跳出
////        return;
////    }
////
////    //如果有高亮文字范围，且后面有文字，把高亮后的文字去掉
////    if (startPosition != endPosition && self.text.length > endPosition) {
////        self.text = [self.text substringToIndex:startPosition];
////        _isMarketHandle = YES;
////        [self setMarkedText:_perviousMarketText selectedRange:_perviousSelectedRange];
////        return;
////    } else if (startPosition != endPosition) {  //如果有高亮文字 且 高亮文字后面没文字了，则跳出
////        return;
////    }
////
////    NSString *currentInputSuffix = nil;
////    NSString *postionText = [self.text substringToIndex:endPosition];
////
////    if ([postionText rangeOfString:@"@"].location == NSNotFound) {
////        currentInputSuffix = nil;
////    } else {
////        NSInteger location = [postionText rangeOfString:@"@"].location + 1;
////        if (postionText.length <= location) {
////            currentInputSuffix = nil;
////        } else {
////            currentInputSuffix = [NSString stringWithFormat:@"%@",[postionText substringFromIndex:location]];
////        }
////    }
////
////
////    //后缀
////    NSMutableArray *arraySuffix = [kKBTextFieldEmailSuffix mutableCopy];
////
////    //移除不包含现在输入过的后缀的邮箱后缀
////    NSIndexSet *indexSet = [arraySuffix indexesOfObjectsWithOptions:NSEnumerationConcurrent passingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
////
////        NSString *suffix = obj;
////        //如果当前输入的后缀为空或递归到的后缀包含当前输入的后缀，则不被移除
////        if (!currentInputSuffix || [currentInputSuffix isEqualToString:@""] || [suffix rangeOfString:currentInputSuffix].location == 0) {
////            return NO;
////        } else {
////            return YES;
////        }
////    }];
////    [arraySuffix removeObjectsAtIndexes:indexSet];
////
////    if (arraySuffix.count > 0) {
////        self.text = [NSString stringWithFormat:@"%@%@",[self.text substringToIndex:[self.text rangeOfString:@"@"].location + 1], arraySuffix[0]];   //重置text
////
////        //设置富文本属性
////        if (!self.color) {
////            self.color = [self.textColor copy];
////        }
////
////        NSMutableAttributedString *attributedStringOrder = [[NSMutableAttributedString alloc] initWithString:self.text];
////        [attributedStringOrder addAttribute:NSForegroundColorAttributeName
////                                      value:self.color
////                                      range:NSMakeRange(0, endPosition)];
////        NSRange autoCompleterTextRange = NSMakeRange(endPosition, self.text.length - endPosition);
////        self.autoCompleterText = [self.text substringWithRange:autoCompleterTextRange];
////        [attributedStringOrder addAttribute:NSForegroundColorAttributeName
////                                      value:YYColor(188.0, 188.0, 188.0)
////                                      range:autoCompleterTextRange];
////        self.attributedText = attributedStringOrder;
////
////        //移动光标位置
////        if (endPosition  < self.text.length) {
////            NSInteger offset = self.text.length - (endPosition );
////            [self moveCursor:self inDirection:UITextLayoutDirectionLeft offset:offset];
////        }
////    } else {
////        self.text = [self.text substringToIndex:endPosition];
////
////        self.autoCompleterText = nil;
////    }
////}
//
////- (void)setMarkedText:(NSString *)markedText selectedRange:(NSRange)selectedRange
////{
////    _perviousMarketText = markedText;
////    _perviousSelectedRange = selectedRange;
////    @try {
////        [super setMarkedText:markedText selectedRange:selectedRange];
////    }
////    @catch (NSException *exception) {
////        NSLog(@"error: setMarkedText:selectedRange");
////    }
////}
//
//
//
//////实现 输入框 记录历史输入的数据
////-(void)ddd{
////
//////    https://kemchenj.github.io/2017-08-06/
////
////    //登录成功保存用户名
////
////    SetUserDefaultKeyWithObject(@"userName", @"");//增 改
////
//////    DeleUserDefaultWithKey(@"userName");//删
////
//////    GetUserDefaultWithKey(@"userName");//查
////
////    UserDefaultSynchronize;
////}

@end
