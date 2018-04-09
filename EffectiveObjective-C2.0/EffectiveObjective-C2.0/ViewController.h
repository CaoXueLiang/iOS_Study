//
//  ViewController.h
//  EffectiveObjective-C2.0
//
//  Created by 曹学亮 on 2017/12/26.
//  Copyright © 2017年 Cao Xueliang. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,Type) {
    TypeOne,
    TypeWwo,
};

typedef NS_OPTIONS(NSInteger, State) {
    StateOne   = 1 << 0,
    StateTwo   = 1 << 1,
    StateThree = 1 << 2,
};

@interface ViewController : UIViewController
@property (nonatomic,copy,readonly) NSString *tipString;
@end

