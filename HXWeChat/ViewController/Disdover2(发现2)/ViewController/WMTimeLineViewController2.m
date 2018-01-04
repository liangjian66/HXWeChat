//
//  WMTimeLineViewController2.m
//  HXWeChat
//
//  Created by 韩小胜 on 2018/1/3.
//  Copyright © 2018年 HX. All rights reserved.
//  方式2

#import "WMTimeLineViewController2.h"
#import "WMTimeLineHeaderView.h"
#import "CommentCell2.h"
#import "LikeUsersCell2.h"

@interface WMTimeLineViewController2 ()

@end

@implementation WMTimeLineViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getTestData2];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:NSClassFromString(@"WMTimeLineHeaderView") forHeaderFooterViewReuseIdentifier:@"WMTimeLineHeaderView"];
    [self registerCellWithClass:@"CommentCell2" tableView:self.tableView];
    [self registerCellWithClass:@"LikeUsersCell2" tableView:self.tableView];

    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataSource.count;
}
//显示评论的数据
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    MessageInfoModel1 *eachModel = self.dataSource[section];
    return eachModel.commentModelArray.count;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    MessageInfoModel2 *eachModel = self.dataSource[indexPath.section];
    CommentInfoModel2  *commentModel =  eachModel.commentModelArray[indexPath.row];
    return commentModel.rowHeight;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    MessageInfoModel2 *eachModel = self.dataSource[section];
    return eachModel.headerHeight;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    WMTimeLineHeaderView *headerView = (WMTimeLineHeaderView *)[tableView dequeueReusableHeaderFooterViewWithIdentifier:@"WMTimeLineHeaderView"];
    MessageInfoModel2 *eachModel = self.dataSource[section];
    headerView.model = eachModel;
    return headerView;
}
///footer高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10.f;
}
///footerView
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 10.f)];
    footerView.backgroundColor = [UIColor whiteColor];
    return footerView;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MessageInfoModel2 *eachModel = self.dataSource[indexPath.section];
    CommentInfoModel2  *commentModel =  eachModel.commentModelArray[indexPath.row];
    if (commentModel.likeUsersArray.count) {
        LikeUsersCell2 *likeUsersCell = (LikeUsersCell2 *)[tableView dequeueReusableCellWithIdentifier:@"LikeUsersCell2"];
        likeUsersCell.model = commentModel;
        return likeUsersCell;
    }else{
        CommentCell2 *cell2 = (CommentCell2 *)[tableView dequeueReusableCellWithIdentifier:@"CommentCell2"];
        cell2.model = commentModel;
        return cell2;
    }
}




@end
