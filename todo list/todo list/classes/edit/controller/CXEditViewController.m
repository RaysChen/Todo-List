//
//  CXEditViewController.m
//  todo list
//
//  Created by 陈曦 on 16/8/22.
//  Copyright © 2016年 chenxi. All rights reserved.
//

#import "CXEditViewController.h"

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
}

- (void)edit:(UIBarButtonItem *)item{}

@end
