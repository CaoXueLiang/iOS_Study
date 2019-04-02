//
//  MainViewController.m
//  RuntimeStudy
//
//  Created by 曹学亮 on 2018/10/29.
//  Copyright © 2018 Cao Xueliang. All rights reserved.
//

#import "MainViewController.h"
#import "CXLConstants.h"
#import "UIView+CXLView.h"
#import "FirstViewController.h"

@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,copy) NSArray *dataArray;
@end

@implementation MainViewController
#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"首页";
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:self.tableView];
}

#pragma mark - UITableView M
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifidy = @"cellid";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifidy];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifidy];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        [self menthodChanged];
    }else if (indexPath.row == 1){
        [self bindProperty];
    }
}

#pragma mark - Private Menthod
/*
 Runtime应用
 Runtime简直就是做大型框架的利器。它的应用场景非常多，下面就介绍一些常见的应用场景。
 
 1.关联对象(Objective-C Associated Objects)给分类增加属性
 2.方法魔法(Method Swizzling)方法添加和替换和KVO实现
 3.消息转发(热更新)解决Bug(JSPatch)
 4.实现NSCoding的自动归档和自动解档
 5.实现字典和模型的自动转换(MJExtension)
 
 */



/*1.方法交换*/
- (void)menthodChanged{
    FirstViewController *controller = [[FirstViewController alloc]init];
    [self.navigationController pushViewController:controller animated:YES];
}

/**2.为category绑定属性*/
- (void)bindProperty{
    UIView *test = [[UIView alloc]init];
    test.hideButton = [UIButton buttonWithType:UIButtonTypeCustom];
    NSLog(@"runtime动态添加属性:%@",test.hideButton);
}

/**3.字典转model*/
- (void)dictionaryTransformToModel{
    
}

#pragma mark - Setter && Getter
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, KNAVIGATION_BAR_HEIGHT, KSCREEN_WIDTH, KSCREEN_HEIGHT - KNAVIGATION_BAR_HEIGHT) style:UITableViewStylePlain];
        _tableView.separatorColor = [UIColor groupTableViewBackgroundColor];
        _tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _tableView.delegate =self;
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
        _dataArray = @[@"方法交换",@"为category绑定属性"];
    }
    return _dataArray;
}

@end
