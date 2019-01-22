//
//  CXLNormalCollectionViewCell.m
//  CoreImageStudy
//
//  Created by 曹学亮 on 2019/1/3.
//  Copyright © 2019 Cao Xueliang. All rights reserved.
//

#import "CXLNormalCollectionViewCell.h"
#import "CXLCollectionViewModel.h"

@interface CXLNormalCollectionViewCell()
@property (nonatomic,strong) UIImageView *tmpImageView;
@property (nonatomic,strong) UILabel *filterParagramLabel;
@end

@implementation CXLNormalCollectionViewCell
#pragma mark - Init Menthod
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self addSubViews];
    }
    return self;
}

- (void)addSubViews{
    [self.contentView addSubview:self.tmpImageView];
    [self.tmpImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.contentView);
        make.bottom.equalTo(self.contentView).offset(-30);
    }];
    
    [self.contentView addSubview:self.filterParagramLabel];
    [self.filterParagramLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.contentView);
        make.bottom.equalTo(self.contentView);
        make.top.equalTo(self.tmpImageView.mas_bottom);
    }];
}

- (void)setModel:(CXLCollectionViewModel *)model{
    if (!model) {
        return;
    }
    self.tmpImageView.image = model.filterImage;
    self.filterParagramLabel.text = model.filterParagram;
}

+ (CGSize)cellSize{
    return CGSizeMake(120, 160);
}

#pragma mark - Setter && Getter
- (UIImageView *)tmpImageView{
    if (!_tmpImageView) {
        _tmpImageView = [[UIImageView alloc]init];
        _tmpImageView.contentMode = UIViewContentModeScaleAspectFill;
        _tmpImageView.clipsToBounds = YES;
    }
    return _tmpImageView;
}

- (UILabel *)filterParagramLabel{
    if (!_filterParagramLabel) {
        _filterParagramLabel = [UILabel new];
        _filterParagramLabel.textColor = [UIColor blackColor];
        _filterParagramLabel.font = [UIFont systemFontOfSize:12];
        _filterParagramLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _filterParagramLabel;
}

@end
