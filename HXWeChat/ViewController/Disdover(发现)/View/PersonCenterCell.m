//
//  PersonCenterCell.m
//  HXWeChat
//
//  Created by 韩小胜 on 2017/12/29.
//  Copyright © 2017年 HX. All rights reserved.
//

#import "PersonCenterCell.h"
@interface  PersonCenterCell()


@end
@implementation PersonCenterCell

- (UIImageView *)iconView{
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc]init];
    }
    return _iconView;
}
- (UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [UILabel new];
    }
    return _titleLabel;
}




- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createManiUI];
    }
    
    return self;
    
}

- (void)createManiUI{
    [self.contentView addSubview:self.iconView];
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(15);
        make.height.mas_equalTo(15);
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.left.equalTo(self.contentView.mas_left).offset(15);

    }];
    
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.left.equalTo(self.iconView.mas_right).offset(15);
    }];
    
    
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
