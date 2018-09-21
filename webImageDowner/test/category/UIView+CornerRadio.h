//
//  UIView+Corner.h
//  test
//
//  Created by 曹学亮 on 2018/7/4.
//  Copyright © 2018年 Cao Xueliang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CornerRadio)

/**
 设置控件局部圆角

 @param corner 圆角方向
 @param radio 圆角尺寸
 */
- (void)cxl_setCorner:(UIRectCorner)corner radio:(CGFloat)radio;
@end
