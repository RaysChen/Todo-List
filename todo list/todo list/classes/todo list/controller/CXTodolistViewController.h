//
//  CXTodolistViewController.h
//  todo list
//
//  Created by 陈曦 on 16/8/16.
//  Copyright © 2016年 chenxi. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CXTodolist;
@interface CXTodolistViewController : UITableViewController

@property (nonatomic, strong) CXTodolist *todolist;
//@property (nonatomic,strong)CXTodolistViewController *todoVC;
@end
