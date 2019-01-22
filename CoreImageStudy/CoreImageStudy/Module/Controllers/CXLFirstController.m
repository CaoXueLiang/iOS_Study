//
//  CXLFirstController.m
//  CoreImageStudy
//
//  Created by 曹学亮 on 2019/1/3.
//  Copyright © 2019 Cao Xueliang. All rights reserved.
//

#import "CXLFirstController.h"
#import "CXLCollectionViewModel.h"
#import "CXLNormalCollectionViewCell.h"

@interface CXLFirstController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong) UICollectionView *myCollection;
@property (nonatomic,strong) UIImageView *contentImageView;
@property (nonatomic,strong) NSMutableArray *dataArray;
@end

@implementation CXLFirstController
#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.navigationItem.title = @"First";
    [self.view addSubview:self.contentImageView];
    [self.view  addSubview:self.myCollection];
    self.contentImageView.image = [UIImage imageNamed:@"textImage.jpg"];
}

#pragma mark - UICollectionView  M
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CXLCollectionViewModel *model = self.dataArray[indexPath.row];
    CXLNormalCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CXLNormalCollectionViewCell" forIndexPath:indexPath];
    cell.model = model;
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return [CXLNormalCollectionViewCell cellSize];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    CXLCollectionViewModel *model = self.dataArray[indexPath.row];
    self.contentImageView.image = model.filterImage;
}

#pragma mark - Setter && Getter
- (UICollectionView *)myCollection{
    if (!_myCollection) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = 10;
        layout.sectionInset = UIEdgeInsetsMake(10, 20, 10, 20);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _myCollection = [[UICollectionView alloc]initWithFrame:CGRectMake(0, kScreenHeight - 180 - 20, kScreenWidth, 180) collectionViewLayout:layout];
        [_myCollection registerClass:[CXLNormalCollectionViewCell class] forCellWithReuseIdentifier:@"CXLNormalCollectionViewCell"];
        _myCollection.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _myCollection.showsHorizontalScrollIndicator = NO;
        _myCollection.delegate = self;
        _myCollection.dataSource = self;
    }
    return _myCollection;
}

- (UIImageView *)contentImageView{
    if (!_contentImageView) {
        _contentImageView = [[UIImageView alloc]initWithFrame:CGRectMake(40, KNAVIGATION_BAR_HEIGHT + 20, SCREEN_WIDTH - 80, SCREEN_HEIGHT - KNAVIGATION_BAR_HEIGHT - 180)];
        _contentImageView.contentMode = UIViewContentModeScaleAspectFill;
        _contentImageView.clipsToBounds = YES;
    }
    return _contentImageView;
}

- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc]init];
        NSArray *tmpArray = @[@"CIBoxBlur",@"CIDiscBlur",@"CIGaussianBlur",@"CIMaskedVariableBlur",@"CIMedianFilter",@"CIMotionBlur",@"CINoiseReduction",@"CIZoomBlur"
                              
             ,@"CIColorClamp",@"CIColorControls",@"CIColorMatrix",@"CIColorPolynomial",@"CIExposureAdjust",@"CIGammaAdjust",@"CIHueAdjust",@"CILinearToSRGBToneCurve",@"CISRGBToneCurveToLinear",@"CITemperatureAndTint",@"CIToneCurve",@"CIVibrance",@"CIWhitePointAdjust",
                              
        @"CIColorCrossPolynomial",@"CIColorCube",@"CIColorCubeWithColorSpace",@"CIColorInvert",@"CIColorMonochrome",@"CIColorPosterize",@"CIFalseColor",@"CIMaximumComponent",@"CIMinimumComponent",@"CIPhotoEffectChrome",@"CIPhotoEffectFade",@"CIPhotoEffectInstant",@"CIPhotoEffectMono",@"CIPhotoEffectNoir",@"CIPhotoEffectProcess",@"CIPhotoEffectTonal",@"CIPhotoEffectTransfer",@"CISepiaTone",@"CIVignette",@"CIVignetteEffect",
                              
           @"CIColorBlendMode",  @"CIColorBurnBlendMode",@"CIDarkenBlendMode", @"CIDifferenceBlendMode",@"CIDivideBlendMode", @"CIExclusionBlendMode",@"CIHardLightBlendMode", @"CIHueBlendMode",@"CILightenBlendMode", @"CILinearBurnBlendMode",@"CILinearDodgeBlendMode", @"CILuminosityBlendMode",@"CIMultiplyBlendMode",@"CIOverlayBlendMode", @"CIPinLightBlendMode",@"CISaturationBlendMode", @"CIScreenBlendMode",@"CISoftLightBlendMode", @"CISubtractBlendMode",
                 
                @"CIBloom",@"CIComicEffect",@"CIConvolution3X3",@"CIConvolution5X5",@"CIConvolution7X7",@"CIConvolution9Horizontal",@"CIConvolution9Vertical",@"CICrystallize",@"CIDepthOfField",@"CIEdges",@"CIGloom",@"CIHeightFieldFromMask",@"CIHexagonalPixellate",@"CIHighlightShadowAdjust",@"CILineOverlay",@"CIPixellate",@"CIPointillize",@"CISpotColor",@"CISpotLight",
                     ];
        [tmpArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            CXLCollectionViewModel *model = [[CXLCollectionViewModel alloc]initWithString:obj];
            [_dataArray addObject:model];
        }];
    }
    return _dataArray;
}

@end

