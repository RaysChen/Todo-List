//
//  CXLoginViewController.m
//  todo list
//
//  Created by 陈曦 on 16/8/15.
//  Copyright © 2016年 chenxi. All rights reserved.
//

#import "CXLoginViewController.h"

@interface CXLoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *accountField;
@property (weak, nonatomic) IBOutlet UITextField *pwdField;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation CXLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //给文本框添加监听器，监听文本框输入内容的及时改变
    [_accountField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [_pwdField addTarget:self action:@selector(textChange)forControlEvents:UIControlEventEditingChanged];
    
    
}

- (void)textChange{

    _loginBtn.enabled = _accountField.text.length &&_pwdField.text.length;
    NSLog(@"%@--%@",_accountField.text,_pwdField.text);

}

@end
