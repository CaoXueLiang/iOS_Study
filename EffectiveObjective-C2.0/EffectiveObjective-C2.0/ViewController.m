//
//  ViewController.m
//  EffectiveObjective-C2.0
//
//  Created by 曹学亮 on 2017/12/26.
//  Copyright © 2017年 Cao Xueliang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
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
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"标题" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert addAction:action];
    [self.navigationController presentViewController:alert animated:YES completion:nil];
}

@end
