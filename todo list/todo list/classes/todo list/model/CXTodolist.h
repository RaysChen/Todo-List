//
//  CXTodolist.h
//  todo list
//
//  Created by 陈曦 on 16/8/16.
//  Copyright © 2016年 chenxi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CXTodolist : NSObject<NSCoding>


@property (nonatomic, strong)NSString *something;

+ (instancetype)todolistWithsomething:(NSString*)something;

@end


