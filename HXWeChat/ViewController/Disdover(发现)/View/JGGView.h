//
//  JGGView.h
//  HXWeChat
//
//  Created by 韩小胜 on 2018/1/1.
//  Copyright © 2018年 HX. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kGAP 10
/**
 *
 *  @param index      点击index
 *  @param dataSource 数据源
 */
typedef void (^TapBlcok)(NSInteger index,NSArray *dataSource);

@interface JGGView : UIView
/**
 *  九宫格显示的数据源，dataSource中可以放UIImage对象和NSString(http://sjfjfd.cjf.jpg)，还有NSURL也可以
 */
@property (nonatomic, retain)NSArray * dataSource;
/**
 *  TapBlcok
 */
@property (nonatomic, copy)TapBlcok  tapBlock;


@end
