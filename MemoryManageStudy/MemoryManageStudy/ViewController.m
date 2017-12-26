//
//  ViewController.m
//  MemoryManageStudy
//
//  Created by 曹学亮 on 2017/12/20.
//  Copyright © 2017年 Cao Xueliang. All rights reserved.
//

#import "ViewController.h"
#import "Text.h"

@interface ViewController ()

@end

@implementation ViewController
#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.navigationItem.title = @"首页";
    //[self text1];
    //[self text5];
    [self example];
}

- (void)example{
    {
        id __strong obj = [[NSObject alloc]init];
        id obj1 = obj;
        NSLog(@"%ld",CFGetRetainCount((__bridge CFTypeRef)(obj)));
    }
    
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

//- (void)text2{
//    /*
//     * 自己生成并持有对象
//     */
//    id obj = [[NSObject alloc]init];
//
//    /*
//     * 自己持有对象
//     */
//    //-------------------------------------
//
//
//    /*
//     * 取得非自己生成并持有的对象
//     */
//    id obj2 = [NSMutableArray array];
//
//    /*
//     * 取得的对象存在，但自己不持有对象
//     */
//    [obj2 retain];
//
//    /*
//     * 自己持有对象
//     */
//    //---------------------------------------
//
//    /*
//     * 自己生成并持有对象
//     */
//    id obj2 = [[NSObject alloc]init];
//
//    /*
//     * 自己持有对象
//     */
//
//    [obj2 release];
//
//    /*
//     * 释放对象
//     * 指向对象的指针仍然被保留在变量obj中，貌似能够访问
//     * 但对象一经释放绝对不可访问
//     */
//    [obj2 release];
//
//    /*
//     * 访问已经废弃的对象，发生崩溃
//     */
//}

- (id)allocObject{
    /*
     * 自己生成并持有对象
     */
    id obj = [[NSObject alloc]init];
    
    /*
     * 自己持有对象
     */
    return obj;
}

- (void)text3{
    {
      /*
       * 自己生成并持有对象
       */
        
     id __strong obj = [[NSObject alloc]init];
     
      /*
       * 因为变量obj 为强引用
       * 所以自己持有对象
       */
    }
    
    /*
     * 因为变量 obj 超出其作用域，强引用失效
     * 所以自动的释放自己持有的对象
     * 对象的所有者不存在，因此废弃该对象
     */
}



- (void)text4{
    id __strong obj0 = [[NSObject alloc]init]; /*对象A*/
    
    /*
     * obj0 持有对象A的强引用
     */
    
    id __strong obj1 = [[NSObject alloc]init]; /*对象B*/
    
    /*
     * obj1 持有对象B的强引用
     */
    
    id __strong obj2 = nil;
    
    /*
     * obj2 不持有任何对象
     */
    
    obj0 = obj1;
    
    /*
     * obj0持有由obj1赋值的对象B的强引用。
     * 因为 obj0 被赋值，所以原先持有的对对象A的强引用失效。
     * 对象A的所有者不存在，因此废弃对象A。
     *
     * 此时持有对象B强引用的变量为
     * obj1 和 obj0
     */
    
    obj2 = obj0;
    
    /*
     * obj2持有由obj0赋值的对象B的强引用。
     * 此时，持有对象B强引用的变量为
     * obj0、obj1、obj2
     */
    
    obj1 = nil;
    
    /*
     * 因为nil 被赋予obj1，所以对对象B的强引用失效
     * 此时，持有对象B强引用的变量为
     * obj0、obj2
     */
    obj0 = nil;
    
    /*
     * 因为nil 被赋予obj0，所以对对象B的强引用失效
     * 此时，持有对象B强引用的变量为
     * obj2
     */
    obj2 = nil;
    
    /*
     * 因为nil 被赋予obj2，所以对对象B的强引用失效
     * 对象B的所有者不存在，所以废弃对象B
     */
}

- (void)retainCycleExample{
    {
        id text0 = [[Text alloc]init];/*对象A*/
        
        /*
         * text0 持有对象A的强引用
         */
        
        id text1 = [[Text alloc]init];/*对象B*/
        
        /*
         * text1 持有对象B的强引用
         */
        
        [text0 setObj:text1];
        
        /*
         * Text对象A的成员变量 obj_ 持有Text对象B的强引用
         * 此时，持有Text对象B强引用的变量为
         * Text对象A的 obj_ 和 text1
         */
        
        [text1 setObj:text0];
        
        /*
         * Text对象B的成员变量 obj_ 持有Text对象A的强引用
         * 此时，持有Text对象A强引用的变量为
         * Text对象B的 obj_ 和 text0
         */
    }
    
    /*
     * 因为 text0 变量超出其作用域，强引用失效
     * 所以自动释放Text对象A
     *
     * 因为 text1 变量超出其作用域，强引用失效
     * 所以自动释放Text对象B
     *
     * 此时，持有对象A强引用的变量为
     * Text对象B的 obj_
     *
     * 此时，持有对象B强引用的变量为
     * Text对象A的 obj_
     *
     * 发生内存泄漏
     */
     
}

- (void)text5{
    id __unsafe_unretained obj1 = nil;
    {
        /*
         * 自己生成并持有对象
         */
        
        id __strong obj = [[NSObject alloc]init];
        
        /*
         * 因为obj变量为强引用
         * 所以自己持有对象
         */
        
        obj1 = obj;
        
        /*
         * 虽然obj变量赋值给obj1
         * 但是obj1变量既不持有对象的强引用，也不持有对象的弱引用
         */
        
        NSLog(@"%@",obj1);
    }
    
    /*
     * 因为obj变量超出其作用域，强引用失效
     * 所以自动释放自己持有的对象
     * 因为对象无所有者，所以废弃该对象
     */
    
    //访问已经废弃的对象，发生崩溃
    NSLog(@"%@",obj1);
}

- (void)text6{
    @autoreleasepool{
        /*
         * 取得非自己生成并持有的对象
         */
        
        id __strong obj = [NSMutableArray array];/**对象A/
        
        /*
         * 因为变量obj为强引用，所以自己持有对象
         *
         * 并且该对象
         * 由编译器判断其方法名后
         * 自动注册到 autoreleasepool
         */
        
    }
    
    /*
     * 因为变量obj超出作用域，强引用失效
     * 所以自动释放自己持有的对象
     *
     * 同时随着@autoreleasepool块的结束，
     * 注册到autoreleasepool中的所有对象被自动释放
     *
     * 因为对象的所有者不存在，所以废弃该对象
     */
}

@end

