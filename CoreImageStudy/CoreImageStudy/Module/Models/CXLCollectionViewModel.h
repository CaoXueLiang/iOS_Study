//
//  CXLCollectionViewModel.h
//  CoreImageStudy
//
//  Created by 曹学亮 on 2019/1/4.
//  Copyright © 2019 Cao Xueliang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CXLCollectionViewModel : NSObject
@property (nonatomic,copy) NSString *filterParagram;
@property (nonatomic,strong) UIImage *filterImage;

- (instancetype)initWithString:(NSString *)paragram;
@end

NS_ASSUME_NONNULL_END
