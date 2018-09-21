//
//  UIView+Corner.m
//  test
//
//  Created by 曹学亮 on 2018/7/4.
//  Copyright © 2018年 Cao Xueliang. All rights reserved.
//

#import "UIView+CornerRadio.h"

@implementation UIView (CornerRadio)
- (void)cxl_setCorner:(UIRectCorner)corner radio:(CGFloat)radio{
    CGRect rect = self.bounds;
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corner cornerRadii:CGSizeMake(radio, radio)];
    CAShapeLayer *shaperLayer = [[CAShapeLayer alloc]init];
    shaperLayer.frame = rect;
    shaperLayer.path = bezierPath.CGPath;
    self.layer.mask = shaperLayer;
}
@end
