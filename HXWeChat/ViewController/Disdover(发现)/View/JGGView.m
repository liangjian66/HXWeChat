//
//  JGGView.m
//  HXWeChat
//
//  Created by 韩小胜 on 2018/1/1.
//  Copyright © 2018年 HX. All rights reserved.
//

#import "JGGView.h"

@implementation JGGView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)tapImageAction:(UITapGestureRecognizer *)tap{
    UIImageView *tapView = (UIImageView *)tap.view;
    if (self.tapBlock) {
        self.tapBlock(tapView.tag,self.dataSource);
    }
}

- (void)setDataSource:(NSArray *)dataSource{
    _dataSource = dataSource ;
    CGFloat jgg_width = HXWIDTH-2*kGAP-kAvatar_Size-50;

    // 单张图片的大小
    CGFloat imageWidth =  (jgg_width-2*kGAP)/3;
    CGFloat imageHeight =  imageWidth;
    for (NSUInteger i=0; i<dataSource.count; i++) {
        UIImageView *iv = [[UIImageView alloc]initWithFrame:CGRectMake(0+(imageWidth+kGAP)*(i%3),floorf(i/3.0)*(imageHeight+kGAP),imageWidth, imageHeight)];
        if ([dataSource[i] isKindOfClass:[UIImage class]]) {
            iv.image = dataSource[i];
        }else if ([dataSource[i] isKindOfClass:[NSString class]]){
            [iv sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",dataSource[i]]] placeholderImage:[UIImage imageNamed:@"placeholder"]];
            //            [iv setImageWithURL:[NSURL URLWithString:str]
            //                               placeholder:nil
            //                                   options:YYWebImageOptionProgressiveBlur | YYWebImageOptionShowNetworkActivity | YYWebImageOptionSetImageWithFadeAnimation
            //                                  progress:^(NSInteger receivedSize, NSInteger expectedSize) {
            //                                      if (expectedSize > 0 && receivedSize > 0) {
            //                                          CGFloat progress = (CGFloat)receivedSize / expectedSize;
            //                                          progress = progress < 0 ? 0 : progress > 1 ? 1 : progress;
            //
            //                                      }
            //                                  } transform:nil
            //                                completion:^(UIImage *image, NSURL *url, YYWebImageFromType from, YYWebImageStage stage, NSError *error) {
            //                                    if (stage == YYWebImageStageFinished) {
            //
            //                                    }
            //                                }];
            
            
        }else if ([dataSource[i] isKindOfClass:[NSURL class]]){
            [iv sd_setImageWithURL:dataSource[i] placeholderImage:[UIImage imageNamed:@"placeholder"]];
        }
        iv.userInteractionEnabled = YES;//默认关闭NO，打开就可以接受点击事件
        iv.tag = i;
//        iv.autoPlayAnimatedImage = YES;
        [self addSubview:iv];
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapImageAction:)];
        [iv addGestureRecognizer:singleTap];
    }
    
    
}

@end
