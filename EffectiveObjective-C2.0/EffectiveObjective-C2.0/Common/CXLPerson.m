//
//  CXLPerson.m
//  EffectiveObjective-C2.0
//
//  Created by 曹学亮 on 2018/3/25.
//  Copyright © 2018年 Cao Xueliang. All rights reserved.
//

#import "CXLPerson.h"

@implementation CXLPerson{
    NSMutableSet *_friends;
}

#pragma mark - Init Menthod
- (id)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName{
    self = [super init];
    if (self) {
        _firstName = firstName;
        _lastName = lastName;
        _friends = [NSMutableSet new];
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone{
    CXLPerson *person = [[[self class] alloc]initWithFirstName:_firstName lastName:_lastName];
    //注意这里使用 -> 语法，因为_friends并非属性，只是个在内部使用的实例变量。
    person -> _friends = [_friends mutableCopy];
    return person;
}

@end
