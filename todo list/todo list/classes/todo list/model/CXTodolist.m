//
//  CXTodolist.m
//  todo list
//
//  Created by 陈曦 on 16/8/16.
//  Copyright © 2016年 chenxi. All rights reserved.
//

#import "CXTodolist.h"

@implementation CXTodolist

static NSString *somgthingKey = @"something";

- (void)encodeWithCoder:(NSCoder *)aCoder{



    [aCoder encodeObject:_something forKey:somgthingKey];

}
- (id)initWithCoder:(NSCoder *)aDecoder{

    if (self = [super init]) {
        _something = [aDecoder decodeObjectForKey:somgthingKey];
    }

    return self;

}


+ (instancetype)todolistWithsomething:(NSString*)something
{

    CXTodolist *todo =[[self alloc]init];
    
    todo.something = something;
    
    return todo;

}
@end
