//
//  MessageCell1.h
//  HXWeChat
//
//  Created by 韩小胜 on 2018/1/1.
//  Copyright © 2018年 HX. All rights reserved.
//  消息cell

#import <UIKit/UIKit.h>
#import "JGGView.h"
#import "CommentCell1.h"
#import "LikeUsersCell1.h"
#import "MessageInfoModel1.h"
#import "CommentInfoModel1.h"

@class MessageCell1;

@protocol MessageCellDelegate <NSObject>

- (void)reloadCellHeightForModel:(MessageInfoModel1 *)model atIndexPath:(NSIndexPath *)indexPath;

- (void)passCellHeight:(CGFloat )cellHeight commentModel:(CommentInfoModel1 *)commentModel   commentCell:(CommentCell1 *)commentCell messageCell:(MessageCell1 *)messageCell;

@end

@interface MessageCell1 : UITableViewCell

@property (nonatomic, strong) JGGView *jggView;

/**
 *  评论按钮的block
 */
@property (nonatomic, copy)void(^CommentBtnClickBlock)(UIButton *commentBtn,NSIndexPath * indexPath);

/**
 *  更多按钮的block
 */
@property (nonatomic, copy)void(^MoreBtnClickBlock)(UIButton *moreBtn,NSIndexPath * indexPath);

@property(nonatomic ,copy)TapNameBlock tapNameBlock;


//  


/**
 *  点击文字的block
 */
@property (nonatomic, copy)void(^TapTextBlock)(UILabel *desLabel);

@property (nonatomic, weak) id<MessageCellDelegate> delegate;

- (void)configCellWithModel:(MessageInfoModel1 *)model indexPath:(NSIndexPath *)indexPath;  



@end
