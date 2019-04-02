//
//  SMHook.h
//  RuntimeStudy
//
//  Created by 曹学亮 on 2019/4/1.
//  Copyright © 2019 Cao Xueliang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 runtime帮助类
 */
@interface SMHook : NSObject

/**
 方法交换
 @param classObject Class类
 @param fromSelector 被替换的方法
 @param toSelector 替换后的方法
 */
+ (void)hookClass:(Class)classObject fromSelector:(SEL)fromSelector toSelector:(SEL)toSelector;

@end

NS_ASSUME_NONNULL_END
