//
//  CXEditViewController.h
//  todo list
//
//  Created by 陈曦 on 16/8/22.
//  Copyright © 2016年 chenxi. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CXTodolist;

//定义block类型别名
typedef void(^CXEditViewControllerBlock)() ;



@interface CXEditViewController : UIViewController

@property (nonatomic, strong)CXTodolist *todolist;

@property (nonatomic, strong)CXEditViewControllerBlock block;

@end