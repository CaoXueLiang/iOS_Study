//
//  CXLTableViewCell.m
//  tests
//
//  Created by 曹学亮 on 2018/9/19.
//  Copyright © 2018年 Cao Xueliang. All rights reserved.
//

#import "CXLTableViewCell.h"
#import "CXLWebImageManager.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface CXLTableViewCell()
@property (nonatomic,strong) UIImageView *topImageView;
@end

@implementation CXLTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _topImageView = [[UIImageView alloc]init];
        _topImageView.contentMode = UIViewContentModeScaleAspectFill;
        _topImageView.clipsToBounds = YES;
        _topImageView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 150);
        [self.contentView addSubview:_topImageView];
    }
    return self;
}

- (void)setImageStr:(NSString *)imageStr{
    __weak typeof(self) weakSelf = self;
    [[CXLWebImageManager sharedManager] loadImageWithImageUrl:imageStr downloadComplete:^(UIImage * _Nonnull image) {
        weakSelf.topImageView.image = image;
    }];
}

@end
