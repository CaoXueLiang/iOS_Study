//
//  UIViewController+Swizzling.m
//  RuntimeStudy
//
//  Created by 曹学亮 on 2018/11/1.
//  Copyright © 2018 Cao Xueliang. All rights reserved.
//

#import "UIViewController+Swizzling.h"
#import "SMHook.h"


@implementation UIViewController (Swizzling)
+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        SEL originalSelector = @selector(viewWillAppear:);
        SEL swizzledSelector = @selector(cxl_viewWillAppear:);
        [SMHook hookClass:class fromSelector:originalSelector toSelector:swizzledSelector];
    });
}


- (void)cxl_viewWillAppear:(BOOL)animated {
    [self cxl_viewWillAppear:animated];
    NSLog(@"====%@ + viewWillAppear====", NSStringFromClass([self class]));
}

@end
