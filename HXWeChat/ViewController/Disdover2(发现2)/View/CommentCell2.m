//
//  CommentCell2.m
//  HXWeChat
//
//  Created by 韩小胜 on 2018/1/4.
//  Copyright © 2018年 HX. All rights reserved.
//

#import "CommentCell2.h"
@interface CommentCell2 ()
@property (nonatomic, strong) CopyAbleLabel *contentLabel;

@end
@implementation CommentCell2


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        UIColor *bgColor = [UIColor colorWithRed:236.0/256.0 green:236.0/256.0 blue:236.0/256.0 alpha:0.4];
        self.backgroundColor = bgColor;
        self.contentView.backgroundColor = bgColor;
        
        
        // contentLabel
        self.contentLabel = [[CopyAbleLabel alloc] init];
        self.contentLabel.backgroundColor = bgColor;
        self.contentLabel.preferredMaxLayoutWidth = HXWIDTH- kGAP-kAvatar_Size - 2*kGAP;
        self.contentLabel.lineBreakMode = NSLineBreakByCharWrapping;
        self.contentLabel.numberOfLines = 0;
        self.contentLabel.font = [UIFont systemFontOfSize:13.0];
        [self.contentView addSubview:self.contentLabel];
        
        [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
    }
    return self;
}
#pragma mark
#pragma mark cell左边缩进64，右边缩进10
-(void)setFrame:(CGRect)frame{
    CGFloat leftSpace = 2*kGAP+kAvatar_Size;
    frame.origin.x = leftSpace;
    frame.size.width = HXWIDTH - leftSpace -10;
    [super setFrame:frame];
}
-(void)setModel:(CommentInfoModel2 *)model{
    if ([model isKindOfClass:[CommentInfoModel2 class]]) {
        self.contentLabel.attributedText = model.attributedText;
    }else{
        self.contentLabel.text = @"数组";
    }
}

@end
