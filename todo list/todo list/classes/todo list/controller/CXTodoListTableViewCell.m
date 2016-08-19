//
//  CXTodoListTableViewCell.m
//  todo list
//
//  Created by 陈曦 on 16/8/19.
//  Copyright © 2016年 chenxi. All rights reserved.
//

#import "CXTodoListTableViewCell.h"
#import "CXTodolist.h"

@implementation CXTodoListTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)loadData:(CXTodolist *)data{
    self.textLabel.text=data.something;
}
@end
