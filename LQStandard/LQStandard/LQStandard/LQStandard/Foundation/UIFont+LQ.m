//
//  UIFont+LQ.m
//  足彩大赢家
//
//  Created by lequwuxian1 on 2017/12/18.
//  Copyright © 2017年 lequwuxian. All rights reserved.
//

#import "UIFont+LQ.h"

@implementation UIFont (LQ)

+(UIFont *)lqsFontOfSize:(CGFloat)fontSize
{
    return [self lqsFontOfSize:fontSize isBold:NO];
}

+(UIFont *)lqsFontOfSize:(CGFloat)fontSize isBold:(BOOL)aIsBold
{
    if (aIsBold) {
        return [UIFont boldSystemFontOfSize:fontSize * .5];
    }
    else {
        return [UIFont systemFontOfSize:fontSize * .5];
    }
}

+(UIFont *)lqsBEBASFontOfSize:(CGFloat)fontSize
{
    return [UIFont fontWithName:@"BEBAS" size:fontSize * .5];
}

@end
