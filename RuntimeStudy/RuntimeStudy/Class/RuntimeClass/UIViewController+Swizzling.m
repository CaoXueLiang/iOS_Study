//
//  UIViewController+Swizzling.m
//  RuntimeStudy
//
//  Created by 曹学亮 on 2018/11/1.
//  Copyright © 2018 Cao Xueliang. All rights reserved.
//

#import "UIViewController+Swizzling.h"
#import <objc/runtime.h>

@implementation UIViewController (Swizzling)
+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        SEL originalSelector = @selector(viewWillAppear:);
        SEL swizzledSelector = @selector(cxl_viewWillAppear:);
        Method originalMenthod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMenthod = class_getInstanceMethod(class, swizzledSelector);
        
        /*class_addMethod,是相对于实现来的说的，将本来不存在于被操作的Class里的newMethod的实现添加在被操作的Class里，并使用origSel作为其选择子*/
        BOOL didAddMenthod =
        class_addMethod(class,
                        originalSelector, method_getImplementation(swizzledMenthod), method_getTypeEncoding(swizzledMenthod));
        if (didAddMenthod) {
            /*class_replaceMethod，addMethod成功完成后，从参数可以看出，目的是将原方法的实现的SEL换成新方法的SEL:swizzledSelector*/
            class_replaceMethod(class,
                                swizzledSelector,
                                method_getImplementation(originalMenthod),
                                method_getTypeEncoding(originalMenthod));
        }else{
            method_exchangeImplementations(originalMenthod, swizzledMenthod);
        }
    });
}

- (void)cxl_viewWillAppear:(BOOL)animated {
    [self cxl_viewWillAppear:animated];
    NSLog(@" 执行了viewWillAppear%@", self);
}

@end
