//
//  CXLThirdController.m
//  CoreImageStudy
//
//  Created by 曹学亮 on 2019/1/4.
//  Copyright © 2019 Cao Xueliang. All rights reserved.
//

#import "CXLThirdController.h"

@interface CXLThirdController ()

@end

const CGFloat h = 100.0f;
@implementation CXLThirdController
#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.navigationItem.title = @"有选择地专注于图像";
}


#pragma mark - Private Menthod
- (void)createLinearGradient{
    CIFilter* topGradient = [CIFilter filterWithName:@"CILinearGradient"];
    [topGradient setValue:[CIVector vectorWithX:0 Y:(0.85 * h)]
                   forKey:@"inputPoint0"];
    [topGradient setValue:[CIColor colorWithRed:0 green:1 blue:0 alpha:1]
                   forKey:@"inputColor0"];
    [topGradient setValue:[CIVector vectorWithX:0 Y:(0.6 * h)]
                   forKey:@"inputPoint1"];
    [topGradient setValue:[CIColor colorWithRed:0 green:1 blue:0 alpha:0]
                   forKey:@"inputColor1"];
    
    
    CIFilter* bottomGradient = [CIFilter filterWithName:@"CILinearGradient"];
    [bottomGradient setValue:[CIVector vectorWithX:0 Y:(0.35 * h)]
                      forKey:@"inputPoint0"];
    [bottomGradient setValue:[CIColor colorWithRed:0 green:1 blue:0 alpha:1]
                      forKey:@"inputColor0"];
    [bottomGradient setValue:[CIVector vectorWithX:0 Y:(0.6 * h)]
                      forKey:@"inputPoint1"];
    [bottomGradient setValue:[CIColor colorWithRed:0 green:1 blue:0 alpha:0]
                      forKey:@"inputColor1"];
    
    
}




@end
