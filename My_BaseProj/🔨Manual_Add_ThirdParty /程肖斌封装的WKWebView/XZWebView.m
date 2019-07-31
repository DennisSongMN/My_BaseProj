//
//  XZWebView.m
//  User
//
//  Created by 程肖斌 on 2018/12/24.
//  Copyright © 2018年 ICE. All rights reserved.
//

#import "XZWebView.h"

@implementation XZWebView

- (void)INIT{
    self.UIDelegate = self;
    self.navigationDelegate  = self;
    self.scrollView.showsVerticalScrollIndicator   = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    
    self.line_view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 2)];
    self.line_view.backgroundColor = LightBlue;
    [self addSubview:self.line_view];
    
    [self addMaskView];
}

- (instancetype)initWithFrame:(CGRect)frame{
    if([super initWithFrame:frame]){
        [self INIT];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame configuration:(WKWebViewConfiguration *)configuration{
    if([super initWithFrame:frame configuration:configuration]){
        [self INIT];
    }
    return self;
}

//response
- (void)addMaskView{
    [self bringSubviewToFront:self.line_view];
    if(self.mask_view){return;}
    self.mask_view = [[XZViewMaskView alloc]initWithFrame:self.bounds];
    [self addSubview:self.mask_view];
}

- (void)removeMaskView{
    [self.mask_view removeFromSuperview];
    self.mask_view = nil;
}

- (void)reloadWebView{
    [self removeViewMaskView];
    [self addMaskView];
    [self.weak_delegate loadWebView];
}

- (void)addObservers{
    [self addObserver:self
           forKeyPath:@"estimatedProgress"
              options:NSKeyValueObservingOptionNew
              context:NULL];
}

- (void)removeObservers{
    [self removeObserver:self
              forKeyPath:@"estimatedProgress"];
}

//观察者
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if(self.estimatedProgress > 0.99){return;}
    CGFloat len = self.estimatedProgress*self.WIDTH;
    __weak typeof(self) weak_self = self;
    CGFloat duration = CACurrentMediaTime()-self.interval;
    self.interval = CACurrentMediaTime();
    [UIView animateWithDuration:duration animations:^{
        weak_self.line_view.frame = CGRectMake(0, 0, len, 2);
    }];
}

//delegate
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
    self.line_view.hidden = NO;
    self.line_view.frame = CGRectMake(0, 0, 0, 2);
    self.interval = CACurrentMediaTime();
    
    if([self.weak_delegate respondsToSelector:@selector(xz_webView:didStartProvisionalNavigation:)]){
        [self.weak_delegate xz_webView:self didStartProvisionalNavigation:navigation];
    }
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    __weak typeof(self) weak_self = self;
    [UIView animateWithDuration:0.25f animations:^{//如果设置weak_self.WIDTH，那么总是会短一点点，不知为何
        weak_self.line_view.frame = CGRectMake(0, 0, 2*weak_self.WIDTH, 2);
    } completion:^(BOOL finished) {
        weak_self.line_view.hidden = YES;
        weak_self.line_view.frame = CGRectMake(0, 0, 0, 2);
    }];
    
    [self removeMaskView];
    NSString *js = @"document.body.style.backgroundColor=\"#FFFFFF\"";
    [webView evaluateJavaScript:js
              completionHandler:^(id _Nullable result,
                                  NSError * _Nullable error) {}];
    
    if([self.weak_delegate respondsToSelector:@selector(xz_webView:didFinishNavigation:)]){
        [self.weak_delegate xz_webView:self didFinishNavigation:navigation];
    }
}

- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(null_unspecified WKNavigation *)navigation withError:(nonnull NSError *)error{
    __weak typeof(self) weak_self = self;
    [UIView animateWithDuration:0.1f animations:^{
        weak_self.line_view.frame = CGRectMake(0, 0, weak_self.WIDTH, 2);
    } completion:^(BOOL finished) {
        weak_self.line_view.hidden = YES;
        weak_self.line_view.frame = CGRectMake(0, 0, 0, 2);
    }];
    
    NSString *text = XZManager.sharedManager.connectNet ? @"error" : @"no_net";
    NSString *show = XZManager.sharedManager.connectNet ? @"啊哦,您当前没有网络" : @"点击屏幕重试";
    [self addViewMaskView:text
                     desc:show
                 distance:0
                 callback:^{[weak_self reloadWebView];}];
    
    if([self.weak_delegate respondsToSelector:@selector(xz_webView:didFailProvisionalNavigation:withError:)]){
        [self.weak_delegate xz_webView:self didFailProvisionalNavigation:navigation withError:error];
    }
}

- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message{
    if(!message.name){return;}
    
    if([self.weak_delegate respondsToSelector:@selector(xz_userContentController:didReceiveScriptMessage:)]){
        [self.weak_delegate xz_userContentController:userContentController didReceiveScriptMessage:message];
    }
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(nonnull WKNavigationAction *)navigationAction decisionHandler:(nonnull void (^)(WKNavigationActionPolicy))decisionHandler{
    NSString *URI = navigationAction.request.URL.absoluteString;
    BOOL state = [URI containsString:@"just://"];
    if(!state){decisionHandler(WKNavigationActionPolicyAllow);}
    else{
        [XZURIManager.sharedManager dealWithURI:URI callback:nil];
        decisionHandler(WKNavigationActionPolicyCancel);
    }
    
    if([self.weak_delegate respondsToSelector:@selector(xz_webView:decidePolicyForNavigationAction:decisionHandler:)]){
        [self.weak_delegate xz_webView:self decidePolicyForNavigationAction:navigationAction decisionHandler:decisionHandler];
    }
}

- (void)dealloc{
    self.UIDelegate = nil;
    self.navigationDelegate = nil;
    [self removeObserver:self
              forKeyPath:@"estimatedProgress"];
    
    NSLog(@"%@销毁了",[self class]);
}


@end
