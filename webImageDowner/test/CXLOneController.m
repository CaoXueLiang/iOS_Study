//
//  ViewController.m
//  tests
//
//  Created by 曹学亮 on 2018/8/14.
//  Copyright © 2018年 Cao Xueliang. All rights reserved.
//

#import "CXLOneController.h"
#import "CXLTableViewCell.h"
#import "CXLImageCache.h"
#import "CXLImageDownloader.h"
#import "CXLWebImageManager.h"

@interface CXLOneController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *myTable;
@property (nonatomic,copy) NSArray *urlArray;
@end

typedef void (^DownOneImageBlock)(UIImage *image);
@implementation CXLOneController
#pragma mark - lifeCycle Menthod
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.myTable];
    
    
    NSCache *cache = [[NSCache alloc]init];
    [cache setObject:@"111111111111" forKey:@"test"];
    
    NSLog(@"%@",[cache objectForKey:@"test"]);
}


#pragma mark - UITableView Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 12;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CXLTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CXLTableViewCell" forIndexPath:indexPath];
    NSString *urlStr = self.urlArray[indexPath.row];
    [cell setImageStr:urlStr];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150.0f;
}


#pragma mark - Setter && getter
- (UITableView *)myTable{
    if (!_myTable) {
        _myTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
        [_myTable registerClass:[CXLTableViewCell class] forCellReuseIdentifier:@"CXLTableViewCell"];
        _myTable.delegate = self;
        _myTable.dataSource = self;
    }
    return _myTable;
}

- (NSArray *)urlArray{
    if (!_urlArray) {
        _urlArray = @[@"https://upload-images.jianshu.io/upload_images/979175-66011922f53e300b.jpg",
                      @"https://upload-images.jianshu.io/upload_images/979175-60a409968278671f.jpg",
                      @"https://upload-images.jianshu.io/upload_images/979175-d96f1811396ff7a0.png",
                      @"https://upload-images.jianshu.io/upload_images/979175-f2d89cdb4ca34221.png",
                      @"https://upload-images.jianshu.io/upload_images/979175-66011922f53e300b.jpg",
                      @"https://upload-images.jianshu.io/upload_images/979175-60a409968278671f.jpg",
                      @"https://upload-images.jianshu.io/upload_images/979175-d96f1811396ff7a0.png",
                      @"https://upload-images.jianshu.io/upload_images/979175-f2d89cdb4ca34221.png",
                      @"https://upload-images.jianshu.io/upload_images/979175-66011922f53e300b.jpg",
                      @"https://upload-images.jianshu.io/upload_images/979175-60a409968278671f.jpg",
                      @"https://upload-images.jianshu.io/upload_images/979175-d96f1811396ff7a0.png",
                      @"https://upload-images.jianshu.io/upload_images/979175-f2d89cdb4ca34221.png",
                      ];
    }
    return _urlArray;
}

@end


