//
//  CommentCell1.h
//  HXWeChat
//
//  Created by 韩小胜 on 2018/1/2.
//  Copyright © 2018年 HX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommentInfoModel1.h"


@interface CommentCell1 : UITableViewCell
///处理评论的文字（包括xx回复yy）
- (void)configCellWithModel:(CommentInfoModel1 *)model;
@end
