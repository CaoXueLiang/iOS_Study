//
//  UIImage+CXLExchange.m
//  RuntimeStudy
//
//  Created by 曹学亮 on 2018/10/29.
//  Copyright © 2018 Cao Xueliang. All rights reserved.
//

#import "UIImage+CXLExchange.h"
#include <objc/runtime.h>

@implementation UIImage (CXLExchange)
+ (UIImage *)cxl_imageNamed:(NSString *)name{
    UIImage *image = [UIImage cxl_imageNamed:name];
    if (image) {
        NSLog(@"runtime交互方法-->图片加载成功");
    }else{
        NSLog(@"runtome交换方法-->图片加载失败");
    }
    return image;
}

/**在程序运行后立即执行*/
+ (void)load{
    //1.获取`imageNamed`方法地址
    Method imageNamedMethod = class_getClassMethod(self, @selector(imageNamed:));
    
    //2.获取`cxl_imageNamed`方法地址
    Method cxlImageNameMenthod = class_getClassMethod(self, @selector(cxl_imageNamed:));
    
    //3.交换方法地址,交换两个方法实现
    method_exchangeImplementations(imageNamedMethod, cxlImageNameMenthod);
}



@end
