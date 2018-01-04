//
//  FriendInfoModel.h
//  HXWeChat
//
//  Created by 韩小胜 on 2017/12/29.
//  Copyright © 2017年 HX. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FriendInfoModel : NSObject
@property(nonatomic,copy)NSString *photo;

@property(nonatomic,copy)NSString *userName;

@property(nonatomic,copy)NSString *userId;

@property(nonatomic,copy)NSString *phoneNO;
@property(nonatomic,assign)NSRange range;

-(instancetype)initWithDic:(NSDictionary *)dic;
@end
