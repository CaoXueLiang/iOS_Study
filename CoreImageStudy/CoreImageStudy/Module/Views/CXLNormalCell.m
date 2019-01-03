//
//  CXLNormalCell.m
//  CoreImageStudy
//
//  Created by 曹学亮 on 2019/1/3.
//  Copyright © 2019 Cao Xueliang. All rights reserved.
//

#import "CXLNormalCell.h"

@interface CXLNormalCell()
@property (nonatomic,strong) UILabel *titleLabel;
@end

@implementation CXLNormalCell
#pragma mark - Init Menthod
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubViews];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        [self addSubViews];
    }
    return self;
}

- (void)addSubViews{
    
}

#pragma mark - Setter && Getter
- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.font = [UIFont systemFontOfSize:14];
    }
    return _titleLabel;
}

@end
