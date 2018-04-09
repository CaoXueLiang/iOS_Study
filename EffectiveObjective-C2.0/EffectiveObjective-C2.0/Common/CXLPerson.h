//
//  CXLPerson.h
//  EffectiveObjective-C2.0
//
//  Created by 曹学亮 on 2018/3/25.
//  Copyright © 2018年 Cao Xueliang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CXLPerson : NSObject<NSCopying>
@property (nonatomic,copy,readonly) NSString *firstName;
@property (nonatomic,copy,readonly) NSString *lastName;
- (id)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName;
@end
