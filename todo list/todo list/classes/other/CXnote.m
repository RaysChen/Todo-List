//
//  CXnote.m
//  todo list
//
//  Created by 陈曦 on 16/8/16.
//  Copyright © 2016年 chenxi. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  一.搭建登录界面
 label控件 clear button 多种属性可以选
 登录按钮button控件，默认显示不可点击
 
    二.实现登录界面包含的业务逻辑
 label添加监听器，监听输入内容的实时改变
 
    三.segue的类型
 自动：不需要逻辑判断就跳转
 手动：有逻辑的判断，如登录帐号密码的判断
 
    四.传值：顺传
 
 数据传值:
 1.接收方一定要有属性接收
 2.传递方必须要拿到接收方
 
 登录的账号传到todolist页面的title：
 1.[self performSegueWithIdentifier]
 2.创建segue
 3.设置来源控制器segue.sourceViewController = self
 4.创建目的控制器，segue.destinationViewController = 目的控制器
 5.[self prepareForSegue]跳转之前的准备操作
 6.[segue perform]
 7.判断下segue的类型，如果是push,拿到导航控制器push
 [self.navigationController pushViewController:segue.destinationViewController animated:YES];
 
 
    五.点击添加，进入添加页面
 1.光标自动在文本框
 - (void)viewDidAppear:(BOOL)animated
 {
 [super viewDidAppear:animated];
 // 主动弹出姓名文本框
 [_addSthField becomeFirstResponder];
 }

 
 */

