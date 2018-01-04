//
//  LikeUsersCell1.h
//  HXWeChat
//
//  Created by 韩小胜 on 2018/1/2.
//  Copyright © 2018年 HX. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FriendInfoModel;
#import "MessageInfoModel1.h"

typedef void(^TapNameBlock)(FriendInfoModel *friendModel);

@interface LikeUsersCell1 : UITableViewCell
@property(nonatomic,strong) UILabel *likeUsersLabel;

@property(nonatomic ,copy)TapNameBlock tapNameBlock;

@property(nonatomic ,strong)MessageInfoModel1 *model;

@end
