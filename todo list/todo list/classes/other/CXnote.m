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
 
    四.传值：顺传and逆传
 
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
 [_addSthField becomeFirstResponder]
 }

 2.实现数据的逆传（把添加控制器的值传递给代办列表控制器）
 
 （1.）创建模型
 （2.）2控制器的内容包装成模型
 （3.）在1控制器的头文件中声明接受2控制器模型的属性
 （4.）在2控制器中把模型值赋给属性  _todoVC.todolist = todo;
 （5.）在1控制器中
 //跳转之前的时候调用
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
 
 //给添加控制器传递todolist控制器的属性
 CXAddViewController *addVC = segue.destinationViewController;
 
 addVC.todoVC = self;
 
 }

 3.使用代理降低控制器之间的耦合性
 4.将传递的数据显示在tableview
 
 
 
   六.点击cell跳到编辑页面
 1.使用代码＋storyboard

 #pragma mark - tableView代理方法 ＋给CXEditViewController绑定Identifier:@"edit"
 //点击cell时候调用
 - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
     // 加载storyboard
 UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    // 创建编辑控制器
 CXEditViewController *editVc = [storyboard instantiateViewControllerWithIdentifier:@"edit"];
   // 跳转到编辑界面
 [self.navigationController pushViewController:editVc animated:YES];
 
 }

 
 2.todo list页面的数据顺传给edit页面
 数据顺传，只需在edit控制器设置属性接受，在todolist控制器拿到edit控制器的实例设置即可
 
 3.edit页面左上角编辑／取消按钮的逻辑细节
 
 
 
 
 
 
 
 
 
 */

