//
//  CXLCollectionViewModel.m
//  CoreImageStudy
//
//  Created by 曹学亮 on 2019/1/4.
//  Copyright © 2019 Cao Xueliang. All rights reserved.
//

#import "CXLCollectionViewModel.h"

@implementation CXLCollectionViewModel

- (instancetype)initWithString:(NSString *)paragram{
    self = [super init];
    if (self) {
        _filterParagram = paragram;
        CIImage *tmpImage = [self CXLfilterName:paragram];
        _filterImage = [UIImage imageWithCIImage:tmpImage];
    }
    return self;
}

/**
 获取原始图片
 */
- (CIImage*)CXLfilterName:(NSString *)str{
    /*该CIImage对象本身不是显示图像，而是图像数据。要显示它，您必须将其转换为其他类型，例如UIImage*/
    NSURL* imageURL = [[NSBundle mainBundle] URLForResource:@"textImage" withExtension:@"jpg"];
    CIImage* originalCIImage = [CIImage imageWithContentsOfURL:imageURL];
    CIFilter* sepiaFilter = [CIFilter filterWithName:str];
    [sepiaFilter setValue:originalCIImage forKey:kCIInputImageKey];
    [sepiaFilter setDefaults];
    return sepiaFilter.outputImage;
}

@end
