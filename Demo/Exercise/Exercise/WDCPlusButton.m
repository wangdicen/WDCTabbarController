//
//  WDCPlusButton.m
//  Exercise
//
//  Created by 谢豪杰 on 2017/10/23.
//  Copyright © 2017年 谢豪杰. All rights reserved.
//

#import "WDCPlusButton.h"

UIButton<WDCPlusButtonDelegate> *WDCExternPushlishButton = nil;

@interface WDCPlusButton ()<UIActionSheetDelegate>

@end

@implementation WDCPlusButton

+ (void)registerSubclass{
    if ([self conformsToProtocol:@protocol(WDCPlusButtonDelegate)]) {
        Class<WDCPlusButtonDelegate> class = self;
        WDCExternPushlishButton = [class plusButton];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
