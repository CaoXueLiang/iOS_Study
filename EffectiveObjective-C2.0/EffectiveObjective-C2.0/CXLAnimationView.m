//
//  CXLAnimationView.m
//  EffectiveObjective-C2.0
//
//  Created by 曹学亮 on 2017/12/26.
//  Copyright © 2017年 Cao Xueliang. All rights reserved.
//

#import "CXLAnimationView.h"
/*
 * 若常量局限于某编译单元，也就是实现文件
 * 则在其前面加`K`
 */
//static const NSTimeInterval KAnimationDuration = 0.3;

/*
 * 若常量在类之外可见
 * 则通常以类名为前缀
 */
const NSTimeInterval CXLAnimationViewAnimationDuration = 0.3;

@implementation CXLAnimationView
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self animation];
    }
    return self;
}

- (void)animation{
    [UIView animateWithDuration:CXLAnimationViewAnimationDuration animations:^{
        
    }];
}

@end
