//
//  CXAddViewController.m
//  todo list
//
//  Created by 陈曦 on 16/8/16.
//  Copyright © 2016年 chenxi. All rights reserved.
//

#import "CXAddViewController.h"

@interface CXAddViewController ()
@property (weak, nonatomic) IBOutlet UITextField *addSthField;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;

@end

@implementation CXAddViewController


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
