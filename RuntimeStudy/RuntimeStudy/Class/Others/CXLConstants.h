//
//  CXLConstants.h
//  CommonCategories
//
//  Created by 曹学亮 on 2018/4/27.
//  Copyright © 2018年 caoxueliang.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

//是否是iPhoneX
#define kDevice_Is_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
//状态栏高度
#define KSTATUS_BAR_HEIGHT [[UIApplication sharedApplication] statusBarFrame].size.height
//状态栏和导航栏高度之和
#define KNAVIGATION_BAR_HEIGHT (kDevice_Is_iPhoneX ? 88 : 64)
//底部Tarbar高度
#define KTarbarHeight (kDevice_Is_iPhoneX ? 83 : 49)
//底部安全区域
#define KTabbarSafeBottomMargin (kDevice_Is_iPhoneX ? 34 : 0)
// 得到屏幕高
#define KSCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
// 得到屏幕宽
#define KSCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)


//从Bundle中获得图片
#define KImageFromBundle(name) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(name) ofType:@"png"]]
//主window
#define kKeyWindow [UIApplication sharedApplication].keyWindow
//RGB颜色值
#define RGB(r, g, b) [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.0]
//打印完整的log数据
#define SLog(format, ...) printf("class: <%p %s:(%d) > method: %s \n%s\n", self, [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, __PRETTY_FUNCTION__, [[NSString stringWithFormat:(format), ##__VA_ARGS__] UTF8String] )


