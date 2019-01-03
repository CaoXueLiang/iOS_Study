//
//  UIView+CXLView.m
//  RuntimeStudy
//
//  Created by 曹学亮 on 2018/10/29.
//  Copyright © 2018 Cao Xueliang. All rights reserved.
//

#import "UIView+CXLView.h"
#include <objc/runtime.h>

static const  void*KButtonKey = @"buttonkey";

@implementation UIView (CXLView)
- (UIButton *)hideButton{
    UIButton *_hideButton = objc_getAssociatedObject(self, KButtonKey);
    if (!_hideButton) {
        _hideButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _hideButton.backgroundColor = [UIColor purpleColor];
        [_hideButton setTitle:@"测试" forState:UIControlStateNormal];
        [_hideButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        //属性关联
        objc_setAssociatedObject(self, KButtonKey, _hideButton, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return _hideButton;
}

- (void)setHideButton:(UIButton *)hideButton{
    objc_setAssociatedObject(self, KButtonKey, hideButton, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
