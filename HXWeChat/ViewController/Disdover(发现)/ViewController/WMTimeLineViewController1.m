//
//  WMTimeLineViewController1.m
//  HXWeChat
//
//  Created by 韩小胜 on 2017/12/29.
//  Copyright © 2017年 HX. All rights reserved.
//

#import "WMTimeLineViewController1.h"

#import "MessageCell1.h"
#import "CommentCell1.h"


@interface WMTimeLineViewController1 ()

@end

@implementation WMTimeLineViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getTestData1];
    
    [self registerCellWithClass:@"MessageCell1" tableView:self.tableView];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MessageCell1 *cell = [tableView dequeueReusableCellWithIdentifier:@"MessageCell1" forIndexPath:indexPath];
    cell.delegate = self;
    
    __weak __typeof(self) weakSelf= self;
    
    MessageInfoModel1 *model = self.dataSource[indexPath.row];
    [cell configCellWithModel:model indexPath:indexPath];
    
    //
    
    //评论
//    cell.CommentBtnClickBlock = ^(UIButton *commentBtn,NSIndexPath * indexPath)
//    {
//        //
//        if (weakSelf.isShowKeyBoard) {
//            [weakSelf.view endEditing:YES];
//            return ;
//        }
//
//        //不是点击cell进行回复，则置空replayTheSeletedCellModel，因为这个时候是点击评论按钮进行评论，不是回复某某某
//        weakSelf.replayTheSeletedCellModel = nil;
//        weakSelf.seletedCellHeight = 0.0;
//        weakSelf.needUpdateOffset = YES;
//        weakSelf.chatKeyBoard.placeHolder = [NSString stringWithFormat:@"评论 %@",model.userName];
//        weakSelf.history_Y_offset = [commentBtn convertRect:commentBtn.bounds toView:[UIApplication sharedApplication].keyWindow].origin.y;
//        weakSelf.currentIndexPath = indexPath;
//        [weakSelf.chatKeyBoard keyboardUpforComment];
//    };
    
    //更多
    cell.MoreBtnClickBlock = ^(UIButton *moreBtn,NSIndexPath * indexPath)
    {
//        if (weakSelf.isShowKeyBoard) {
//            [weakSelf.view endEditing:YES];
//            return ;
//        }
//        [weakSelf.chatKeyBoard keyboardDownForComment];
//        weakSelf.chatKeyBoard.placeHolder = nil;
        model.isExpand = !model.isExpand;
        model.shouldUpdateCache = YES;
        [weakSelf.tableView reloadData];
    };
    
    //点击九宫格
//    cell.tapImageBlock = ^(NSInteger index,NSArray *dataSource){
//        if (weakSelf.isShowKeyBoard) {
//            [weakSelf.view endEditing:YES];
//            return ;
//        }
//        [weakSelf.chatKeyBoard keyboardDownForComment];
//    };

    return cell;

    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    MessageInfoModel1 *messageModel = self.dataSource[indexPath.row];
    CGFloat h = [MessageCell1 hyb_heightForTableView:tableView config:^(UITableViewCell *sourceCell) {
        MessageCell1 *cell = (MessageCell1 *)sourceCell;
        [cell configCellWithModel:messageModel indexPath:indexPath];
    } cache:^NSDictionary *{
        NSDictionary *cache = @{kHYBCacheUniqueKey : messageModel.cid,
                                kHYBCacheStateKey  : @"",
                                kHYBRecalculateForStateKey : @(messageModel.shouldUpdateCache)};
        messageModel.shouldUpdateCache = NO;
        return cache;
    }];
    return h;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (self.isShowKeyBoard) {
//        [self.view endEditing:YES];
//    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}



@end
