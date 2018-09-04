//
//  ListNode.m
//  Interview
//
//  Created by 曹学亮 on 2018/8/24.
//  Copyright © 2018年 Cao Xueliang. All rights reserved.
//

#import "ListNode.h"

@implementation ListNode
#pragma mark - Init Menthod
- (instancetype)init{
    self = [super init];
    if (self) {
        _val= 0;
        _nextNode = nil;
    }
    return self;
}

- (instancetype)initWithIndex:(int)val{
    self = [super init];
    if (self) {
        _val = val;
        _nextNode = nil;
    }
    return self;
}
@end
