//
//  CXLMainController.m
//  CoreImageStudy
//
//  Created by 曹学亮 on 2019/1/3.
//  Copyright © 2019 Cao Xueliang. All rights reserved.
//

#import "CXLMainController.h"
#import "CXLNormalCell.h"
#import "CXLFirstController.h"
#import "CXLSecondController.h"
#import "CXLThirdController.h"

@interface CXLMainController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,copy) NSArray *dataArray;
@end

@implementation CXLMainController
#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"首页";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
}

#pragma mark - UITableView M
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CXLNormalCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CXLNormalCell" forIndexPath:indexPath];
    [cell setTitle:self.dataArray[indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        CXLFirstController *controller = [[CXLFirstController alloc]init];
        [self.navigationController pushViewController:controller animated:YES];
    }else if (indexPath.row == 1){
        CXLSecondController *controller = [[CXLSecondController alloc]init];
        [self.navigationController pushViewController:controller animated:YES];
    }else if (indexPath.row == 2){
        CXLThirdController *controller = [[CXLThirdController alloc]init];
        [self.navigationController pushViewController:controller animated:YES];
    }
}

#pragma mark - Setter && Getter
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, KNAVIGATION_BAR_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT - KNAVIGATION_BAR_HEIGHT) style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.tableFooterView = [UIView new];
        [_tableView registerClass:[CXLNormalCell class] forCellReuseIdentifier:@"CXLNormalCell"];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        if (@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
            _tableView.estimatedRowHeight = 0;
            _tableView.estimatedSectionFooterHeight = 0;
            _tableView.estimatedSectionHeaderHeight = 0;
        } else {
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
    }
    return _tableView;
}

- (NSArray *)dataArray{
    if (!_dataArray) {
        _dataArray = @[@"使用内置过滤器处理图像",@"应用色度键效果 (将一个图像中的颜色替换为另一个图像中的背景)",@"有选择地专注于图像 (通过应用高斯模糊和渐变蒙版来聚焦图像的一部分)"];
    }
    return _dataArray;
}

@end
