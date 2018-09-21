//
//  CXLImageDownloadManager.m
//  tests
//
//  Created by 曹学亮 on 2018/9/18.
//  Copyright © 2018年 Cao Xueliang. All rights reserved.
//

#import "CXLImageDownloader.h"
#import "CXLDownloadQueue.h"

@implementation CXLImageDownloader
/**初始化单例*/
+ (instancetype)shareManager{
    static dispatch_once_t onceToken;
    static CXLImageDownloader *manager = nil;
    dispatch_once(&onceToken, ^{
        if (!manager) manager = [[CXLImageDownloader alloc] init];
    });
    
    return manager;
}

/**使用NSData下载一张图片*/
- (void)downloadImageWithDataWithImageStr:(NSString*)imageStr complete:(DownloadCompleteBlock)block{
    NSURL *url = [NSURL URLWithString:imageStr];
    NSData *imageData = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:imageData];
    block(image,imageData);
}

/**使用NSData异步下载一张图片*/
- (void)downLoadImageAsynchWithImageStr:(NSString*)imageStr complete:(DownloadCompleteBlock)block{
    NSURL *url = [NSURL URLWithString:imageStr];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSData *imageData = [NSData dataWithContentsOfURL:url options:NSDataReadingMappedIfSafe error:nil];
        if (imageData) {
            dispatch_async(dispatch_get_main_queue(), ^{
                UIImage *downImage = [UIImage imageWithData:imageData];
                block(downImage,imageData);
            });
        }
    });
}

/**使用NSURLSession异步下载一张图片*/
- (void)downLoadImageWithSessionWithImageStr:(NSString*)imageStr complete:(DownloadCompleteBlock)block{
    NSURL *url = [NSURL URLWithString:imageStr];
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    //作为一个图片下载器肯定是支持异步下载的
    [[session downloadTaskWithURL:url completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (!error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                NSData *imageData = [NSData dataWithContentsOfURL:location];
                UIImage *downImage = [UIImage imageWithData:imageData];
                block(downImage,imageData);
            });
        }
    }] resume];
}



#pragma mark - 下载多个图片
- (void)loadImageWithImageUrl:(NSString *)imageStr completeBlock:(DownloadCompleteBlock)block{
    __weak typeof(self) weakSelf = self;
    NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
        [weakSelf downOneImageWithImageUrl:imageStr completeBlock:block];
    }];
    [[CXLDownloadQueue downLoadQueue] addOperation:operation];
}

- (void)downOneImageWithImageUrl:(NSString*)urlStr completeBlock:(DownloadCompleteBlock)block{
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    NSURL *url = [NSURL URLWithString:urlStr];
    
    //作为一个图片下载器肯定是支持异步下载的
    [[session downloadTaskWithURL:url completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (!error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                /**在主线程中回调图片*/
                NSData *imageData = [NSData dataWithContentsOfURL:location];
                UIImage *image = [UIImage imageWithData:imageData];
                block(image,imageData);
            });
        }
    }] resume];
}

@end
