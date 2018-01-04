//
//  LikeUsersCell2.h
//  HXWeChat
//
//  Created by 韩小胜 on 2018/1/4.
//  Copyright © 2018年 HX. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FriendInfoModel;
#import "MessageInfoModel2.h"
typedef void(^TapNameBlock)(FriendInfoModel *friendModel);

@interface LikeUsersCell2 : UITableViewCell

@property(nonatomic,strong) UILabel *likeUsersLabel;


@property(nonatomic,strong)NSMutableArray *likeUsersArray;
@property(nonatomic,strong)CommentInfoModel2 *model;


///点击某个人名字的block回调
@property(nonatomic ,copy)TapNameBlock tapNameBlock;

@end
