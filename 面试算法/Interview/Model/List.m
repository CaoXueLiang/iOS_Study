//
//  List.m
//  Interview
//
//  Created by 曹学亮 on 2018/8/24.
//  Copyright © 2018年 Cao Xueliang. All rights reserved.
//

#import "List.h"
#import "ListNode.h"

@implementation List
#pragma mark - Public Menthod
- (void)appendToHead:(int)index{
    if (!_headNode) {
        _headNode = [[ListNode alloc]initWithIndex:index];
        _tailNode = _headNode;
    }else{
        ListNode  *node = [[ListNode alloc]initWithIndex:index];
        node.nextNode = _headNode;
        _headNode = node;
    }
}


- (void)appendToTail:(int)index{
    if (!_tailNode) {
        _tailNode = [[ListNode alloc]initWithIndex:index];
        _headNode = _tailNode;
    }else{
        _tailNode.nextNode = [[ListNode alloc]initWithIndex:index];
        _tailNode = _tailNode.nextNode;
    }
}

@end
