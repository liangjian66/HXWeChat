//
//  BaseViewController.h
//  HXWeChat
//
//  Created by 韩小胜 on 2017/12/29.
//  Copyright © 2017年 HX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController


@property(nonatomic,strong)UITableView *tableView;

@property(nonatomic,strong)NSMutableArray *dataSource;

-(void)registerCellWithNib:(NSString *)nibName tableView:(UITableView *)tableView;

-(void)registerCellWithClass:(NSString *)className tableView:(UITableView *)tableView;

-(int)getRandomNumber:(int)from to:(int)to;  //

@end
