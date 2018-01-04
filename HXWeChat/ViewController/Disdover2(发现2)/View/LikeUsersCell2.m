//
//  LikeUsersCell2.m
//  HXWeChat
//
//  Created by 韩小胜 on 2018/1/4.
//  Copyright © 2018年 HX. All rights reserved.
//

#import "LikeUsersCell2.h"
#import "UILabel+TapAction.h"


@interface LikeUsersCell2 ()<TapActionDelegate>

@end



@implementation LikeUsersCell2




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
    
    UIImage *image = [UIImage imageNamed:@"LikeCmtBg"];
    image = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
    self.backgroundView = [[UIImageView alloc]initWithImage:image];
    
    
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
#pragma mark cell左边缩进leftSpace，右边缩进10
-(void)setFrame:(CGRect)frame{
    CGFloat leftSpace = 2*kGAP+kAvatar_Size;
    frame.origin.x = leftSpace;
    frame.size.width = HXWIDTH - leftSpace -10;
    [super setFrame:frame];
}
-(void)setModel:(CommentInfoModel2 *)model{
    _model = model;
    self.likeUsersLabel.attributedText = model.likeUsersAttributedText;
}


@end
