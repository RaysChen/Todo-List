//
//  CXTodolistViewController.m
//  todo list
//
//  Created by 陈曦 on 16/8/16.
//  Copyright © 2016年 chenxi. All rights reserved.
//

#import "CXTodolistViewController.h"
#import "CXAddViewController.h"
#import "CXTodolist.h"
#import "CXTodoListTableViewCell.h"
#import "CXEditViewController.h"


#define CXFilePath  [ NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"todolist.data"]

@interface CXTodolistViewController ()<UIActionSheetDelegate,CXAddViewControllerDelegate>

@property (nonatomic,strong)NSMutableArray *todolists;


@end

@implementation CXTodolistViewController

- (NSMutableArray *)todolists{
    if (_todolists == nil) {
        _todolists = [NSKeyedUnarchiver unarchiveObjectWithFile:CXFilePath];
        
        //判断有没有读取数据
        if (_todolists == nil) {
            _todolists = [NSMutableArray array];
        }
    }
    return _todolists;
}



//跳转之前的时候调用
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

    //给添加控制器传递todolist控制器的属性
    CXAddViewController *addVC = segue.destinationViewController;
   
    addVC.delegate = self;
    
}

//把添加界面的模型传递到todo list界面
- (void)addViewController:(CXAddViewController *)addVc didClickAddBtnWithTodolist:(CXTodolist *)something{
    
    NSLog(@"%s--%@",__func__,something.something);
    
   
    //把todosomething模型保存到数组
    [self.todolists addObject:something];
  
    
    //刷新表格
    [self.tableView reloadData];
    
    //存储数据
    [NSKeyedArchiver archiveRootObject:self toFile:CXFilePath];
}


//点击注销按钮时调用
- (IBAction)logout:(id)sender {
    
    // 弹出actionSheet
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"是否注销?" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"注销" otherButtonTitles:nil, nil];
    
    [sheet showInView:self.view];

    
}

#pragma mark - UIActionSheetDelegate
// 点击UIActionSheet控件上的按钮调用
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) { // 点击了注销
        
        [self.navigationController popViewControllerAnimated:YES];
        
    }
    
    
}





#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.todolists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 创建标示符
    static NSString *ID = @"CXTodoListTableViewCell";
    
    CXTodoListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    
    // 获取模型
    CXTodolist *todo = self.todolists[indexPath.row];
    [cell loadData:todo];
    
    return cell;
}


#pragma mark - tableView代理方法

//点击cell时候调用
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    // 加载storyboard
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    
    // 创建编辑控制器
    CXEditViewController *editVc = [storyboard instantiateViewControllerWithIdentifier:@"edit"];
    
    editVc.todolist = self.todolists[indexPath.row];
    
    //点编辑时调用的block
    editVc.block = ^(){
    //刷新表格
        [self.tableView reloadData];
    //存储数据
        [NSKeyedArchiver archiveRootObject:self toFile:CXFilePath];
    
    };
    
    
    
    // 跳转到编辑界面
    [self.navigationController pushViewController:editVc animated:YES];
    
 
  
    

}




@end
