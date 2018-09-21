//
//  CXLImageCache.h
//  test
//
//  Created by 曹学亮 on 2018/9/19.
//  Copyright © 2018年 Cao Xueliang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 图片缓存类
 */
@interface CXLImageCache : NSObject

/**
 初始化单例
 @return 缓存对象单例
 */
+ (instancetype)sharedImageCache;


/**
 存储图片到内存缓存和磁盘缓存
 @param image 图片
 @param imageData 图片数据
 @param key 图片URL唯一标示
 */
- (void)storeImage:(UIImage *)image imageData:(NSData *)imageData forKey:(NSString *)key;


/**
 根据key获取内存缓存中的图片
 @param key 缓存key
 @return 图片
 */
- (UIImage *)imageFromMemoryCacheForKey:(NSString *)key;


/**
 根据key获取磁盘中的图片
 @param key 缓存key
 @return 图片
 */
- (UIImage *)imageFromDiskCacheForKey:(NSString *)key;


@end

NS_ASSUME_NONNULL_END
