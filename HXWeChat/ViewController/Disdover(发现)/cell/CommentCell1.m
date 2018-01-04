//
//  CommentCell1.m
//  HXWeChat
//
//  Created by 韩小胜 on 2018/1/2.
//  Copyright © 2018年 HX. All rights reserved.
//

#import "CommentCell1.h"
#import "JGGView.h"
#import "MessageInfoModel1.h"
#import "MessageCell1.h"
@interface  CommentCell1()

@property (nonatomic, strong) UILabel *contentLabel;

@end
@implementation CommentCell1

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.contentLabel = [[UILabel alloc]init];
        [self.contentView addSubview:self.contentLabel];

        self.contentLabel.backgroundColor  = [UIColor clearColor];
        self.contentLabel.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - kGAP-kAvatar_Size - 2*kGAP;
        self.contentLabel.lineBreakMode = NSLineBreakByCharWrapping;
        self.contentLabel.numberOfLines = 0;
        self.contentLabel.font = [UIFont systemFontOfSize:13.0];
        
        [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(self.contentView);
            make.top.mas_equalTo(self.contentView).offset(7.0);//cell上部距离为3.0个间隙
        }];
        self.backgroundColor = [UIColor clearColor];
        self.hyb_lastViewInCell = self.contentLabel;
        self.hyb_bottomOffsetToCell = 0.0;//cell底部距离为3.0个间隙
        
    }
    
    return self;
}


- (void)configCellWithModel:(CommentInfoModel1 *)model {
    NSString *str  = nil;
    if (![model.commentByUserName isEqualToString:@""]) {
        str= [NSString stringWithFormat:@"%@回复%@：%@",
              model.commentUserName, model.commentByUserName, model.commentText];
    }else{
        str= [NSString stringWithFormat:@"%@：%@",
              model.commentUserName, model.commentText];
    }
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:str];
    NSMutableParagraphStyle *muStyle = [[NSMutableParagraphStyle alloc] init];
    
    if ([text.string isMoreThanOneLineWithSize:CGSizeMake(HXWIDTH-kGAP-kAvatar_Size-2*kGAP, CGFLOAT_MAX) font:[UIFont systemFontOfSize:13.0] lineSpaceing:5.0]) {//margin
        muStyle.lineSpacing = 5.0;//设置行间距离
    }else{
        muStyle.lineSpacing = CGFLOAT_MIN;//设置行间距离
    }  
    
    [text addAttribute:NSParagraphStyleAttributeName value:muStyle range:NSMakeRange(0, text.length)];
    
    [text addAttribute:NSForegroundColorAttributeName
                 value:[UIColor orangeColor]
                 range:NSMakeRange(0, model.commentUserName.length)];
    [text addAttribute:NSForegroundColorAttributeName
                 value:[UIColor orangeColor]
                 range:NSMakeRange(model.commentUserName.length + 2, model.commentByUserName.length)];
    self.contentLabel.attributedText = text;
}



@end
