//
//  CXLImageDownloadManager.h
//  tests
//
//  Created by 曹学亮 on 2018/9/18.
//  Copyright © 2018年 Cao Xueliang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**图片下载完成后回调*/
typedef void (^DownloadCompleteBlock)(UIImage *image,NSData *imageData);

/**
 图片下载类
 */
@interface CXLImageDownloader : NSObject

/**
 初始化下载器单例
 @return 下载类单例
 */
+ (instancetype)shareManager;


/**
 下载图片
 @param imageStr 图片地址
 @param block 下载完成后的回调
 */
- (void)loadImageWithImageUrl:(NSString *)imageStr completeBlock:(DownloadCompleteBlock)block;

@end
