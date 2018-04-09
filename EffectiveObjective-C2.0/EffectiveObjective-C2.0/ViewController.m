//
//  ViewController.m
//  EffectiveObjective-C2.0
//
//  Created by 曹学亮 on 2017/12/26.
//  Copyright © 2017年 Cao Xueliang. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "CXLAlertView.h"

/** 点击按钮回调 */
typedef void (^CXLHandleBlock) (NSInteger index);

/** 使用静态全局变量做键 */
static void *CXLAlertViewKey = @"CXLAlertViewKey";

@interface ViewController ()<UIAlertViewDelegate>
@property (nonatomic,copy,readwrite) NSString *tipString;
@property (nonatomic,strong) UIButton *tapButton;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"首页";
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    _tapButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_tapButton setTitle:@"点击" forState:UIControlStateNormal];
    [_tapButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [_tapButton addTarget:self action:@selector(showuAlert) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_tapButton];
    _tapButton.frame = CGRectMake(0, 0, 100, 30);
    _tapButton.center = self.view.center;
   
}

- (void)showuAlert{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"标题" message:@"消息" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定",@"知道了",nil];
    CXLHandleBlock block = ^(NSInteger index){
        NSLog(@"点击了--%ld",index);
    };
    objc_setAssociatedObject(alert, CXLAlertViewKey, block, OBJC_ASSOCIATION_COPY);
    [alert show];
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    CXLHandleBlock block = objc_getAssociatedObject(alertView, CXLAlertViewKey);
    block(buttonIndex);
}


@end
