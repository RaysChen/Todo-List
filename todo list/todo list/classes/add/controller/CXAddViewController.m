//
//  CXAddViewController.m
//  todo list
//
//  Created by 陈曦 on 16/8/16.
//  Copyright © 2016年 chenxi. All rights reserved.
//

#import "CXAddViewController.h"
#import  "CXTodolist.h"


@interface CXAddViewController ()
@property (weak, nonatomic) IBOutlet UITextField *addSthField;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;

@end

@implementation CXAddViewController


//点击添加的时候调用
- (IBAction)add:(id)sender {
    
    //0.把文本框的内容包装成Todolist模型
    CXTodolist *todo = [CXTodolist todolistWithsomething:_addSthField.text];
    
    
    //1.通知代理做事情
    if ([_delegate respondsToSelector:@selector(addViewController:didClickAddBtnWithTodolist:)]) {
        [_delegate addViewController:self didClickAddBtnWithTodolist:todo];
    }

    
    
    //2.回到todo list控制器
       [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
   //给文本框添加监听器
    [_addSthField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    // 主动弹出姓名文本框
    [_addSthField becomeFirstResponder];
}


//文本框内容改变时调用
- (void)textChange{
    _addBtn.enabled = _addSthField.text.length;
}



@end
