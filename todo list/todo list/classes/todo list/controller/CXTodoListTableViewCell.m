//
//  CXTodoListTableViewCell.m
//  todo list
//
//  Created by 陈曦 on 16/8/19.
//  Copyright © 2016年 chenxi. All rights reserved.
//

#import "CXTodoListTableViewCell.h"
#import "CXTodolist.h"

@implementation CXTodoListTableViewCell



- (void)loadData:(CXTodolist *)data{
    self.textLabel.text = data.something;
}
@end
