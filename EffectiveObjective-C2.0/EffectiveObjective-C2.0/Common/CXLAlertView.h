//
//  CXLAlertView.h
//  EffectiveObjective-C2.0
//
//  Created by 曹学亮 on 2018/3/19.
//  Copyright © 2018年 Cao Xueliang. All rights reserved.
//

#import <UIKit/UIKit.h>

/** 点击按钮回调 */
typedef void (^CXLHandleBlock) (NSInteger index);

@interface CXLAlertView : UIAlertView
@property (nonatomic,copy) CXLHandleBlock block;
@end
