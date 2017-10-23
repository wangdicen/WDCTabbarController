//
//  WDCTabBarController.h
//  Exercise
//
//  Created by 谢豪杰 on 2017/10/23.
//  Copyright © 2017年 谢豪杰. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *const WDCTabBarItemTitle= @"tabBarItemTitle";
static NSString *const WDCTabBarItemImage= @"tabBarItemImage";
static NSString *const WDCTabBarItemSelectedImage= @"tabBarItemSelectedImage";

extern NSUInteger WDCTabbarItemsCount;

@interface WDCTabBarController : UITabBarController

@property (nonatomic, readwrite, copy) NSArray *viewControllers;
@property (nonatomic, readwrite, copy) NSArray *tabBarItemsAttributes;

@end


@interface  UIViewController(WDCTabBarController)

@property(nonatomic, readonly) WDCTabBarController *wdc_tabBarController;
@end
