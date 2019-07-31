//
//  XZWebView.h
//  User
//
//  Created by 程肖斌 on 2018/12/24.
//  Copyright © 2018年 ICE. All rights reserved.
//

#import <WebKit/WebKit.h>
//#import "XZManager.h"
//#import "XZURIManager.h"
#import "UIView+runtime.h"
#import "UIView+category.h"

NS_ASSUME_NONNULL_BEGIN
@class XZWebView;
@protocol XZWebViewDelegate <NSObject>

@required
- (void)loadWebView;//加载

@optional
- (void)xz_webView:(XZWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation;

- (void)xz_webView:(XZWebView *)webView didFinishNavigation:(WKNavigation *)navigation;

- (void)xz_webView:(XZWebView *)webView didFailProvisionalNavigation:(null_unspecified WKNavigation *)navigation withError:(nonnull NSError *)error;

- (void)xz_userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message;

- (void)xz_webView:(WKWebView *)webView decidePolicyForNavigationAction:(nonnull WKNavigationAction *)navigationAction decisionHandler:(nonnull void (^)(WKNavigationActionPolicy))decisionHandler;

@end

@interface XZWebView : WKWebView<WKUIDelegate, WKNavigationDelegate, WKScriptMessageHandler>
@property(nonatomic, strong) UIView *line_view;
@property(nonatomic, strong) XZViewMaskView *mask_view;
@property(nonatomic, assign) CFTimeInterval interval;

@property(nonatomic, weak) id<XZWebViewDelegate> weak_delegate;

- (void)addObservers;

- (void)removeObservers;

@end
NS_ASSUME_NONNULL_END

