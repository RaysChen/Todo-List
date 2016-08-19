//
//  CXAddViewController.h
//  todo list
//
//  Created by 陈曦 on 16/8/16.
//  Copyright © 2016年 chenxi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CXAddViewController,CXTodolist;
@protocol  CXAddViewControllerDelegate <NSObject>

@optional
- (void)addViewController:(CXAddViewController *)addVc didClickAddBtnWithTodolist:(CXTodolist *)something;

@end

@class CXTodolistViewController;
@interface CXAddViewController : UIViewController

@property (nonatomic,weak) id<CXAddViewControllerDelegate>delegate;

@end
