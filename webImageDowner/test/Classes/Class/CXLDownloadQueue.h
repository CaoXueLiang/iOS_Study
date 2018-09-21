//
//  CXLDownloadQueue.h
//  tests
//
//  Created by 曹学亮 on 2018/9/19.
//  Copyright © 2018年 Cao Xueliang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 下载线程
 */
@interface CXLDownloadQueue : NSOperationQueue
+ (instancetype)downLoadQueue;
@end

NS_ASSUME_NONNULL_END
