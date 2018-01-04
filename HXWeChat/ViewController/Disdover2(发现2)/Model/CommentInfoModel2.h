//
//  CommentInfoModel2.h
//  HXWeChat
//
//  Created by 韩小胜 on 2018/1/4.
//  Copyright © 2018年 HX. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommentInfoModel2 : NSObject


@property (nonatomic, assign) BOOL isExpand;

@property(nonatomic,copy)NSString *commentId;

@property(nonatomic,copy)NSString *commentUserId;

@property(nonatomic,copy)NSString *commentUserName;

@property(nonatomic,copy)NSString *commentPhoto;

@property(nonatomic,copy)NSString *commentText;
@property(nonatomic,copy)NSAttributedString *attributedText;

@property(nonatomic,copy)NSString *commentByUserId;
@property(nonatomic,copy)NSString *commentByUserName;
@property(nonatomic,copy)NSString *commentByPhoto;
@property(nonatomic,copy)NSString *createDateStr;
@property(nonatomic,copy)NSString *checkStatus;

///评论大图
@property(nonatomic,copy)NSMutableArray *messageBigPicArray;
@property(nonatomic,copy)NSMutableAttributedString *likeUsersAttributedText;

@property(nonatomic,copy)NSMutableArray<CommentInfoModel2 *> *likeUsersArray;

// 评论数据源
@property (nonatomic,copy) NSMutableArray *commentModelArray;

@property (nonatomic, assign)CGFloat rowHeight;

-(instancetype)initWithDic:(NSDictionary *)dic;   //


@end
