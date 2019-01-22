//
//  CXLNormalCollectionViewCell.h
//  CoreImageStudy
//
//  Created by 曹学亮 on 2019/1/3.
//  Copyright © 2019 Cao Xueliang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class CXLCollectionViewModel;
@interface CXLNormalCollectionViewCell : UICollectionViewCell
@property (nonatomic,strong) CXLCollectionViewModel *model;
+ (CGSize)cellSize;
@end

NS_ASSUME_NONNULL_END
