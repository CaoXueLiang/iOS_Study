//
//  CXLWebImageManager.h
//  test
//
//  Created by 曹学亮 on 2018/9/19.
//  Copyright © 2018年 Cao Xueliang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
/**下载完后的回调*/
typedef void (^CXLImageDownloadCompleteBlock)(UIImage *image);
@interface CXLWebImageManager : NSObject

/**
 初始化单例
 @return 图片下载manager
 */
+ (nonnull instancetype)sharedManager;


/**
 图片下载
 @param imageURLStr 图片地址
 @param block 图片下载完成回调
 */
- (void)loadImageWithImageUrl:(NSString *)imageURLStr downloadComplete:(CXLImageDownloadCompleteBlock)block;

@end

NS_ASSUME_NONNULL_END
