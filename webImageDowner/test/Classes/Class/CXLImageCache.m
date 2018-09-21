//
//  CXLImageCache.m
//  test
//
//  Created by 曹学亮 on 2018/9/19.
//  Copyright © 2018年 Cao Xueliang. All rights reserved.
//

#import "CXLImageCache.h"

@interface CXLImageCache()
@property (nonatomic,strong) NSCache *memeoryCache;
@property (nonatomic,strong) NSFileManager *fileManager;
@property (nonatomic,strong) NSString *diskCachePath;
@end

@implementation CXLImageCache
#pragma mark - Init Menthod
/**
 初始化`CXLImageCache`单例
 @return 单例
 */
+ (instancetype)sharedImageCache{
    static dispatch_once_t once;
    static CXLImageCache *instance;
    dispatch_once(&once, ^{
        instance = [CXLImageCache new];
    });
    return instance;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        _memeoryCache = [[NSCache alloc]init];
        _fileManager = [NSFileManager new];
        _diskCachePath = [self p_getDiskCachePath];
    }
    return self;
}

#pragma mark - Public Menthod
- (void)storeImage:(UIImage *)image imageData:(NSData *)imageData forKey:(NSString *)key{
    if (!image || !imageData || !key) {
        return;
    }
    //将图片存到内存缓存
    [self.memeoryCache setObject:image forKey:key];
    
    //将图片存到磁盘缓存
    if (![self.fileManager fileExistsAtPath:_diskCachePath]) {
        [self.fileManager createDirectoryAtPath:_diskCachePath withIntermediateDirectories:YES attributes:nil error:NULL];
    }
    NSString *imageName = [[key componentsSeparatedByString:@"/"] lastObject] ? : @"";
    NSString *currentString = [_diskCachePath stringByAppendingPathComponent:imageName];
    [imageData writeToFile:currentString atomically:YES];
     NSLog(@"%@",currentString);
}


- (UIImage *)imageFromMemoryCacheForKey:(NSString *)key {
    return [self.memeoryCache objectForKey:key];
}


- (UIImage *)imageFromDiskCacheForKey:(NSString *)key {
    //磁盘图片缓存地址
    NSString *imageName = [[key componentsSeparatedByString:@"/"] lastObject] ? : @"";
    NSString *currentString = [_diskCachePath stringByAppendingPathComponent:imageName];
    NSData *imageData = [NSData dataWithContentsOfFile:currentString options:NSDataReadingMappedIfSafe error:nil];
    if (imageData) {
        UIImage *image = [UIImage imageWithData:imageData];
        [self.memeoryCache setObject:image forKey:key];
        return image;
    }
    return nil;
}

#pragma mark - Private Menthod
- (NSString *)p_getDiskCachePath{
    NSString *fullNamespace = @"default";
    NSArray<NSString *> *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    return [paths[0] stringByAppendingPathComponent:fullNamespace];
}

@end
