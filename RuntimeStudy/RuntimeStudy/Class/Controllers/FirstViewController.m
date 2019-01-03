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

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.navigationItem.title = @"第一个控制器";
}

- (void)viewWillAppear:(BOOL)animated{
    
}

@end
