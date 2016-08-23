//
//  CXEditViewController.m
//  todo list
//
//  Created by 陈曦 on 16/8/22.
//  Copyright © 2016年 chenxi. All rights reserved.
//

#import "CXEditViewController.h"
#import "CXTodolist.h"

@interface CXEditViewController ()
@property (weak, nonatomic) IBOutlet UITextField *editField;
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;

@end

@implementation CXEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置导航栏的标题
    self.title = @"Edit Something";
    
    //设置导航栏右边的按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStyleDone target:self action:@selector(edit:)];
    
    //把模型传过来的值赋给文本框
    _editField.text = _todolist.something;
    
    //给文本框添加监听器，监听文本框内容的改变
    [_editField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    
    //保存按钮是否可点击
    [self textChange];
    
}

//文本框内容改变时会调用
-(void)textChange{
    
    _saveBtn.enabled = _editField.text.length;

}

//点编辑的时候调用
- (void)edit:(UIBarButtonItem *)item{
    
    if ([item.title isEqualToString:@"编辑"]) {
        //更改标题
        item.title = @"取消";
        
        //让文本框允许编辑
        _editField.enabled = YES;
        
        //隐藏保存按钮
        _saveBtn.hidden = NO;
        
        //弹出键盘
        [_editField becomeFirstResponder];
        
    } else {//按钮显示取消时
        
        //更改标题
        item.title = @"编辑";
        
        //隐藏保存按钮
        _saveBtn.hidden = YES;
        
        //让文本框不允许编辑
        _editField.enabled = NO;
    }
    
    
}

@end
