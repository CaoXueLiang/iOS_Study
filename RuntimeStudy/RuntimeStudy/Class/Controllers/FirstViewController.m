//
//  FirstViewController.m
//  RuntimeStudy
//
//  Created by 曹学亮 on 2018/11/1.
//  Copyright © 2018 Cao Xueliang. All rights reserved.
//

#import "FirstViewController.h"
#import "UIViewController+Swizzling.h"

@interface FirstViewController ()
@property (nonatomic,strong) UIButton *tipButton;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.navigationItem.title = @"第一个控制器";
    
    
    _tipButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _tipButton.frame = CGRectMake(100, 100, 100, 50);
    _tipButton.backgroundColor = [UIColor purpleColor];
    [_tipButton addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_tipButton];
}


- (void)buttonClicked{
    
}



@end
