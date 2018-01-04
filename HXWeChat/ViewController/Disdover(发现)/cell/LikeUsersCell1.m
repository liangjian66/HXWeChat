//
//  LikeUsersCell1.m
//  HXWeChat
//
//  Created by 韩小胜 on 2018/1/2.
//  Copyright © 2018年 HX. All rights reserved.
//

#import "LikeUsersCell1.h"
#import "FriendInfoModel.h"
#import "UILabel+TapAction.h"


@interface LikeUsersCell1 ()<TapActionDelegate>
@property(nonatomic,strong)NSMutableArray *likeUsersArray;

@property(nonatomic,strong)NSMutableArray *nameArray;
@end


@implementation LikeUsersCell1


-(NSMutableArray *)nameArray{
    if (_nameArray==nil) {
        _nameArray = [NSMutableArray array];
    }
    return _nameArray;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createUI];
    }
    return self;
}

- (void)createUI{
    
    self.backgroundColor = [UIColor clearColor];
    self.likeUsersLabel = [[UILabel alloc]init];
    [self.contentView addSubview:self.likeUsersLabel];
    [self.likeUsersLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left);
        make.right.equalTo(self.contentView.mas_right);

        make.top.equalTo(self.contentView.mas_top).offset(8);
//        make.bottom.equalTo(self.contentView.mas_bottom).offset(-3);
    }];
    self.likeUsersLabel.lineBreakMode = NSLineBreakByCharWrapping;
    self.likeUsersLabel.numberOfLines = 0;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
}

-(void)setModel:(MessageInfoModel1 *)messageModel{
    _model = messageModel;
    _likeUsersArray = messageModel.likeUsers.mutableCopy;
    NSMutableArray *rangesArray = [NSMutableArray array];
    NSMutableAttributedString *mutablAttrStr = [[NSMutableAttributedString alloc]init];
    NSTextAttachment *attch = [[NSTextAttachment alloc] init];
    //定义图片内容及位置和大小
    attch.image = [UIImage imageNamed:@"Like"];
    attch.bounds = CGRectMake(0, -5, attch.image.size.width, attch.image.size.height);
    //创建带有图片的富文本
    [mutablAttrStr insertAttributedString:[NSAttributedString attributedStringWithAttachment:attch] atIndex:0];
    
    
    for (int i = 0; i < messageModel.likeUsers.count; i++) {
        FriendInfoModel *friendModel = messageModel.likeUsers[i];
        //name0,name1,name2,name1
        [mutablAttrStr appendAttributedString:[[NSAttributedString alloc] initWithString:friendModel.userName]];
        if ([self.nameArray containsObject:friendModel.userName]) {//如果前面有人和我重复名字了
            friendModel.range = NSMakeRange(mutablAttrStr.length-friendModel.userName.length, friendModel.userName.length);
        }else{
            friendModel.range = [mutablAttrStr.string rangeOfString:friendModel.userName];
        }
        if (i != messageModel.likeUsers.count - 1) {
            [mutablAttrStr appendAttributedString:[[NSAttributedString alloc] initWithString:@","]];
            
        }
        [rangesArray addObject:[NSValue valueWithRange:friendModel.range]];
        [self.nameArray addObject:friendModel.userName];
    }
    
    [mutablAttrStr addAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:13.f]} range:NSMakeRange(0, mutablAttrStr.length)];
    
    
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = 0;
    [mutablAttrStr addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, mutablAttrStr.length)];
    // 给指定文字添加颜色
    for (NSValue *aRangeValue in rangesArray) {
        [mutablAttrStr addAttributes:@{NSForegroundColorAttributeName : [UIColor orangeColor]} range:aRangeValue.rangeValue];
    }
    
    
    
    self.likeUsersLabel.attributedText = mutablAttrStr;
    
}

@end
