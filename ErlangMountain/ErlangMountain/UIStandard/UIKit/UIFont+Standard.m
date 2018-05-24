//
//  UIFont+emtandard.m
//  emtandard
//
//  Created by iEason on 16/9/12.
//  Copyright © 2016年 michong. All rights reserved.
//

#import "UIFont+Standard.h"

#define MCFontImplement(FONT_NAME,FONT_SIZE,ISBOLD) \
+ (UIFont *)FONT_NAME { \
    static UIFont *FONT_NAME##_font;    \
    static dispatch_once_t FONT_NAME##_onceToken;   \
    dispatch_once(&FONT_NAME##_onceToken, ^{    \
        if (ISBOLD) {   \
            FONT_NAME##_font = [UIFont boldSystemFontOfSize:FONT_SIZE];  \
        } else {  \
            FONT_NAME##_font = [UIFont systemFontOfSize:FONT_SIZE];  \
        }   \
    }); \
    return FONT_NAME##_font;\
}

@implementation UIFont (EMtandard)

//细黑
MCFontImplement(emFontMax, 36, NO);
MCFontImplement(emFontHuge, 27, NO);
MCFontImplement(emFontMedium, 24, NO);
MCFontImplement(emFontLarge, 20, NO);
MCFontImplement(emFontNormal, 18, NO);
MCFontImplement(emFontSmall, 15, NO);
MCFontImplement(emFontSmaller, 14, NO);
MCFontImplement(emFontMini, 12, NO);
MCFontImplement(emFontTiny, 11, NO);
MCFontImplement(emFontMinimum, 10, NO);

//黑体
MCFontImplement(emFontBoldMax, 36, YES);
MCFontImplement(emFontBoldHuge, 27, YES);
MCFontImplement(emFontBoldMedium, 24, YES);
MCFontImplement(emFontBoldLarge, 20, YES);
MCFontImplement(emFontBoldNormal, 18, YES);
MCFontImplement(emFontBoldSmall, 15, YES);
MCFontImplement(emFontBoldSmaller, 14, YES);
MCFontImplement(emFontBoldMini, 12, YES);
MCFontImplement(emFontBoldTiny, 11, YES);
MCFontImplement(emFontBoldMinimum, 10, YES);

+(UIFont *)emFontOfSize:(CGFloat)fontSize isBold:(BOOL)aIsBold
{
    if (aIsBold) {
        return [UIFont boldSystemFontOfSize:fontSize];
    }
    else {
        return [UIFont systemFontOfSize:fontSize];
    }
}

@end
