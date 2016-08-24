//
//  CXLoginViewController.m
//  todo list
//
//  Created by 陈曦 on 16/8/15.
//  Copyright © 2016年 chenxi. All rights reserved.
//

#import "CXLoginViewController.h"
#import "MBProgressHUD+XMG.h"

@interface CXLoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *accountField;
@property (weak, nonatomic) IBOutlet UITextField *pwdField;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UISwitch *rmbPwdSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *autoLoginSwitch;

@end

@implementation CXLoginViewController

#define CXUserDefaults [NSUserDefaults standardUserDefaults]
static NSString *accountKey = @"account";
static NSString *pwdKey = @"pwd";
static NSString *rmbKey = @"rmd";
static NSString *loginKey = @"login";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //读取数据
    
//取出数据
    NSString *account = [CXUserDefaults objectForKey:accountKey];
    NSString *pwd = [CXUserDefaults objectForKey:pwdKey];
    BOOL rmb = [CXUserDefaults boolForKey:rmbKey];
    BOOL login = [CXUserDefaults boolForKey:loginKey];

//赋值
    _accountField.text = account;
    
    if (rmb == YES) {
        _pwdField.text = pwd;
    }
    
    _rmbPwdSwitch.on = rmb;
    _autoLoginSwitch.on = login;
    
    // 勾选自动登录
    if (login == YES) {
        
        [self login:nil];
        
    }
    

    
//给文本框添加监听器，监听文本框输入内容的及时改变
    [_accountField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [_pwdField addTarget:self action:@selector(textChange)forControlEvents:UIControlEventEditingChanged];
    

    //判断登录按钮是否能点击
    [self textChange];
}


- (void)textChange{
    
    _loginBtn.enabled = _accountField.text.length &&_pwdField.text.length;
    //NSLog(@"%@--%@",_accountField.text,_pwdField.text);
    
}

//在执行跳转之前调用（传值：顺传）
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

    UIViewController *vc = segue.destinationViewController;
    vc.title = [NSString stringWithFormat:@"%@'s TodoList",_accountField.text];


}

//点击登录按钮时调用
//账号cx密码123
- (IBAction)login:(id)sender {
    
    //提示正在登录ing
    [MBProgressHUD showMessage:@"登录ing..."];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        //隐藏蒙版
        [MBProgressHUD hideHUD];
        
        //验证账号密码是否符合
        if ([_accountField.text isEqualToString:@"cx"]&&[_pwdField.text isEqualToString:@"123"]) {
            
            //输入正确，数据存储
            [CXUserDefaults setObject:_accountField.text forKey:accountKey];
            [CXUserDefaults setObject:_pwdField.text forKey:pwdKey];
            [CXUserDefaults setBool:_rmbPwdSwitch.on forKey:rmbKey];
            [CXUserDefaults setBool:_autoLoginSwitch.on forKey:loginKey];
            
            //输入正确直接跳转到my todo list页面
            [self performSegueWithIdentifier:@"login2mytodolist" sender:nil];
            
        } else {
            [MBProgressHUD showError:@"账号或密码错误"];
        }
    });
    
    
    
}

//记住密码开关，状态改变的时候调用
- (IBAction)rmbPwdChange:(id)sender {
    
   //如果取消勾选记住密码，那么自动登录也要取消
    if (_rmbPwdSwitch.on == NO) {
        [_autoLoginSwitch setOn:NO animated:YES];
    }
}

//自动登录开关，状态改变的时候调用
- (IBAction)autoLoginChange:(id)sender {
    
  //如果自动登录被勾选，那么记住密码也被勾选
    if (_autoLoginSwitch.on == YES) {
        [_rmbPwdSwitch setOn:YES animated:YES];
    }
}


@end
