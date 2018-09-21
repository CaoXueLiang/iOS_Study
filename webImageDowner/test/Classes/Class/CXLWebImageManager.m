//
//  CXLWebImageManager.m
//  test
//
//  Created by 曹学亮 on 2018/9/19.
//  Copyright © 2018年 Cao Xueliang. All rights reserved.
//

#import "CXLWebImageManager.h"
#import "CXLImageDownloader.h"
#import "CXLImageCache.h"

@interface CXLWebImageManager()
@property (nonatomic,strong) CXLImageDownloader *imageDownloader;
@property (nonatomic,strong) CXLImageCache *imageCache;
@end

@implementation CXLWebImageManager
#pragma mark - init menthod
+ (nonnull instancetype)sharedManager {
    static dispatch_once_t once;
    static id instance;
    dispatch_once(&once, ^{
        instance = [self new];
    });
    return instance;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        CXLImageCache *cache = [CXLImageCache sharedImageCache];
        CXLImageDownloader *downLoader = [CXLImageDownloader shareManager];
        _imageCache = cache;
        _imageDownloader = downLoader;
    }
    return self;
}

#pragma mark - download Menthod
- (void)saveImageToCache:(UIImage *)image imageData:(NSData *)imageData forURLString:(NSString *)urlString {
    if (image && imageData && urlString) {
        [self.imageCache storeImage:image imageData:imageData forKey:urlString];
    }
}

- (void)loadImageWithImageUrl:(NSString *)imageURLStr downloadComplete:(CXLImageDownloadCompleteBlock)block
{
    UIImage *memoeyCacheImage = [self.imageCache imageFromMemoryCacheForKey:imageURLStr];
    
    NSLog(@"%@",[self.imageCache imageFromMemoryCacheForKey:imageURLStr]);
    
    UIImage *diskCacheImage = [self.imageCache imageFromDiskCacheForKey:imageURLStr];
    if (memoeyCacheImage) {
        //图片存在内存缓存
        block(memoeyCacheImage);
    }else if (diskCacheImage){
        //图片存在磁盘缓存
        block(diskCacheImage);
    }else{
       //图片没存在缓存中
        [self.imageDownloader loadImageWithImageUrl:imageURLStr completeBlock:^(UIImage *image, NSData *imageData) {
            [self.imageCache storeImage:image imageData:imageData forKey:imageURLStr];
            block(image);
        }];
    }
}

@end
