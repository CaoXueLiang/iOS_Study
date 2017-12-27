//
//  CXLLogin.m
//  EffectiveObjective-C2.0
//
//  Created by 曹学亮 on 2017/12/26.
//  Copyright © 2017年 Cao Xueliang. All rights reserved.
//

#import "CXLLogin.h"

NSString *const CXLLoginDidLoginNotification = @"CXLLoginDidLoginNotification";

@implementation CXLLogin
- (instancetype)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)p_didLogin{
    [[NSNotificationCenter defaultCenter] postNotificationName:CXLLoginDidLoginNotification object:nil];
}

@end
