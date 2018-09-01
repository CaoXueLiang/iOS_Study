//
//  ListNode.h
//  Interview
//
//  Created by 曹学亮 on 2018/8/24.
//  Copyright © 2018年 Cao Xueliang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListNode : NSObject
@property (nonatomic,assign) int val;
@property (nonatomic,strong) ListNode *nextNode;
- (instancetype)initWithIndex:(int)val;
@end
