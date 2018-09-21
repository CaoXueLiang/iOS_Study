//
//  CXLDownloadQueue.m
//  tests
//
//  Created by 曹学亮 on 2018/9/19.
//  Copyright © 2018年 Cao Xueliang. All rights reserved.
//

#import "CXLDownloadQueue.h"

@implementation CXLDownloadQueue

/**
 单例初始化
 @return 下载队列
 */
+ (instancetype)downLoadQueue{
    static dispatch_once_t onceToken;
    static CXLDownloadQueue *manager = nil;
    dispatch_once(&onceToken, ^{
        if (!manager) manager = [[CXLDownloadQueue alloc] init];
    });
    
    return manager;
}

@end
