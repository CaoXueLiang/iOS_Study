//
//  ViewController.m
//  JS_OCDemo
//
//  Created by 曹学亮 on 2018/4/10.
//  Copyright © 2018年 Cao Xueliang. All rights reserved.
//

#import "ViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>

@interface ViewController ()<UIWebViewDelegate>
@property (nonatomic,strong) UIWebView *myWebView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _myWebView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:_myWebView];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Second" ofType:@"html"];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:path]];
    [_myWebView loadRequest:request];
    _myWebView.delegate = self;
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    JSContext *context = [_myWebView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    //定义好JS要调用的方法, share就是调用的share方法名
    context[@"callAppback"] = ^(NSString *responseData) {
        
        NSLog(@"----%@----",responseData);
       
    };
}

@end
