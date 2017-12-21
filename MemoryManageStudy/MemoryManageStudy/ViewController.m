//
//  ViewController.m
//  MemoryManageStudy
//
//  Created by 曹学亮 on 2017/12/20.
//  Copyright © 2017年 Cao Xueliang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.navigationItem.title = @"首页";
    [self text1];
}

- (void)text1{
    id __weak tmpObj;
    {
        /*
         * 自己生成并持有对象
         */
        
        id __strong obj = [[NSObject alloc]init];
        
        /*
         * 因为obj变量为强引用
         * 所以自己持有对象
         */
        
        tmpObj = obj;
        
        /*
         * tmpObj变量持有对象的弱引用
         */
        
        NSLog(@"%@",tmpObj);
        
        /*
         * 输出tmpObj变量持有的弱引用的对象
         */
        
    }
    /*
     * 因为tmpObj变量超出其作用域，强引用失效
     * 所以自动释放自己持有的对象
     * 因为对象无持有者，所以废弃该对象
     *
     * 废弃对象的同时
     * 持有该对象弱引用的tmpObj变量的弱引用失效，nil赋值给tmpObj
     */
    NSLog(@"%@",tmpObj);
}

@end
