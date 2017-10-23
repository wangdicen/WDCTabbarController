//
//  WDCPlusButton.h
//  Exercise
//
//  Created by 谢豪杰 on 2017/10/23.
//  Copyright © 2017年 谢豪杰. All rights reserved.
//
@import Foundation;
#import <UIKit/UIKit.h>

//------------ 协议
@protocol WDCPlusButtonDelegate

@required
+(instancetype)plusButton;
@optional
+ (NSUInteger)indexOfPlusButtonInTabBar;
+ (CGFloat)multiplerInCenterY;

@end

//-------------  通过extern定义一个遵守加按钮协议的 外部变量
//-------------  可以获取到其他文件中的同名全局变量.
@class WDCTabBar;

extern UIButton<WDCPlusButtonDelegate> *WDCExternPushlishButton;




@interface WDCPlusButton : UIButton

+(void)registerSubclass;

@end
