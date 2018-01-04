//
//  FriendInfoModel.m
//  HXWeChat
//
//  Created by 韩小胜 on 2017/12/29.
//  Copyright © 2017年 HX. All rights reserved.
//

#import "FriendInfoModel.h"

@implementation FriendInfoModel
-(instancetype)initWithDic:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        self.userId      = dic[@"userId"];
        self.userName    = dic[@"userName"];
        self.photo       = dic[@"photo"];
        self.phoneNO     = dic[@"phoneNO"];
        
    }
    return self;
}
@end
