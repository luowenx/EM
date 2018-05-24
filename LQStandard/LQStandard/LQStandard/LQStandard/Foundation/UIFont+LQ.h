//
//  UIFont+LQ.h
//  足彩大赢家
//
//  Created by lequwuxian1 on 2017/12/18.
//  Copyright © 2017年 lequwuxian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (LQ)

/**
 标注字体转ios字体

 @param fontSize <#fontSize description#>
 @return <#return value description#>
 */
+(UIFont *)lqsFontOfSize:(CGFloat)fontSize;

+(UIFont *)lqsFontOfSize:(CGFloat)fontSize isBold:(BOOL)aIsBold;

/**
 比分字体

 @param fontSize <#fontSize description#>
 @return <#return value description#>
 */
+(UIFont *)lqsBEBASFontOfSize:(CGFloat)fontSize;


@end
