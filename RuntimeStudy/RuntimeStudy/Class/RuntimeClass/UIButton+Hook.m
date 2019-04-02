//
//  UIButton+Hook.m
//  RuntimeStudy
//
//  Created by 曹学亮 on 2019/4/1.
//  Copyright © 2019 Cao Xueliang. All rights reserved.
//

#import "UIButton+Hook.h"
#import "SMHook.h"

@implementation UIButton (Hook)
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // 通过 @selector 获得被替换和替换方法的 SEL，作为 SMHook:hookClass:fromeSelector:toSelector 的参数传入
        SEL fromSelector = @selector(sendAction:to:forEvent:);
        SEL toSelector = @selector(hook_sendAction:to:forEvent:);
        [SMHook hookClass:self fromSelector:fromSelector toSelector:toSelector];
    });
}


- (void)hook_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    [self hook_sendAction:action to:target forEvent:event];
    
    NSString *actionString = NSStringFromSelector(action);
    NSString *targetName = NSStringFromClass([target class]);
    NSLog(@"%@",[NSString stringWithFormat:@"===%@ + %@=====",targetName,actionString]);
}


@end
