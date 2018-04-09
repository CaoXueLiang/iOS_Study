//
//  CXLAlertView.m
//  EffectiveObjective-C2.0
//
//  Created by 曹学亮 on 2018/3/19.
//  Copyright © 2018年 Cao Xueliang. All rights reserved.
//

#import "CXLAlertView.h"

@implementation CXLAlertView

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message delegate:(id)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ...{
    self = [super initWithTitle:title message:message delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles:otherButtonTitles];
    return self;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    
}

@end
