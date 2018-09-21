//
//  ViewController.m
//  test
//
//  Created by 曹学亮 on 2018/7/4.
//  Copyright © 2018年 Cao Xueliang. All rights reserved.
//

#import "ViewController.h"
#import "CXLOneController.h"
#import <Masonry/Masonry.h>

@interface ViewController ()
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIImageView *leftImageView;
@property (nonatomic,strong) UIImageView *rightImageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"";
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self addSubviews];
}

- (void)addSubviews{
    self.titleLabel.text = @"测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试";
    [self.view addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(50);
        make.top.equalTo(self.view).offset(100);
        make.height.mas_equalTo(30);
    }];
    [self.titleLabel setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
    [self.titleLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    
    [self.view addSubview:self.leftImageView];
    [self.leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel.mas_right);
        make.size.mas_equalTo(CGSizeMake(18, 18));
        make.centerY.equalTo(self.titleLabel.mas_centerY);
    }];
    
    [self.view addSubview:self.rightImageView];
    [self.rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.leftImageView.mas_right);
        make.size.mas_equalTo(CGSizeMake(18, 18));
        make.centerY.equalTo(self.titleLabel.mas_centerY);
        make.right.equalTo(self.view).offset(-50).priority(999);
    }];
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.textColor = [UIColor blackColor];
    }
    return _titleLabel;
}

- (UIImageView *)leftImageView{
    if (!_leftImageView) {
        _leftImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"关于"]];
    }
    return _leftImageView;
}

- (UIImageView *)rightImageView{
    if (!_rightImageView) {
        _rightImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"常见问题"]];
    }
    return _rightImageView;
}

@end
