//
//  RootTabBarController.m
//  HXWeChat
//
//  Created by 韩小胜 on 2017/12/28.
//  Copyright © 2017年 HX. All rights reserved.
//  

#import "RootTabBarController.h"
#import "BaseNavigationController.h"


#define kClassKey   @"rootVCClassString"
#define kTitleKey   @"title"
#define kImgKey     @"imageName"
#define kSelImgKey  @"selectedImageName"



@interface RootTabBarController ()

@end

@implementation RootTabBarController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *childItemsArray = @[
                                 @{kClassKey  : @"DiscoverViewController",
                                   kTitleKey  : @"发现",
                                   kImgKey    : @"tabbar_discover",
                                   kSelImgKey : @"tabbar_discoverHL"},
                                 
                                 @{kClassKey  : @"DiscoverViewController",
                                   kTitleKey  : @"发现",
                                   kImgKey    : @"tabbar_discover",
                                   kSelImgKey : @"tabbar_discoverHL"},
                                 
                                 @{kClassKey  : @"DiscoverViewController",
                                   kTitleKey  : @"发现",
                                   kImgKey    : @"tabbar_discover",
                                   kSelImgKey : @"tabbar_discoverHL"},
                                 
                                 @{kClassKey  : @"DiscoverViewController",
                                   kTitleKey  : @"发现",
                                   kImgKey    : @"tabbar_discover",
                                   kSelImgKey : @"tabbar_discoverHL"} ];
    
    [childItemsArray enumerateObjectsUsingBlock:^(NSDictionary *dict, NSUInteger idx, BOOL *stop) {
        UIViewController *vc = [NSClassFromString(dict[kClassKey]) new];
        vc.title = dict[kTitleKey];
        BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:vc];
        UITabBarItem *item = nav.tabBarItem;
        item.title = dict[kTitleKey];
        item.image = [UIImage imageNamed:dict[kImgKey]];
        item.selectedImage = [[UIImage imageNamed:dict[kSelImgKey]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [item setTitleTextAttributes:@{NSForegroundColorAttributeName : kThemeColor} forState:UIControlStateSelected];
        [self addChildViewController:nav];
    }];
    //self.selectedIndex = 1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}







@end
