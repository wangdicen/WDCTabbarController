//
//  WDCTabBarControllerConfig.m
//  Exercise
//
//  Created by 谢豪杰 on 2017/10/23.
//  Copyright © 2017年 谢豪杰. All rights reserved.
//

#import "WDCTabBarControllerConfig.h"

@interface WDCTabBarControllerConfig ()

@property (nonatomic, readwrite, strong) WDCTabBarController *tabBarController;

@end


@implementation WDCTabBarControllerConfig
- (WDCTabBarController *)tabBarController
{
    if (!_tabBarController) {
        UIViewController *homeVC = [[UIViewController alloc] init];
        homeVC.title = @"首页";
        UINavigationController *firstNavigationController = [[UINavigationController alloc]
                                                             initWithRootViewController:homeVC];
        
        UIViewController *communityVC = [[UIViewController alloc] init];
        communityVC.title = @"发现";
        UINavigationController *secondNavigationController = [[UINavigationController alloc]
                                                              initWithRootViewController:communityVC];
        
        UIViewController *searchVC = [[UIViewController alloc] init];
        searchVC.title = @"消息";
        UINavigationController *thirdNavigationController = [[UINavigationController alloc]
                                                             initWithRootViewController:searchVC];
        
        UIViewController *profileVC = [[UIViewController alloc] init];
        profileVC.title = @"我";
        UINavigationController *fourthNavigationController = [[UINavigationController alloc]
                                                              initWithRootViewController:profileVC];
        
        WDCTabBarController *tabBarController = [[WDCTabBarController alloc] init];
        
        [self customizeTabBarForController:tabBarController];
        
        [tabBarController setViewControllers:@[
                                               firstNavigationController,
                                               secondNavigationController,
                                               thirdNavigationController,
                                               fourthNavigationController
                                               ]];
        _tabBarController = tabBarController;
    }
    return _tabBarController;
}

/*
 *
 在`-setViewControllers:`之前设置TabBar的属性，
 *
 */
- (void)customizeTabBarForController:(WDCTabBarController *)tabBarController {
    
    NSDictionary *dict1 = @{
                            WDCTabBarItemTitle : @"",
                            WDCTabBarItemImage : @"tab_首页",
                            WDCTabBarItemSelectedImage : @"tab_首页_pressed",
                            };
    NSDictionary *dict2 = @{
                            WDCTabBarItemTitle : @"",
                            WDCTabBarItemImage : @"tab_社区",
                            WDCTabBarItemSelectedImage : @"tab_社区_pressed",
                            };
    NSDictionary *dict3 = @{
                            WDCTabBarItemTitle : @"",
                            WDCTabBarItemImage : @"tab_分类",
                            WDCTabBarItemSelectedImage : @"tab_分类_pressed",
                            };
    NSDictionary *dict4 = @{
                            WDCTabBarItemTitle : @"",
                            WDCTabBarItemImage : @"tab_我的",
                            WDCTabBarItemSelectedImage : @"tab_我的_pressed"
                            };
    NSArray *tabBarItemsAttributes = @[ dict1, dict2, dict3, dict4 ];
    tabBarController.tabBarItemsAttributes = tabBarItemsAttributes;
    
    [self setUpTabBarItemTextAttributes];
}

/**
 *  tabBarItem 的选中和不选中文字属性
 */
- (void)setUpTabBarItemTextAttributes {
    
    // 普通状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor colorWithRed:((float)((0xec5252 & 0xFF0000) >> 16))/255.0
                                                                    green:((float)((0xec5252 & 0xFF00) >> 8))/255.0
                                                                     blue:((float)(0xec5252 & 0xFF))/255.0 alpha:1.0];
    
    // 设置文字属性
    UITabBarItem *tabBar = [UITabBarItem appearance];
    [tabBar setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [tabBar setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    UITabBar *tabBarAppearance = [UITabBar appearance];
    [tabBarAppearance setBackgroundImage:[UIImage imageNamed:@"tab_bar_bg"]];
}
@end
