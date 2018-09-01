//
//  List.h
//  Interview
//
//  Created by 曹学亮 on 2018/8/24.
//  Copyright © 2018年 Cao Xueliang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ListNode;
@interface List : NSObject
@property (nonatomic,strong) ListNode *headNode;
@property (nonatomic,strong) ListNode *tailNode;
/**头插法*/
- (void)appendToHead:(int)index;
/**尾插法*/
- (void)appendToTail:(int)index;
@end
