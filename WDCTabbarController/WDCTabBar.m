//
//  WDCTabBar.m
//  Exercise
//
//  Created by 谢豪杰 on 2017/10/23.
//  Copyright © 2017年 谢豪杰. All rights reserved.
//

#import "WDCTabBar.h"
@interface WDCTabBar()

@property (nonatomic, strong) UIButton<WDCPlusButtonDelegate> *plusButton;

@end

@implementation WDCTabBar
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self = [self sharedInit];
    }
    return self;
}

- (instancetype)initWithCoder: (NSCoder *)aDecoder {
    self = [super initWithCoder: aDecoder];
    if (self) {
        self = [self sharedInit];
    }
    return self;
}

- (instancetype)sharedInit {
    if (WDCExternPushlishButton) {
        
        //获取到在WDCPlusButton中获取到的加号按钮.
        self.plusButton = WDCExternPushlishButton;
        [self addSubview:(UIButton *)self.plusButton];
    }
//    [self setBackgroundImage:[self imageWithColor:[UIColor greenColor]]];
    return self;
}


//加入加号按钮之后重新布局tabbar
-(void)layoutSubviews{
    [super layoutSubviews];
    
    //如果没有加号按钮直接返回
    if (!WDCExternPushlishButton) {
        return;
    }
    //获取tabbar的长宽
    CGFloat barWidth = self.frame.size.width;
    CGFloat barHeight = self.frame.size.height;
    
    //获得每一个按钮的宽度
    CGFloat tabBarButtonW = (CGFloat) barWidth / (WDCTabbarItemsCount + 1);
   
    NSInteger buttonIndex = 0;
    
    //找到plusbutton的协议方法,来设置按钮是否自定义设置高度
    CGFloat multiplerInCenterY;
    if ([[self.plusButton class] respondsToSelector:@selector(multiplerInCenterY)]) {
        multiplerInCenterY = [[self.plusButton class] multiplerInCenterY];
    }
    else {
        CGSize sizeOfPlusButton = self.plusButton.frame.size;
        CGFloat heightDifference = sizeOfPlusButton.height - self.bounds.size.height;
        //如果按钮高度比tabbar低,设置按钮中心为tabbar高度的一般
        if (heightDifference < 0) {
            multiplerInCenterY = 0.5;
        }
        //如果按钮高度比tabbar还高,重新计算按钮高度比例.
        else {
            CGPoint center = CGPointMake(self.bounds.size.height / 2.0f, self.bounds.size.height / 2.0f);
            center.y = center.y - heightDifference / 2.0f;
            multiplerInCenterY = center.y/self.bounds.size.height;
        }
    }
    
    self.plusButton.center = CGPointMake(barWidth * 0.5, barHeight * multiplerInCenterY);
    
    
    //确定要plusbtn的中心位置之后,再来调整如果它为奇数个按钮的时候的情况,通过协议的方法来改变按钮的位置
    NSUInteger plusButtonIndex;
    if ([[self.plusButton class] respondsToSelector:@selector(indexOfPlusButtonInTabBar)]) {
        if (WDCTabbarItemsCount % 2 == 0) {
            [NSException raise:@"CYLTabBarController" format:@"If the count of CYLTabbarControllers is not odd,there's no need to realizse `+indexOfPlusButtonInTabBar` in your custom plusButton class.【中文】如果CYLTabbarControllers的个数不是奇数，会自动居中，你无需在你自定义的plusButton中实现`+indexOfPlusButtonInTabBar`，来指定plusButton的位置"];
        }
        plusButtonIndex = [[self.plusButton class] indexOfPlusButtonInTabBar];
        //仅修改self.plusButton的x,ywh值不变
        self.plusButton.frame = CGRectMake(plusButtonIndex*tabBarButtonW,
                                           CGRectGetMinY(self.plusButton.frame),
                                           CGRectGetWidth(self.plusButton.frame),
                                           CGRectGetHeight(self.plusButton.frame)
                                           );
    }
    else {
        if (WDCTabbarItemsCount % 2 != 0) {
            [NSException raise:@"CYLTabBarController" format:@"If the count of CYLTabbarControllers is odd,you must realizse `+indexOfPlusButtonInTabBar` in your custom plusButton class.【中文】如果CYLTabbarControllers的个数是奇数，你必须在你自定义的plusButton中实现`+indexOfPlusButtonInTabBar`，来指定plusButton的位置"];
        }
        plusButtonIndex = WDCTabbarItemsCount / 2.0;
    }
    
    for (UIView *childView in self.subviews) {
        //调整加号按钮后面的UITabBarItem的位置
        if ([childView isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            if (buttonIndex == plusButtonIndex) {
                buttonIndex++;
            }
            //仅修改childView的宽度,xyh值不变
            childView.frame = CGRectMake(CGRectGetMinX(childView.frame),
                                         CGRectGetMinY(childView.frame) + 2,
                                         tabBarButtonW,
                                         CGRectGetHeight(childView.frame)
                                         );
            //仅修改childView的x,ywh值不变
            childView.frame = CGRectMake(buttonIndex*tabBarButtonW,
                                         CGRectGetMinY(childView.frame) + 2,
                                         CGRectGetWidth(childView.frame),
                                         CGRectGetHeight(childView.frame)
                                         );
            buttonIndex++;
        }
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
//- (UIImage *)imageWithColor:(UIColor *)color
//{
//    NSParameterAssert(color != nil);
//
//    CGRect rect = CGRectMake(0, 0, 1, 1);
//    // Create a 1 by 1 pixel context
//    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
//    [color setFill];
//    UIRectFill(rect);   // Fill it with your color
//    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//
//    return image;
//}


//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
//{
//    if (!self.clipsToBounds && !self.hidden && self.alpha > 0) {
//        for (UIView *subview in self.subviews.reverseObjectEnumerator) {
//            CGPoint subPoint = [subview convertPoint:point fromView:self];
//            UIView *result = [subview hitTest:subPoint withEvent:event];
//            if (result != nil) {
//                return result;
//            }
//        }
//    }
//    return nil;
//}
@end
