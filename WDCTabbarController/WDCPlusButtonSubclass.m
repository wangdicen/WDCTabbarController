//
//  WDCPlusButtonSubclass.m
//  Exercise
//
//  Created by 谢豪杰 on 2017/10/23.
//  Copyright © 2017年 谢豪杰. All rights reserved.
//

#import "WDCPlusButtonSubclass.h"

@implementation WDCPlusButtonSubclass

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+(void)load {
    [super registerSubclass];
}
-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        //        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        //        self.adjustsImageWhenHighlighted = NO;
    }
    
    return self;
}


+ (instancetype)plusButton
{
    
    UIImage *buttonImage = [UIImage imageNamed:@"tab_publish_add"];
    UIImage *highlightImage = [UIImage imageNamed:@"tab_publish_add_pressed"];
    UIImage *iconImage = [UIImage imageNamed:@"tab_publish_add"];
    UIImage *highlightIconImage = [UIImage imageNamed:@"tab_publish_add_pressed"];
    
    WDCPlusButtonSubclass *button = [WDCPlusButtonSubclass buttonWithType:UIButtonTypeCustom];
    
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin;
    button.frame = CGRectMake(0.0, 0.0, buttonImage.size.width, buttonImage.size.height);
    [button setImage:iconImage forState:UIControlStateNormal];
    [button setImage:highlightIconImage forState:UIControlStateHighlighted];
    [button setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [button setBackgroundImage:highlightImage forState:UIControlStateHighlighted];
    [button addTarget:button action:@selector(clickPublish) forControlEvents:UIControlEventTouchUpInside];
    
    return button;
    ;
}
- (void)clickPublish {
    
}

@end
