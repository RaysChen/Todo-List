//
//  CXTodolist.m
//  todo list
//
//  Created by 陈曦 on 16/8/16.
//  Copyright © 2016年 chenxi. All rights reserved.
//

#import "CXTodolist.h"

@implementation CXTodolist

+ (instancetype)todolistWithsomething:(NSString*)something
{

    CXTodolist *todo =[[self alloc]init];
    
    todo.something = something;
    
    return todo;

}
@end
